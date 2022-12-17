unit DlgOperacoes;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
   Model.Interfaces, Model.Records, System.Generics.Collections;

type
   TfrmOperacoes = class(TFrame, iSubject)
      btnGravar: TButton;
      eCentroCto: TEdit;
      lblCentroCustos: TLabel;
      lblCentroCtoFilho: TLabel;
      eCentroCtoFilho: TEdit;
      DBOperacoes: TDBGrid;
      CdsOperacoes: TClientDataSet;
      eVlrOperacao: TEdit;
      CdsOperacoesCentroCto: TStringField;
      CdsOperacoesValor: TCurrencyField;
      DsOperacoes: TDataSource;
      lblVlrOrcamento: TLabel;
      procedure btnGravarClick(Sender: TObject);
      procedure eCentroCtoFilhoExit(Sender: TObject);
      procedure eCentroCtoExit(Sender: TObject);
    procedure eCentroCtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eCentroCtoFilhoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eVlrOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   private
      FObservers: TList<iObserver>;
      function ValidarCampos: Boolean;
   public
      procedure AdicionarObserver(_Observer: iObserver);
      procedure RemoverObserver(_Observer: iObserver);
      procedure Notificar;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
end;

implementation

{$R *.dfm}

uses
   ClassFuncoes;

{ TfrmOperacoes }

procedure TfrmOperacoes.AdicionarObserver(_Observer: iObserver);
begin
   FObservers.Add(_Observer);
end;

procedure TfrmOperacoes.btnGravarClick(Sender: TObject);
begin
   if not ValidarCampos then
      Exit;
   CdsOperacoes.AppendRecord([eCentroCto.Text + eCentroCtoFilho.Text, eVlrOperacao.Text]);
   Notificar;
end;

constructor TfrmOperacoes.Create(AOwner: TComponent);
begin
   inherited;
   FObservers := TList<iObserver>.Create;
end;

destructor TfrmOperacoes.Destroy;
begin
   FObservers.Free;
   inherited;
end;

procedure TfrmOperacoes.eCentroCtoExit(Sender: TObject);
begin
   eCentroCto.Text := TFuncoes.Zeros(eCentroCto.Text, 2);
end;

procedure TfrmOperacoes.eCentroCtoFilhoExit(Sender: TObject);
begin
   eCentroCtoFilho.Text := TFuncoes.Zeros(eCentroCtoFilho.Text, 4);
end;

procedure TfrmOperacoes.eCentroCtoFilhoKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if Key = VK_RETURN then
      eVlrOperacao.SetFocus;
end;

procedure TfrmOperacoes.eCentroCtoKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if Key = VK_RETURN then
      eCentroCtoFilho.SetFocus;
end;

procedure TfrmOperacoes.eVlrOperacaoKeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if Key = VK_RETURN then
      btnGravar.SetFocus;
end;

procedure TfrmOperacoes.Notificar;
var
   ACentroCto: TCentroCto;
   AObserver: iObserver;
begin
   ACentroCto.Codigo := CdsOperacoes.FieldByName('centrocto').AsString;
   ACentroCto.Valor := CdsOperacoes.FieldByName('valor').AsCurrency;
   for AObserver in FObservers do
      AObserver.AtualizarCentroCto(ACentroCto);
end;

procedure TfrmOperacoes.RemoverObserver(_Observer: iObserver);
begin
   FObservers.Delete(FObservers.IndexOf(_Observer));
end;

function TfrmOperacoes.ValidarCampos: Boolean;
const
   AMsgCentroCto = 'Centro de custos (%s) incorreto.' + sLineBreak + 'Valores aceitos: %s a %s.';
var
   AVlrOper: Currency;
begin
   Result := False;
   if (eCentroCto.Text = '00') or (Trim(eCentroCto.Text) = EmptyStr) then begin
      ShowMessage(Format(AMsgCentroCto, ['Pai', '01', '09']));
      eCentroCto.SetFocus;
      Exit;
   end;
   if (eCentroCtoFilho.Text = '0000') or (Trim(eCentroCtoFilho.Text) = EmptyStr) then begin
      ShowMessage(Format(AMsgCentroCto, ['Filho', '0001', '9999']));
      eCentroCtoFilho.SetFocus;
      Exit;
   end;
   if (not TryStrToCurr(eVlrOperacao.Text, AVlrOper)) then begin
      ShowMessage('Caracteres não permitidos no valor do orçamento.');
      eVlrOperacao.SetFocus;
      Exit;
   end;
   if (eVlrOperacao.Text = '0') then begin
      ShowMessage('O valor do orçamento deve ser maior que 0.');
      eVlrOperacao.SetFocus;
      Exit;
   end;
   Result := True;
end;

end.

