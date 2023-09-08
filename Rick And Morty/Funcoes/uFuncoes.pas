unit uFuncoes;

interface

uses
  Vcl.StdCtrls, System.SysUtils, uEnumeradores, System.Classes,
  FMX.Graphics;

type
  TFuncoes = class
    class function ExtrairNumero(Value: string): string;
    class procedure IncDecIndex(tIncrementar: tIncDec; out nIndex: Integer; out oLblIndex: Tlabel);
    class function StreamToBitmap(AoStream: TStream): TBitmap;
  end;

implementation

{ TFuncoes }

class function TFuncoes.ExtrairNumero(Value: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    if Value[I] in ['0'..'9'] then
      Result := Result + Value[I];
end;

class procedure TFuncoes.IncDecIndex(tIncrementar: tIncDec; out nIndex: Integer; out oLblIndex: Tlabel);
begin
  case tIncrementar of
    tidInc: Inc(nIndex);
    tidDec: Dec(nIndex);
  end;
  oLblIndex.Caption := nIndex.ToString;
end;

class function TFuncoes.StreamToBitmap(AoStream: TStream): TBitmap;
var
  Img: TBitmap;
begin
  Result := TBitmap.Create;
  try
    // Load the bitmap from the stream
    Img := TBitmap.Create;
    try
      Img.LoadFromStream(AoStream);
      Result.Assign(Img);
    except
      on E: Exception do
        raise Exception.Create('Error loading bitmap from stream: ' + E.Message);
    end;
  finally
//    Img.Free;
  end;
end;

end.
