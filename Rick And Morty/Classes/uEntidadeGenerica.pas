unit uEntidadeGenerica;

interface

uses
  uIEntidadeGenerica;

type
  TEntGener<T> = class(TInterfacedObject, IGeneric<T>)
    private
    public
        function GetEntidade<T: class, constructor>(Value: string): T; overload;

        function &End: IGeneric<T>;

        class function New: TEntGener<T>;
  end;

implementation

uses
  REST.Json;

{ TEntGener<T> }

function TEntGener<T>.&End: IGeneric<T>;
begin
  Result := Self;
end;

function TEntGener<T>.GetEntidade<T>(Value: string): T;
begin
  Result := TJson.JsonToObject<T>(Value);
end;

class function TEntGener<T>.New: TEntGener<T>;
begin
  Result := Self.Create;
end;

end.
