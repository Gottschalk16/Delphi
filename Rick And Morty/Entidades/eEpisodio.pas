unit eEpisodio;

interface

uses
  System.Classes, eTodos,
  System.Generics.Collections;

type
  TEpisodio = class
    private
      FId: Integer;
      FName: string;
      FAir_Date: string;
      FEpisode: string;
      FCaracters: TArray<string>;
      FURL: string;
      FCreated: string;
    public
      property Id: Integer read FId write FId;
      property Name: string read FName write FName;
      property Air_Date: string read FAir_Date write FAir_Date;
      property Episode: string read FEpisode write FEpisode;
      property Caracters: TArray<string> read FCaracters write FCaracters;
      property URL: string read FURL write FURL;
      property Created: string read FCreated write FCreated;
      destructor Destroy; override;
  end;

  TArrayEpisodios = array of TEpisodio;

  TTodos = class
    private
      FInfo: TInfo;
      FResults: TArrayEpisodios;
    public
      property Info: TInfo read FInfo write FInfo;
      property Results: TArrayEpisodios read FResults write FResults;
      destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TEpisodio }

destructor TEpisodio.Destroy;
begin
  inherited;
end;

{ TTodos }

destructor TTodos.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(Length(Results)) do begin
    if Assigned(Results[i]) then
      FreeAndNil(Results[i]);
  end;
  inherited;
end;

end.

