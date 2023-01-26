program Projeto;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmConsultaCEP},
  uIInterfaces in 'uIInterfaces.pas',
  uREST in 'uREST.pas',
  uParametrosRest in 'uParametrosRest.pas',
  Tipos in 'Tipos.pas',
  VIACEP in 'VIACEP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConsultaCEP, frmConsultaCEP);
  Application.Run;
end.
