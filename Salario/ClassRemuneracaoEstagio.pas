unit ClassRemuneracaoEstagio;

interface

uses
  InterfaceRemuneracao;

type
   TRenumeracaoEstagio = class(TInterfacedObject, iRemuneravel)
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

{ TRenumeracaoEstagio }

function TRenumeracaoEstagio.&End: iRemuneravel;
begin
   Result := Self;
end;

constructor TRenumeracaoEstagio.Create;
begin
end;

destructor TRenumeracaoEstagio.Destroy;
begin
  inherited;
end;

function TRenumeracaoEstagio.getRemuneracao: Currency;
begin
   Result := 3;
end;

class function TRenumeracaoEstagio.New: iRemuneravel;
begin
   Result := Self.Create;
end;

end.
