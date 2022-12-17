unit DlgBalancoCentroCto;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Model.Interfaces, Model.Records, Vcl.StdCtrls;

type
   TfrmBalancoCentroCto = class(TFrame, iObserver)
   private
      FTotOrcamento: Currency;
      property TotalOrcamento: Currency read FTotOrcamento;
      procedure MostarValores;
   public
      procedure AtualizarCentroCto(_CentroCusto: TCentroCto);
end;

implementation

{$R *.dfm}

{ TfrmBalancoCentroCto }

procedure TfrmBalancoCentroCto.AtualizarCentroCto(_CentroCusto: TCentroCto);
begin
   FTotOrcamento := FTotOrcamento + _CentroCusto.Valor;
   MostarValores;
end;

procedure TfrmBalancoCentroCto.MostarValores;
begin
   ShowMessage('Total do orçamento: R$' + FormatFloat('###,##0.00', TotalOrcamento));
end;

end.

