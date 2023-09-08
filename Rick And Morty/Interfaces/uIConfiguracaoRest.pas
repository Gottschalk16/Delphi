unit uIConfiguracaoRest;

interface

uses
    REST.Types, uEnumeradores, REST.Client;

type
  IConfiguracao = interface
    ['{D794F6C4-A58E-48E4-87AB-ED14CE20A4B9}']
    function URL(Value: string): IConfiguracao; overload;
    function URL: string; overload;

    function ContentType(Value: TTiposContentType): IConfiguracao; overload;
    function ContentType: string; overload;
    function RESTContentType: TRESTContentType;

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

    function &End: IConfiguracao;
  end;


implementation

end.

