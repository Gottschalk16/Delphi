unit eLocalizacao;

interface

uses
  System.Classes, eTodos;

type
  TLocalizacao = class
    private
      FId: Integer;
      FName: string;
      FType: string;
      FDimension: string;
      FResidents: TArray<string>;
      FURL: string;
      FCreated: string;
    public
      property Id: Integer read FId write FId;
      property Name: string read FName write FName;
      property &Type: string read FType write FType;
      property Dimension: string read FDimension write FDimension;
      property Residents: TArray<string> read FResidents write FResidents;
      property URL: string read FURL write FURL;
      property Created: string read FCreated write FCreated;
      destructor Destroy; override;
  end;

  TArrayLocalizacao = array of TLocalizacao;

  TTodos = class
    private
      FInfo: TInfo;
      FResults: TArrayLocalizacao;
    public
      property Info: TInfo read FInfo write FInfo;
      property Results: TArrayLocalizacao read FResults write FResults;
      destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TLocalizacao }

destructor TLocalizacao.Destroy;
begin
  inherited;
end;

{ TTodos }

destructor TTodos.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(Length(Results)) do
    begin
    if Assigned(Results[i]) then
      FreeAndNil(Results[i]);
  end;
  inherited;
end;

end.
