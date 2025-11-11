unit UNIT1_CONTATOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.StdCtrls, FireDAC.Comp.DataSet,
  Data.Bind.DBScope, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TFORM_CONTATOS = class(TForm)
    txt_ID: TEdit;
    txt_NOME: TEdit;
    txt_TELEFONE: TEdit;
    txt_EMAIL: TEdit;
    txt_OBS: TMemo;
    lbl_ID: TLabel;
    lbl_NOME: TLabel;
    lbl_TELEFONE: TLabel;
    lbl_EMAIL: TLabel;
    lbl_OBS: TLabel;
    FDConnection1: TFDConnection;
    FDContatos: TFDTable;
    DataSource1: TDataSource;
    BtnNovo: TButton;
    BtnSalvar: TButton;
    status: TLabel;
    btnPos: TButton;
    btnAnt: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnCancelar: TButton;
    txt_PROCURA: TEdit;
    btnProcura: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ConectaBanco();
    procedure BuscaContatos();
    procedure CriaContato();
    procedure ExcluiContato();
    procedure AlteraContato();
    procedure SalvaContato();
    procedure CancelaOperacao();
    procedure BuscaContatoPorId();
    procedure bloqueiaCampos();
    procedure LimpaCampos();
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnAntClick(Sender: TObject);
    procedure btnPosClick(Sender: TObject);

    procedure FDContatosBeforePost(DataSet: TDataSet);
    procedure btnProcuraClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_CONTATOS: TFORM_CONTATOS;
  ehConectado: Boolean;
  operacao: String;

implementation

{$R *.dfm}

procedure TFORM_CONTATOS.FDContatosBeforePost(DataSet: TDataSet);
begin

  FDContatos.FieldByName('nome').AsString := txt_NOME.Text;
  FDContatos.FieldByName('telefone').AsString := txt_TELEFONE.Text;
  FDContatos.FieldByName('email').AsString := txt_EMAIL.Text;
  FDContatos.FieldByName('observacao').AsString := txt_OBS.Text;

end;

procedure TFORM_CONTATOS.FormCreate(Sender: TObject);
begin
  operacao  := '';
  ehConectado := false;
  ConectaBanco;
  if ehConectado = true then
    BuscaContatos;
end;

procedure TFORM_CONTATOS.ConectaBanco();
begin

  FDConnection1.Params.Database :=  GetCurrentDir + '\assets\contatos.mdb';
  FDConnection1.Connected := True;
  FDContatos.TableName := 'contatos';
  FDContatos.Active  := True;

  if FDConnection1.Connected = true then
  begin
    status.Caption := 'CONECTADO';
    ehConectado := true;
  end
  else
    status.Caption := 'DESCONECTADO'

end;

procedure TFORM_CONTATOS.BtnNovoClick(Sender: TObject);
begin
  CriaContato;
end;

procedure TFORM_CONTATOS.BtnSalvarClick(Sender: TObject);
begin
  SalvaContato;
end;

procedure TFORM_CONTATOS.BtnExcluirClick(Sender: TObject);
begin
  ExcluiContato;
end;

procedure TFORM_CONTATOS.BtnAlterarClick(Sender: TObject);
begin
  AlteraContato;
end;

procedure TFORM_CONTATOS.BtnCancelarClick(Sender: TObject);
begin
  CancelaOperacao;
end;

procedure TFORM_CONTATOS.btnAntClick(Sender: TObject);
begin
  FDContatos.Prior;
  BuscaContatos;
end;

procedure TFORM_CONTATOS.btnPosClick(Sender: TObject);
begin
  FDContatos.Next;
  BuscaContatos;
end;

procedure TFORM_CONTATOS.btnProcuraClick(Sender: TObject);
begin
  BuscaContatoPorId;
end;

// Funções

procedure TFORM_CONTATOS.BuscaContatos();
begin
  txt_ID.Text := FDContatos.FieldByName('id').AsString;
  txt_NOME.Text := FDContatos.FieldByName('nome').AsString;
  txt_TELEFONE.Text := FDContatos.FieldByName('telefone').AsString;
  txt_EMAIL.Text := FDContatos.FieldByName('email').AsString;
  txt_OBS.Text := FDContatos.FieldByName('observacao').AsString;
end;

procedure TFORM_CONTATOS.CriaContato();
begin
  FDContatos.Insert;
  if txt_ID.Text <> ''  then
    LimpaCampos;
  BloqueiaCampos;
  operacao := 'INSERINDO';
end;

procedure TFORM_CONTATOS.ExcluiContato();
begin
  if txt_ID.Text = '' then
    ShowMessage('Não há registro a ser excluído')
  else
  begin
    FDContatos.Delete;
    BuscaContatos;
    ShowMessage('Contato excluído!');
    operacao := 'EXCLUINDO';
  end;
end;

procedure TFORM_CONTATOS.AlteraContato();
begin

  FDContatos.Edit;
  if txt_ID.Text = '' then
    ShowMessage('Não há registro a ser alterado')
  else
  begin
    FDContatos.Edit;
    bloqueiaCampos;
    operacao := 'ALTERANDO';
  end;

end;

procedure TFORM_CONTATOS.SalvaContato();
begin
  if operacao = '' then
    ShowMessage('Não há registro a ser salvo')
  else
  begin
    FDContatos.Post();
    BloqueiaCampos();
    ShowMessage('Cadastro realizado/alterado com sucesso!');
    BuscaContatos;
  end;

  operacao := '';

end;

procedure TFORM_CONTATOS.CancelaOperacao();
begin
  LimpaCampos;
  if (operacao = 'INSERINDO') or (operacao = '') then
    FDContatos.Last;
  BuscaContatos;
  bloqueiaCampos;

  operacao := '';

end;

procedure TFORM_CONTATOS.BuscaContatoPorId();
begin
  if FDContatos.FindKey([txt_PROCURA.Text]) then
     BuscaContatos()
  else
    ShowMessage('Não encontrado!');

  txt_PROCURA.Text := '';
end;

procedure TFORM_CONTATOS.BloqueiaCampos();
begin
  txt_NOME.Enabled := not txt_NOME.Enabled;
  txt_TELEFONE.Enabled := not txt_TELEFONE.Enabled;
  txt_EMAIL.Enabled := not txt_EMAIL.Enabled;
  txt_OBS.Enabled := not txt_OBS.Enabled;
end;

procedure TFORM_CONTATOS.LimpaCampos();
begin
  txt_ID.Text := '';
  txt_NOME.Text := '';
  txt_TELEFONE.Text := '';
  txt_EMAIL.Text := '';
  txt_OBS.Text := '';
end;

end.
