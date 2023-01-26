unit uIInterfaces;

interface

uses
  REST.Types, Tipos, REST.Client;

type
  IConfiguracao = interface
    function URL(Value: string): IConfiguracao; overload;
    function URL: string; overload;

    function Header(Value: array of string): IConfiguracao;

    function ContentType(Value: TTiposContentType): IConfiguracao; overload;
    function ContentType: string; overload;
    function RESTContentType: TRESTContentType;

    function Accept(Value: TAccept): IConfiguracao; overload;
    function Accept: string; overload;

    function Body(Value: string): IConfiguracao; overload;
    function Body: string; overload;

    function Method(Value: TMetodos): IConfiguracao; overload;
    function Method: TRESTRequestMethod; overload;

    function &End: IConfiguracao;
  end;

  IRest = interface
    ['{6367DAA7-448B-4380-BCE2-13C3410FEF3F}']
    function RESTRequest(_AParametrosREST: IConfiguracao): IRest; overload;
    function RestRequest: TRESTRequest; overload;

    function Execute: IRest;

    function Content(Value: string): IRest; overload;
    function Content: string; overload;

    function Status(Value: integer): IRest; overload;
    function Status: integer; overload;

    function &End: IRest;
  end;

implementation

end.
