unit DlgOperacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Modal.Interfaces,
  System.Generics.Collections, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmOperacoes = class(TFrame, iSubject)
     btnGravar: TButton;
     cbOperacao: TComboBox;
     cbCategoria: TComboBox;
    cdsOperacoes: TClientDataSet;
    eValor: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    lblValor: TLabel;
    DsOperacoes: TDataSource;
    cdsOperacoesOpercao: TStringField;
    cdsOperacoesCategoria: TStringField;
    cdsOperacoesValor: TCurrencyField;
    procedure btnGravarClick(Sender: TObject);
  private
     FObservers: TList<iObserver>;
  public
     constructor Create(_Owner: TComponent); override;
     destructor Destroy; override;
     procedure AdicionarObserver(_Observer: iObserver);
     procedure RemoverObserver(_Observer: iObserver);
     procedure Notificar;
  end;

implementation

uses
  Modal.Records;

{$R *.dfm}

{ TfrmOperacoes }

procedure TfrmOperacoes.AdicionarObserver(_Observer: iObserver);
begin
   FObservers.Add(_Observer);
end;

procedure TfrmOperacoes.btnGravarClick(Sender: TObject);
begin
   cdsOperacoes.AppendRecord([cbOperacao.Text, cbCategoria.Text, StrToFloatDef(eValor.Text, 0)]);
   Notificar;
end;

constructor TfrmOperacoes.Create(_Owner: TComponent);
begin
   inherited;
   FObservers := TList<iObserver>.Create;
end;

destructor TfrmOperacoes.Destroy;
begin
   FObservers.Free;
   inherited;
end;

procedure TfrmOperacoes.Notificar;
var
   ANotificacao : TNotificacao;
   AObserver    : iObserver;
begin
   ANotificacao.Categoria := cdsOperacoes.FieldByName('categoria').AsString;
   ANotificacao.Valor := cdsOperacoes.FieldByName('valor').AsCurrency;
   for AObserver in FObservers do
      if cbOperacao.Text = 'Crédito' then
         AObserver.AtualizarCredito(ANotificacao)
      else
         AObserver.AtualizarDebito(ANotificacao);
end;

procedure TfrmOperacoes.RemoverObserver(_Observer: iObserver);
begin
   FObservers.Delete(FObservers.IndexOf(_Observer));
end;

end.
