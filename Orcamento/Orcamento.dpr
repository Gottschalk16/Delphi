program Orcamento;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  Model.Interfaces in 'interfaces\Model.Interfaces.pas',
  Model.Records in 'models\Model.Records.pas',
  DlgBalancoCentroCto in 'frames\DlgBalancoCentroCto.pas' {frmBalancoCentroCto: TFrame},
  DlgOperacoes in 'frames\DlgOperacoes.pas' {frmOperacoes: TFrame},
  ClassFuncoes in 'funcoes\ClassFuncoes.pas',
  DlgAgrupCentroCto in 'frames\DlgAgrupCentroCto.pas' {frmAgrupCentroCto: TFrame},
  DlgAgrupCentroCtoFilho in 'frames\DlgAgrupCentroCtoFilho.pas' {frmAgrupCentroCtoFilho: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
