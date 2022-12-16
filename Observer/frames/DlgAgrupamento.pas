unit DlgAgrupamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Modal.Interfaces, Modal.Records,
  Datasnap.DBClient;

type
  TfrmAgrupamento = class(TFrame, iObserver)
     DBGrid1: TDBGrid;
     lblAgrupamento: TLabel;
     CdsAgrupamento: TClientDataSet;
     DsAgrupamento: TDataSource;
     CdsAgrupamentoCategoria: TStringField;
     CdsAgrupamentoTotal: TCurrencyField;
  private
  public
     procedure AtualizarCredito(_Notificacao: TNotificacao);
     procedure AtualizarDebito(_Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TfrmAgrupamento }

procedure TfrmAgrupamento.AtualizarCredito(_Notificacao: TNotificacao);
begin
end;

procedure TfrmAgrupamento.AtualizarDebito(_Notificacao: TNotificacao);
begin
   if CdsAgrupamento.Locate('Categoria', _Notificacao.Categoria, []) then begin
      CdsAgrupamento.Edit;
      CdsAgrupamento.FieldByName('total').AsFloat := CdsAgrupamento.FieldByName('total').AsFloat + _Notificacao.Valor;
      CdsAgrupamento.Post;
   end else
      CdsAgrupamento.AppendRecord([_Notificacao.Categoria, _Notificacao.Valor]);
end;

end.
