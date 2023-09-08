unit ePersonagem;

interface

uses
  System.Classes, System.SysUtils,
  System.Generics.Collections, eTodos;

type
  TOrigin = class
      private
        FName: string;
        FURL: string;
      public
        property Name: string read FName write FName;
        property URL: string read FURL write FURL;
  end;

  TLocation = class
      private
        FName: string;
        FURL: string;
      public
        property Name: string read FName write FName;
        property URL: string read FURL write FURL;
  end;

  TPersonagem = class
    private
      FId: Integer;
      FName: string;
      FStatus: string;
      FSpecies: string;
      FType: string;
      FGender: string;
      FOrigin: TOrigin;
      FLocation: TLocation;
      FImage: string;
      FEpisode: TArray<string>;
      FURL: string;
      FCreated: string;
    public
      property Id : Integer read FId write FId;
      property Name: string read FName write FName;
      property Status: string read FStatus write FStatus;
      property Species: string read FSpecies write FSpecies;
      property &Type: string read FType write FType;
      property Gender: string read FGender write FGender;
      property Origin: TOrigin read FOrigin write FOrigin;
      property Location: TLocation read FLocation write FLocation;
      property Image: string read FImage write FImage;
      property Episode: TArray<string> read FEpisode write FEpisode;
      property URL: string read FURL write FURL;
      property Created: string read FCreated write FCreated;
      destructor Destroy; override;
  end;

  TArrayPersonagem = array of TPersonagem;

  TTodos = class
    private
      FInfo: TInfo;
      FResults: TArrayPersonagem;
    public
      property Info: TInfo read FInfo write FInfo;
      property Results: TArrayPersonagem read FResults write FResults;
      destructor Destroy; override;
  end;

  TArrayTodos = array of TTodos;

  TResult = class
    private
      FTodos: TArrayTodos;
    public
      property Todos: TArrayTodos read FTodos write FTodos;
  end;

implementation

uses
  system.StrUtils;

{ TPersonagem }

destructor TPersonagem.Destroy;
begin
  if Assigned(FOrigin) then
    FreeAndNil(FOrigin);
  if Assigned(FLocation) then
    FreeAndNil(FLocation);
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
