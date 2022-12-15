unit InterfaceAves;

interface

type iAves = interface
   function Localizacao(_Longitude, _Latitude: integer): iAves;
   function Longitude: integer;
   function Latitude: integer;
   function &End: iAves;
end;

implementation

end.
