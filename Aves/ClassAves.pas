unit ClassAves;

interface

uses
  InterfaceAves;

type TPapagaio = class(TInterfacedObject, iAves)
   private
      FLongitude : integer;
      FLatitude  : integer;
   public
      function Localizacao(_Longitude, _Latitude: integer): iAves;
      function Longitude: integer;
      function Latitude: integer;
      function Altitude(_Altitude: integer): iAves;
      function &End: iAves;
      constructor Create;
      destructor Destroy; override;
      class function New: iAves;
end;

type TPinguim = class(TInterfacedObject, iAves)
   private
      FLongitude : integer;
      FLatitude  : integer;
   public
      function Localizacao(_Longitude, _Latitude: integer): iAves;
      function Longitude: integer;
      function Latitude: integer;
      function &End: iAves;
      constructor Create;
      destructor Destroy; override;
      class function New: iAves;
end;


implementation

{ TPapagaio }

function TPapagaio.Altitude(_Altitude: integer): iAves;
begin

end;

constructor TPapagaio.Create;
begin
end;

destructor TPapagaio.Destroy;
begin
   inherited;
end;

function TPapagaio.&End: iAves;
begin
   Result := Self;
end;

function TPapagaio.Latitude: integer;
begin
   Result := FLatitude;
end;

function TPapagaio.Localizacao(_Longitude, _Latitude: integer): iAves;
begin
   Result := Self;
   FLongitude := _Longitude;
   FLatitude := _Latitude;
end;

function TPapagaio.Longitude: integer;
begin
   Result := FLongitude;
end;

class function TPapagaio.New: iAves;
begin
   Result := Self.Create;
end;

{ Pinguim }

constructor TPinguim.Create;
begin
end;

destructor TPinguim.Destroy;
begin
   inherited;
end;

function TPinguim.&End: iAves;
begin
   Result := Self;
end;

function TPinguim.Latitude: integer;
begin
   Result := FLatitude;
end;

function TPinguim.Localizacao(_Longitude, _Latitude: integer): iAves;
begin
   Result := Self;
   FLongitude := _Longitude;
   FLatitude := _Latitude;
end;

function TPinguim.Longitude: integer;
begin
   Result := FLongitude;
end;

class function TPinguim.New: iAves;
begin
   Result := Self.Create;
end;

end.
