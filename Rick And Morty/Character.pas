unit Character;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, Skia.FMX,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TDlgCharacter = class(TForm)
    RgBackground: TRectangle;
    LblName: TSkLabel;
    LblStats: TSkLabel;
    LblSpecie: TSkLabel;
    LblGender: TSkLabel;
    LblLocation: TSkLabel;
    LblOrigin: TSkLabel;
    BlurEffect1: TBlurEffect;
    RgShadow: TRectangle;
    Image2: TImage;
    btnBack: TSpeedButton;
    Rectangle1: TRectangle;
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
    procedure Image(AcImage: string);
    procedure Info(AnId: integer);
  public
    { Public declarations }
    procedure OpenForm(const AnId: integer; AcImage: string);
  end;

var
  DlgCharacter: TDlgCharacter;

implementation

uses
  Skia.FMX.Graphics, uServicesPersonagem,
  ePersonagem, uEntidadeGenerica;

{$R *.fmx}

{ TForm2 }

procedure TDlgCharacter.btnBackClick(Sender: TObject);
begin
  Close;
end;

procedure TDlgCharacter.Image(AcImage: string);
var
  LImage: ISkImage;
  LSurface: ISkSurface;
  LPaint: ISkPaint;
  oStream: TStream;
begin
  oStream := TServicePersonagem.New.Imagem(AcImage);
  if oStream <> nil then
    begin
    LImage := TSkImage.MakeFromEncodedStream(oStream);
    LPaint := TSkPaint.Create;
    LPaint.ColorFilter := TSkColorFilter.MakeHighContrast(TSkHighContrastConfig.Create(True, TSkContrastInvertStyle.NoInvert, 0));
    LSurface := TSkSurface.MakeRaster(LImage.Width, LImage.Height);
    LSurface.Canvas.Clear(TAlphaColors.Null);
    LSurface.Canvas.DrawImage(LImage, 0, 0, LPaint);
    var Arquivo := ExtractFilePath(System.SysUtils.GetCurrentDir);
    LSurface.MakeImageSnapshot.EncodeToFile(Arquivo + 'temp\temp.JPG');
    RgBackground.Fill.Bitmap.Bitmap.LoadFromFile(Arquivo + 'temp\temp.JPG');
    oStream.DisposeOf;
  end;
end;

procedure TDlgCharacter.Info(AnId: integer);
var
  oPersonagem: TPersonagem;
begin
  oPersonagem := TEntGener<TPersonagem>.New.
                   GetEntidade<TPersonagem>(TServicePersonagem.New.Single(AnId).&End.&End.Content);
  if Assigned(oPersonagem) then
    begin
    LblName.Text := oPersonagem.Name;
    LblStats.Text := oPersonagem.Status;
    LblSpecie.Text := oPersonagem.Species;
    LblGender.Text := oPersonagem.Gender;
    LblOrigin.Text := oPersonagem.Origin.Name;
    LblLocation.Text := oPersonagem.Location.Name;
    FreeAndNil(oPersonagem);
  end;
end;

procedure TDlgCharacter.OpenForm(const AnId: integer; AcImage: string);
begin
  Image(AcImage);
  Info(AnId);
end;

end.
