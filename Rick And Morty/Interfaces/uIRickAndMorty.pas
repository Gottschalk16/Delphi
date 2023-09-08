unit uIRickAndMorty;

interface

uses
  System.Classes;

type
  IRickAndMorty = interface
    ['{65F43182-DE31-4C90-BB80-DC91C1F95ADC}']
    function Todos(_Index: Integer): IRickAndMorty;
    function Single(_Id: integer): IRickAndMorty;
    function Filter(_Name: string): IRickAndMorty;
    function Multiplos(_Id: string): IRickAndMorty;

    function Buscar(_URL: string): IRickAndMorty;

    function &End: IRickAndMorty;

    function Imagem(_AURL: string): TStream;

    function Content: string;
  end;

implementation

end.
