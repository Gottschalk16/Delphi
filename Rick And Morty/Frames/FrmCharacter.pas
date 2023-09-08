unit FrmCharacter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Effects, FMX.Layouts;

type
  TFrmDlgCharacter = class(TFrame)
    LblName: TLabel;
    Shadow: TShadowEffect;
    RgCharacter: TRectangle;
    RgBackground: TRectangle;
    RgId: TRectangle;
    procedure RgIdClick(Sender: TObject);
  private
  public
    procedure ImageCharacter(AoStream: TStream; AcUrlImage: string);
  end;

implementation

uses
  Character, skia;

{$R *.fmx}

{ TDlgFrmCharacter }

procedure TFrmDlgCharacter.ImageCharacter(AoStream: TStream; AcUrlImage: string);
begin
  RgCharacter.TagString := AcUrlImage;
  RgCharacter.Fill.Bitmap.Bitmap.LoadFromStream(AoStream);
  RgCharacter.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
end;

procedure TFrmDlgCharacter.RgIdClick(Sender: TObject);
var
  oCharacter: TDlgCharacter;
begin
  oCharacter := TDlgCharacter.Create(nil);
  try
    oCharacter.OpenForm(RgId.Tag, RgCharacter.TagString);
    oCharacter.ShowModal;
  finally
    FreeAndNil(oCharacter);
  end;
end;

end.
