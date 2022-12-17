unit DlgAgrupCentroCto;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
   Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Model.Interfaces, Model.Records;

type
   TfrmAgrupCentroCto = class(TFrame, iObserver)
      DBAgrupamento: TDBGrid;
      CdsAgrupamento: TClientDataSet;
      DsAgrupamento: TDataSource;
      CdsAgrupamentoCentroCto: TStringField;
      CdsAgrupamentoValor: TCurrencyField;
   public
      procedure AtualizarCentroCto(_CentroCusto: TCentroCto);
end;

implementation

{$R *.dfm}

{ TfrmAgrupCentroCto }

procedure TfrmAgrupCentroCto.AtualizarCentroCto(_CentroCusto: TCentroCto);
begin
   if CdsAgrupamento.Locate('centrocto', Copy(_CentroCusto.Codigo, 0, 2), []) then begin
      CdsAgrupamento.Edit;
      CdsAgrupamento.FieldByName('valor').AsCurrency := CdsAgrupamento.FieldByName('valor').AsCurrency + _CentroCusto.Valor;
      CdsAgrupamento.Post;
   end else
      CdsAgrupamento.AppendRecord([Copy(_CentroCusto.Codigo, 0, 2), _CentroCusto.Valor]);
end;

end.

