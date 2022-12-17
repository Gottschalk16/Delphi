unit ClassFuncoes;

interface

type TFuncoes = class
   public
      class function Zeros(_Str: string; _Qtde: Byte): string;
end;

implementation

uses
   System.SysUtils;

{ TFuncoes }

class function TFuncoes.Zeros(_Str: string; _Qtde: Byte): string;
begin
   if _Str.IsEmpty then
      Exit;
   Result := FormatFloat(StringOfChar('0', _Qtde), _Str.ToInteger);
end;

end.
