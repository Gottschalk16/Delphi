unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGraphics, cxLookAndFeelPainters, cxLookAndFeels,
  dxCustomWizardControl, dxWizardControl, dxWizardControlForm, Vcl.StdCtrls,
  IPPeerClient, Data.Bind.Components, Data.Bind.ObjectScope, uIInterfaces,
  dxGaugeControl;

type
  TfrmConsultaCEP = class(TdxWizardControlForm)
    edCEP: TEdit;
    edCidade: TEdit;
    edBairro: TEdit;
    edComplemento: TEdit;
    edLogradouro: TEdit;
    edUF: TEdit;
    Button1: TButton;
    lbCEP: TLabel;
    lbCidade: TLabel;
    lbComplemento: TLabel;
    lbBairro: TLabel;
    lbLogradouro: TLabel;
    lbUF: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    function ConsultaCEP: string;
    procedure AtribuirCEP(AcJSON: string);
  public
  end;

var
  frmConsultaCEP: TfrmConsultaCEP;

implementation

uses
  uRest, uParametrosRest, Tipos, VIACEP,
  REST.JSON;

{$R *.dfm}

procedure TfrmConsultaCEP.AtribuirCEP(AcJSON: string);
var
  oViaCEP: TViaCep;
begin
  oViaCEP := TJson.JsonToObject<TViaCep>(AcJSON);
  try
    edCEP.Text := oViaCEP.CEP;
    edCidade.Text := oViaCEP.Localidade;
    edBairro.Text := oViaCEP.Bairro;
    edComplemento.Text := oViaCEP.Complemento;
    edLogradouro.Text := oViaCEP.Logradouro;
    edUF.Text := oViaCEP.UF;
  finally
    FreeAndNil(oViaCEP);
  end;
end;

procedure TfrmConsultaCEP.Button1Click(Sender: TObject);
var
  cJSON: string;
begin
  cJSON := ConsultaCEP;
  AtribuirCEP(cJSON);
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

end.
