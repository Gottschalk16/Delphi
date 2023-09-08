unit uConfiguracao;

interface

uses
  uIConfiguracaoRest, REST.Types, System.StrUtils, uEnumeradores;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    FcURL: string;
    FcContentType: string;
    FoTipoContentType: TTiposContentType;
    FcAccept: string;
    FcAcceptEncoding: string;
    FcBody: string;
    FoMethod: TRESTRequestMethod;
    FResource: string;
  public
    function URL(Value: string): IConfiguracao; overload;
    function URL: string; overload;

    function ContentType(Value: TTiposContentType): IConfiguracao; overload;
    function ContentType: string; overload;
    function RESTContentType: TRESTContentType; overload;

    function Accept(Value: TAccept): IConfiguracao; overload;
    function Accept: string; overload;

    function AcceptEncoding(Value: TAccept): IConfiguracao; overload;
    function AcceptEncoding: string; overload;

    function Body(Value: string): IConfiguracao; overload;
    function Body: string; overload;

    function Method(Value: TMetodos): IConfiguracao; overload;
    function Method: TRESTRequestMethod; overload;

    function Resource(Value: string): IConfiguracao; overload;
    function Resource: string; overload;

    constructor Create;
    destructor Destroy; override;
    class function New: IConfiguracao;
    function &End: IConfiguracao;
  end;

implementation

{ TConfiguracao }

function TConfiguracao.Accept(Value: TAccept): IConfiguracao;
begin
  Result := Self;
  case Value of
    taUTF8: FcAccept := 'charset=utf8';
  end;
end;

function TConfiguracao.&End: IConfiguracao;
begin
  Result := Self;
end;

function TConfiguracao.Accept: string;
begin
  Result := FcAccept;
end;

function TConfiguracao.AcceptEncoding: string;
begin
  Result := FcAcceptEncoding;
end;

function TConfiguracao.AcceptEncoding(Value: TAccept): IConfiguracao;
begin
  Result := Self;
  FcAcceptEncoding := 'gzip, deflate, br';
end;

function TConfiguracao.Body: string;
begin
  Result := FcBody;
end;

function TConfiguracao.Body(Value: string): IConfiguracao;
begin
  Result := Self;
  FcBody := Value;
end;

function TConfiguracao.ContentType(Value: TTiposContentType): IConfiguracao;
begin
  Result := Self;
  FoTipoContentType := Value;
  case Value of
    tctApplicationJSON: FcContentType := 'application/json; charset=utf-8';
    tctAplicationXML: FcContentType := 'application/xml';
    tctAplicationImage: FcContentType := 'image/jpeg';
  end;
end;

function TConfiguracao.ContentType: string;
begin
  Result := FcContentType;
end;

function TConfiguracao.Resource: string;
begin
  Result := FResource;
end;

function TConfiguracao.Resource(Value: string): IConfiguracao;
begin
  Result := Self;
  FResource := Value;
end;

function TConfiguracao.RESTContentType: TRESTContentType;
begin
  case FoTipoContentType of
    tctApplicationJSON: Result := TRESTContentType.ctAPPLICATION_JSON;
    tctAplicationXML: Result := TRESTContentType.ctAPPLICATION_XML;
  end;
end;

constructor TConfiguracao.Create;
begin
  inherited;
end;

destructor TConfiguracao.Destroy;
begin
  inherited;
end;

function TConfiguracao.Method(Value: TMetodos): IConfiguracao;
begin
  Result := Self;
  case Value of
    tmGET: FoMethod := rmGET;
    tmPOST: FoMethod := rmPOST;
    tmPUT: FoMethod := rmPUT;
    tmDELETE: FoMethod := rmDELETE;
  end;
end;

function TConfiguracao.Method: TRESTRequestMethod;
begin
  Result := FoMethod;
end;

class function TConfiguracao.New: IConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.URL: string;
begin
  Result := FcURL;
end;

function TConfiguracao.URL(Value: string): IConfiguracao;
begin
  Result := Self;
  FcURL := Value;
end;

end.


