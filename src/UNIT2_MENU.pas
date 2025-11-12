unit UNIT2_MENU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.StdCtrls;

type
  TFORM_MENU = class(TForm)
    img_fundo: TImage;
    lbl_titulo: TLabel;
    MainMenu1: TMainMenu;
    MenuPrincipal1: TMenuItem;
    Contatos: TMenuItem;
    Sair: TMenuItem;
    procedure SairClick(Sender: TObject);
    procedure ContatosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FORM_MENU: TFORM_MENU;

implementation

{$R *.dfm}

uses UNIT1_CONTATOS;

procedure TFORM_MENU.ContatosClick(Sender: TObject);
begin
  FORM_CONTATOS.Show;
end;

procedure TFORM_MENU.SairClick(Sender: TObject);
begin
  FORM_MENU.Close;
end;

end.
