unit uServicesLocalizacao;

interface

uses
  uIRickAndMorty, System.Classes;

type
  TServiceLocalizacao = class(TInterfacedObject, IRickAndMorty)
    private
      FContent: string;
    public
      function Todos(_Index: Integer): IRickAndMorty;
      function Single(_Id: integer): IRickAndMorty;
      function Filter(_Name: string): IRickAndMorty;
      function Multiplos(_Id: string): IRickAndMorty;

      function Buscar(_URL: string): IRickAndMorty;

      function &End: IRickAndMorty;

      function Imagem(_AURL: string): TStream;

      function Content: string;

      constructor Create;
      destructor Destroy; override;

      class function New: IRickAndMorty;
  end;

implementation

uses
  uIConfiguracaoRest, uIRest, uConfiguracao,
  uREST, uResourceString, uEnumeradores,
  System.SysUtils;

{ TServiceLocalizacao }

function TServiceLocalizacao.Buscar(_URL: string): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(_URL).&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RESTRequest(oConfigRest).
             Execute.&End.
           &End;
  FContent := oRest.Content;
end;

function TServiceLocalizacao.Content: string;
begin
  Result := FContent;
end;

constructor TServiceLocalizacao.Create;
begin
  inherited;

end;

destructor TServiceLocalizacao.Destroy;
begin

  inherited;
end;

function TServiceLocalizacao.&End: IRickAndMorty;
begin
  Result := Self;
end;

function TServiceLocalizacao.Filter(_Name: string): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('location').&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RESTRequest(oConfigRest).
           &End;
  oRest.RestRequest.AddParameter('name', _Name);
  oRest.
    Execute.&End.
  &End;
  FContent := oRest.Content;
end;

function TServiceLocalizacao.Imagem(_AURL: string): TStream;
begin
  Result := nil;
end;

function TServiceLocalizacao.Multiplos(_Id: string): IRickAndMorty;
begin
  Result := Self;
end;

class function TServiceLocalizacao.New: IRickAndMorty;
begin
  Result := Self.Create;
end;

function TServiceLocalizacao.Single(_Id: integer): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('location/' + _Id.ToString).&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RESTRequest(oConfigRest).&End.
             Execute.&End.
           &End;
  FContent := oRest.Content;
end;

function TServiceLocalizacao.Todos(_Index: Integer): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('location').&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RESTRequest(oConfigRest).
           &End;
  oRest.RestRequest.AddParameter('page', _Index.ToString);
  oRest.
    Execute.&End.
  &End;
  FContent := oRest.Content;
end;

end.
