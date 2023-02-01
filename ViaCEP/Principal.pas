unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Vcl.StdCtrls, IPPeerClient, Data.Bind.Components, Data.Bind.ObjectScope,
  uIInterfaces, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  VCLTee.TeCanvas, VCLTee.TeeEdiGrad, Vcl.ExtCtrls, System.Types;

type
  TfrmConsultaCEP = class(TForm)
    DBGridCEP: TDBGrid;
    CDSCep: TClientDataSet;
    DSCep: TDataSource;
    CDSCepCEP: TStringField;
    CDSCepCidade: TStringField;
    CDSCepLogradouro: TStringField;
    CDSCepComplemento: TStringField;
    CDSCepBairro: TStringField;
    CDSCepUF: TStringField;
    CDSCepIBGE: TStringField;
    CDSCepGIA: TStringField;
    CDSCepDDD: TStringField;
    CDSCepSIAFI: TStringField;
    btnConsultarCEP: TButtonGradient;
    edCEP: TLabeledEdit;
    procedure btnConsultarCEPClick(Sender: TObject);
    procedure edCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CDSCepCEPChange(Sender: TField);
    procedure CDSCepCidadeChange(Sender: TField);
    procedure CDSCepLogradouroChange(Sender: TField);
    procedure CDSCepComplementoChange(Sender: TField);
    procedure CDSCepBairroChange(Sender: TField);
    procedure CDSCepIBGEChange(Sender: TField);
    procedure CDSCepGIAChange(Sender: TField);
    procedure CDSCepSIAFIChange(Sender: TField);
  private
    function ConsultaCEP: string;
    procedure AtribuirCEP(AcJSON: string);
    function VerificarTamanhoColuna(nIndiceColuna: Integer): Boolean;
    procedure AtualizaTamanhoColuna(nIndiceColuna: Integer);
    function RetornaIndiceCds(cField: string): Integer;
  public
  end;

var
  frmConsultaCEP: TfrmConsultaCEP;

implementation

uses
  uRest, uParametrosRest, Tipos, VIACEP,
  REST.JSON, Math;

{$R *.dfm}

procedure TfrmConsultaCEP.AtribuirCEP(AcJSON: string);
var
  oViaCEP: TViaCep;
begin
  oViaCEP := TJson.JsonToObject<TViaCep>(AcJSON);
  try
    if not (CDSCep.Locate('cep', oViaCEP.CEP, [])) then begin
      CDSCep.Insert;
      CDSCepCEP.AsString := oViaCEP.CEP;
      CDSCepUF.AsString := oViaCEP.UF;
      CDSCepCidade.AsString := oViaCEP.Localidade;
      CDSCepLogradouro.AsString := oViaCEP.Logradouro;
      CDSCepComplemento.AsString := oViaCEP.Complemento;
      CDSCepBairro.AsString := oViaCEP.Bairro;
      CDSCepIBGE.AsString := oViaCEP.IBGE;
      CDSCepGIA.AsString := oViaCEP.Gia;
      CDSCepDDD.AsString := oViaCEP.DDD;
      CDSCepSIAFI.AsString := oViaCEP.SiaFi;
      CDSCep.Post;
    end;
  finally
    FreeAndNil(oViaCEP);
  end;
end;

procedure TfrmConsultaCEP.AtualizaTamanhoColuna(nIndiceColuna: Integer);
begin
    DBGridCEP.Columns.Items[nIndiceColuna].Width := DBGridCEP.Canvas.TextWidth(CDSCep.FieldByName(DBGridCEP.Columns[nIndiceColuna].Field.FieldName).AsString) + 5;
end;

procedure TfrmConsultaCEP.btnConsultarCEPClick(Sender: TObject);
var
  cJSON: string;
begin
  cJSON := ConsultaCEP;
  AtribuirCEP(cJSON);
end;

procedure TfrmConsultaCEP.CDSCepBairroChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('bairro')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('bairro'));
end;

procedure TfrmConsultaCEP.CDSCepCEPChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('cep')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('cep'));
end;

procedure TfrmConsultaCEP.CDSCepCidadeChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('cidade')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('cidade'));
end;

procedure TfrmConsultaCEP.CDSCepComplementoChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('complemento')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('complemento'));
end;

procedure TfrmConsultaCEP.CDSCepGIAChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('gia')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('gia'));
end;

procedure TfrmConsultaCEP.CDSCepIBGEChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('ibge')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('ibge'));
end;

procedure TfrmConsultaCEP.CDSCepLogradouroChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('logradouro')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('logradouro'));
end;

procedure TfrmConsultaCEP.CDSCepSIAFIChange(Sender: TField);
begin
  if VerificarTamanhoColuna(RetornaIndiceCds('siafi')) then
    AtualizaTamanhoColuna(RetornaIndiceCds('siafi'));
end;

function TfrmConsultaCEP.ConsultaCEP: string;
var
  oRest: iRest;
  oParametrosRest: IConfiguracao;
begin
  oParametrosRest := TConfiguracao.
                       New.
                         URL('viacep.com.br/ws/' + StringReplace(edCEP.Text, '-', '', []) + '/json/').
                         ContentType(tctApplicationJSON).
                         Accept(taUTF8).
                         Method(tmGET).
                       &End.
                     &End;
  oRest := TRest.
             New.
               RESTRequest(oParametrosRest).
               Execute.
             &End.
           &End;
  Result := oRest.Content;
end;

procedure TfrmConsultaCEP.edCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnConsultarCEP.Click;
end;

function TfrmConsultaCEP.RetornaIndiceCds(cField: string): Integer;
begin
  result := CDSCep.FieldByName(cField).Index;
end;

function TfrmConsultaCEP.VerificarTamanhoColuna(nIndiceColuna: Integer): Boolean;
begin
  Result := System.Math.CompareValue(DBGridCEP.Columns.Items[nIndiceColuna].Width,
            DBGridCEP.Canvas.TextWidth(CDSCep.FieldByName(DBGridCEP.Columns[nIndiceColuna].Field.FieldName).AsString) + 5) = System.Types.LessThanValue;
end;

end.
