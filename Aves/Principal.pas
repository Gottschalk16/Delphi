unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnPapagaio: TButton;
    btnPinguim: TButton;
    procedure btnPapagaioClick(Sender: TObject);
    procedure btnPinguimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
   InterfaceAves, ClassAves;

procedure TfrmPrincipal.btnPapagaioClick(Sender: TObject);
var
   APapagaio: iAves;
begin
   APapagaio := TPapagaio.New;
   APapagaio.
      Localizacao(10, 20).
         &End.
            &End;
   ShowMessage('Papagio se encontra em:' + sLineBreak +
               'Longitude: ' + APapagaio.Longitude.ToString + sLineBreak +
               'Latitude: ' + Apapagaio.Latitude.ToString);
end;

procedure TfrmPrincipal.btnPinguimClick(Sender: TObject);
var
   APinguim: iAves;
begin
   APinguim := TPinguim.New;
   APinguim.
      Localizacao(50, 40).
         &End.
            &End;
   ShowMessage('Pinguim se encontra em:' + sLineBreak +
               'Longitude: ' + APinguim.Longitude.ToString + sLineBreak +
               'Latitude: ' + APinguim.Latitude.ToString);
end;

end.
