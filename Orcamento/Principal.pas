unit Principal;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   DlgBalancoCentroCto, DlgOperacoes, DlgAgrupCentroCtoFilho, DlgAgrupCentroCto;

type
   TfrmPrincipal = class(TForm)
      frmOperacoes: TfrmOperacoes;
      frmBalancoCentroCto: TfrmBalancoCentroCto;
      frmAgrupCentroCto: TfrmAgrupCentroCto;
      frmAgrupCentroCtoFilho: TfrmAgrupCentroCtoFilho;
      procedure FormCreate(Sender: TObject);
end;

var
   frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   frmOperacoes.AdicionarObserver(frmBalancoCentroCto);
   frmOperacoes.AdicionarObserver(frmAgrupCentroCto);
   frmOperacoes.AdicionarObserver(frmAgrupCentroCtoFilho);
end;

end.

