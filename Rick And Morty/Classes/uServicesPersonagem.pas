unit uServicesPersonagem;

interface

uses
  uIRickAndMorty, System.Classes, REST.Types;

type
  TServicePersonagem = class(TInterfacedObject, IRickAndMorty)
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
      destructor Destroy;

      class function New: IRickAndMorty;
  end;

implementation

uses
  uIConfiguracaoRest, uIRest, uConfiguracao, uResourceString, uEnumeradores,
  uREST, System.SysUtils;

{ TServicePersonagem }

function TServicePersonagem.Buscar(_URL: string): IRickAndMorty;
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

function TServicePersonagem.Content: string;
begin
  Result := FContent;
end;

constructor TServicePersonagem.Create;
begin
  inherited;

end;

destructor TServicePersonagem.Destroy;
begin

end;

function TServicePersonagem.&End: IRickAndMorty;
begin
  Result := Self;
end;

function TServicePersonagem.Filter(_Name: string): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('character').&End.
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

function TServicePersonagem.Imagem(_AURL: string): TStream;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
  oStream : TMemoryStream;
begin
  oConfigRest := TConfiguracao.New.
                   URL(_AURL).&End.
                   ContentType(tctAplicationImage).&End.
                   Accept(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RestRequest(oConfigRest).
             Execute.
             &End.
           &End;
  oStream := TMemoryStream.Create;
  oStream.WriteBuffer(Pointer(oRest.RestResponse.RawBytes)^, Length(oRest.RestResponse.RawBytes));
  oStream.Position := 0;
  Result := oStream;
end;

function TServicePersonagem.Multiplos(_Id: string): IRickAndMorty;
begin
  Result := Self;
end;

class function TServicePersonagem.New: IRickAndMorty;
begin
  Result := Self.Create;
end;

function TServicePersonagem.Single(_Id: integer): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('character/{id}').&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RESTRequest(oConfigRest).
           &End;
  oRest.RestRequest.Params.AddItem('id', _Id.ToString, TRESTRequestParameterKind.pkURLSEGMENT);
  oRest.
    Execute.&End.
  &End;
  FContent := oRest.Content;
end;

function TServicePersonagem.Todos(_Index: Integer): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('character').&End.
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
