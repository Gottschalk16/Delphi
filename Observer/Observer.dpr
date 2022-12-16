program Observer;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  Modal.Subject in 'modals\Modal.Subject.pas',
  Modal.Observer in 'modals\Modal.Observer.pas',
  Modal.Interfaces in 'interfaces\Modal.Interfaces.pas',
  Modal.Records in 'modals\Modal.Records.pas',
  DlgBalancoFinanceiro in 'frames\DlgBalancoFinanceiro.pas' {frmBalancoFinanceiro: TFrame},
  DlgAgrupamento in 'frames\DlgAgrupamento.pas' {frmAgrupamento: TFrame},
  DlgLogs in 'frames\DlgLogs.pas' {frmLogs: TFrame},
  DlgOperacoes in 'frames\DlgOperacoes.pas' {frmOperacoes: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
