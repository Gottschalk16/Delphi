unit DlgBalancoFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Modal.Interfaces, Modal.Records,
  Vcl.StdCtrls;

type
  TfrmBalancoFinanceiro = class(TFrame, iObserver)
     lblBalancoFinan: TLabel;
     lblCredito: TLabel;
     lblVlrCredito: TLabel;
     lblVlrDebito: TLabel;
     lblDebitos: TLabel;
     lblSaldo: TLabel;
     lblVlrSaldo: TLabel;
  private
     FCreditos: Currency;
     FDebitos: Currency;
     property Creditos: Currency read FCreditos;
     property Debitos: Currency read FDebitos;
     function CalcularSaldo : Currency;
     procedure MostarValores;
  public
     procedure AtualizarCredito(_Notificacao: TNotificacao);
     procedure AtualizarDebito(_Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrame1 }


{ TfrmBalancoFinanceiro }

procedure TfrmBalancoFinanceiro.AtualizarCredito(_Notificacao: TNotificacao);
begin
   FCreditos := FCreditos + _Notificacao.Valor;
   MostarValores;
end;

procedure TfrmBalancoFinanceiro.AtualizarDebito(_Notificacao: TNotificacao);
begin
   FDebitos := FDebitos + _Notificacao.Valor;
   MostarValores;
end;

function TfrmBalancoFinanceiro.CalcularSaldo: Currency;
begin
   Result := Creditos - Debitos;
end;

procedure TfrmBalancoFinanceiro.MostarValores;
begin
   lblVlrCredito.Caption := FormatFloat('###,##0.00', Creditos);
   lblVlrDebito.Caption := FormatFloat('###,##0.00', Debitos);
   lblVlrSaldo.Caption := FormatFloat('###,##0.00', CalcularSaldo);
end;

end.
