unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DlgLogs, DlgAgrupamento,
  DlgBalancoFinanceiro, DlgOperacoes;

type
  TfrmPrincipal = class(TForm)
    frmOperacoes1: TfrmOperacoes;
    frmBalancoFinanceiro1: TfrmBalancoFinanceiro;
    frmAgrupamento1: TfrmAgrupamento;
    frmLogs1: TfrmLogs;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   frmOperacoes1.AdicionarObserver(frmBalancoFinanceiro1);
   frmOperacoes1.AdicionarObserver(frmAgrupamento1);
   frmOperacoes1.AdicionarObserver(frmLogs1);
end;

end.
