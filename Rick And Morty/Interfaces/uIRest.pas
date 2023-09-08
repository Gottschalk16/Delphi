unit uIRest;

interface

uses
    REST.Types, uEnumeradores, REST.Client, uIConfiguracaoRest;

type
  IRest = interface
    ['{74E67D3A-E634-4F45-85C4-C40261652F27}']
    function RestRequest(_AParametrosREST: IConfiguracao): IRest; overload;
    function RestRequest: TRESTRequest; overload;

    function Execute: IRest;

    function Content(Value: string): IRest; overload;
    function Content: string; overload;

    function Status(Value: integer): IRest; overload;
    function Status: integer; overload;

    function RestResponse: TRESTResponse;

    function &End: IRest;
  end;


implementation

end.
