unit uParametrosRest;

interface

uses
  uIInterfaces, REST.Types, System.StrUtils, Tipos;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private
    FcURL: string;
    FHeader: array of string;
    FcContentType: string;
    FoTipoContentType: TTiposContentType;
    FcAccept: string;
    FcBody: string;
    FoMethod: TRESTRequestMethod;
  public
    function URL(Value: string): IConfiguracao; overload;
    function URL: string; overload;

    function Header(Value: array of string): IConfiguracao;

    function ContentType(Value: TTiposContentType): IConfiguracao; overload;
    function ContentType: string; overload;
    function RESTContentType: TRESTContentType; overload;

    function Accept(Value: TAccept): IConfiguracao; overload;
    function Accept: string; overload;

    function Body(Value: string): IConfiguracao; overload;
    function Body: string; overload;

    function Method(Value: TMetodos): IConfiguracao; overload;
    function Method: TRESTRequestMethod; overload;

    constructor Create;
    destructor Destroy;
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
    tctApplicationJSON: FcContentType := 'application/json';
    tctAplicationXML: FcContentType := 'application/xml';
  end;
end;

function TConfiguracao.ContentType: string;
begin
  Result := FcContentType;
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

function TConfiguracao.Header(Value: array of string): IConfiguracao;
begin
  Result := Self;
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

