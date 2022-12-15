unit ClassRemuneracao;

interface

uses
  InterfaceRemuneracao;

type
   TRemuneravel = class(TInterfacedObject, iRemuneravel)
   private
      {Private}
   public
      constructor Create;
      destructor Destroy; override;
      class function New: iRemuneravel;
      function getRemuneracao: Currency;
      function &End: iRemuneravel;
end;

implementation

{ TRemuneravel }

function TRemuneravel.&End: iRemuneravel;
begin
   Result := Self;
end;

constructor TRemuneravel.Create;
begin
end;

destructor TRemuneravel.Destroy;
begin
  inherited;
end;

class function TRemuneravel.New: iRemuneravel;
begin
   Result := Self.Create;
end;

function TRemuneravel.getRemuneracao: Currency;
begin
   Result := 5;
end;

end.
