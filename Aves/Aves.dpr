program Aves;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  InterfaceAves in 'InterfaceAves.pas',
  ClassAves in 'ClassAves.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
