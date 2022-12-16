unit DlgLogs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, modal.Interfaces,
  modal.Records;

type
  TfrmLogs = class(TFrame, iObserver)
    mLogs: TMemo;
    lblLogs: TLabel;
  private
  public
     procedure AtualizarCredito(_Notificacao: TNotificacao);
     procedure AtualizarDebito(_Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TfrmLogs }

procedure TfrmLogs.AtualizarCredito(_Notificacao: TNotificacao);
var
   AStr: string;
begin
   AStr := Format('Uma operação de Crédito de %.2f foi adicionada', [_Notificacao.Valor]);
   mLogs.Lines.Add(AStr);
end;

procedure TfrmLogs.AtualizarDebito(_Notificacao: TNotificacao);
var
   AStr: string;
begin
   AStr := Format('Uma operação de Débito de %.2f foi adicionada', [_Notificacao.Valor]);
   mLogs.Lines.Add(AStr);
end;

end.
