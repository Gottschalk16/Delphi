unit uServicesEpisodios;

interface

uses
  uIRickAndMorty, System.Classes;

type
  TServiceEpisodio = class(TInterfacedObject, IRickAndMorty)
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
  uEnumeradores, uREST, uResourceString,
  System.SysUtils;

{ TServiceEpisodio }

function TServiceEpisodio.Buscar(_URL: string): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(_URL).&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   AcceptEncoding(taUTF8).&End.
                   Method(tmGET).&End.
                 &End;
  oRest := TRest.New.
             RESTRequest(oConfigRest).
             Execute.&End.
           &End;
  FContent := oRest.Content;
end;

function TServiceEpisodio.Content: string;
begin
  Result := FContent;
end;

constructor TServiceEpisodio.Create;
begin
  inherited;

end;

destructor TServiceEpisodio.Destroy;
begin

  inherited;
end;

function TServiceEpisodio.&End: IRickAndMorty;
begin
  Result := Self;
end;

function TServiceEpisodio.Filter(_Name: string): IRickAndMorty;
begin
  Result := Self;
end;

function TServiceEpisodio.Imagem(_AURL: string): TStream;
begin
  Result := nil;
end;

function TServiceEpisodio.Multiplos(_Id: string): IRickAndMorty;
begin
  Result := Self;
end;

class function TServiceEpisodio.New: IRickAndMorty;
begin
  Result := Self.Create;
end;

function TServiceEpisodio.Single(_Id: integer): IRickAndMorty;
begin
  Result := Self;
end;

function TServiceEpisodio.Todos(_Index: Integer): IRickAndMorty;
var
  oConfigRest: IConfiguracao;
  oRest: IREST;
begin
  Result := Self;
  oConfigRest := TConfiguracao.New.
                   URL(uResourceString.URLRickAndMorty).&End.
                   Resource('episode').&End.
                   ContentType(tctApplicationJSON).&End.
                   Accept(taUTF8).&End.
                   AcceptEncoding(taUTF8).&End.
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
