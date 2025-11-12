program PROJETO_CONTATOS;

uses
  Vcl.Forms,
  UNIT2_MENU in 'src\UNIT2_MENU.pas' {FORM_MENU},
  UNIT1_CONTATOS in 'src\UNIT1_CONTATOS.pas' {FORM_CONTATOS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFORM_MENU, FORM_MENU);
  Application.CreateForm(TFORM_CONTATOS, FORM_CONTATOS);
  Application.Run;
end.
