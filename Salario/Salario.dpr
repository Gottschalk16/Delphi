program Salario;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  ClassRemuneracao in 'ClassRemuneracao.pas',
  InterfaceRemuneracao in 'InterfaceRemuneracao.pas',
  ClassRemuneracaoEstagio in 'ClassRemuneracaoEstagio.pas',
  ClassFolhaPgto in 'ClassFolhaPgto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
