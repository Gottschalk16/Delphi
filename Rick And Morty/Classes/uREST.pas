unit uREST;

interface

uses
  uIRest, uIConfiguracaoRest, REST.Client, System.SysUtils,
  REST.Types;

type
  TRest = class(TInterfacedObject, iRest)
  private
    FoRestRequest: TRESTRequest;
    FoRestClient: TRESTClient;
    FoRestResponse: TRESTResponse;
    FcContent: string;
    FnStatus: integer;
    procedure MontarRest(_AParametros: IConfiguracao);
  public
    function RESTRequest(_AParametrosREST: IConfiguracao): iRest; overload;
    function RestRequest: TRESTRequest; overload;

    function Execute: iRest;

    function Content(Value: string): iRest; overload;
    function Content: string; overload;

    function Status(Value: integer): iRest; overload;
    function Status: integer; overload;

    function RestResponse: TRESTResponse;

    constructor Create;
    destructor Destroy; override;
    class function New: iRest;
    function &End: iRest;
  end;

implementation


{ TRest }

function TRest.Content(Value: string): iRest;
begin
  FcContent := Value;
end;

function TRest.Content: string;
begin
  Result := FcContent;
end;

constructor TRest.Create;
begin
  inherited;
  FoRestRequest  := TRESTRequest.Create(nil);
  FoRestClient   := TRESTClient.Create(nil);
  FoRestResponse := TRESTResponse.Create(nil);
end;

destructor TRest.Destroy;
begin
  FreeAndNil(FoRestRequest);
  FreeAndNil(FoRestClient);
  FreeAndNil(FoRestResponse);
  inherited;
end;

function TRest.&End: iRest;
begin
  Result := Self;
end;

function TRest.Execute: iRest;
begin
  Result := Self;
  try
    FoRestRequest.Execute;
    FcContent := FoRestResponse.Content;
    FnStatus := FoRestResponse.StatusCode;
  except
    on E: ERESTException do begin
      FcContent := FoRestResponse.Content;
      FnStatus := FoRestResponse.StatusCode;
    end;
    on E: Exception do begin
      FcContent := FoRestResponse.Content;
      FnStatus := FoRestResponse.StatusCode;
    end;
    on E: ERequestError do begin
      FcContent := E.ResponseContent;
      FnStatus := E.StatusCode;
    end;
  end;
end;

procedure TRest.MontarRest(_AParametros: IConfiguracao);
begin
  with FoRestClient do begin
    Accept := _AParametros.Accept;
    BaseURL := _AParametros.URL;
    ContentType := _AParametros.ContentType;
  end;
  with FoRestRequest do begin
    if _AParametros.Body <> '' then
      AddBody(_AParametros.Body, _AParametros.RESTContentType);
    Accept := _AParametros.Accept;
    Client := FoRestClient;
    Response := FoRestResponse;
    Method := _AParametros.Method;
    Resource := _AParametros.Resource;
  end;
end;

class function TRest.New: iRest;
begin
  Result := Self.Create;
end;

function TRest.RESTRequest: TRESTRequest;
begin
  Result := FoRestRequest;
end;

function TRest.RestResponse: TRESTResponse;
begin
  Result := FoRestResponse;
end;

function TRest.RESTRequest(_AParametrosREST: IConfiguracao): iRest;
begin
  Result := Self;
  MontarRest(_AParametrosREST);
end;

function TRest.Status(Value: integer): iRest;
begin
  FnStatus := Value;
end;

function TRest.Status: integer;
begin
  Result := FnStatus
end;

end.
