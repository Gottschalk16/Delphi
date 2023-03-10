unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClassFolhaPgto;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FFolhaPgto: TFolhaPgto;
    property FolhaPgto: TFolhaPgto read FFolhaPgto write FFolhaPgto;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  InterfaceRemuneracao, ClassRemuneracao, ClassRemuneracaoEstagio;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   ACLT: iRemuneravel;
begin
   ACLT := TRemuneravel.new;
   ShowMessage('Funcionário CLT ganha: ' + CurrToStr(FolhaPgto.Calcular(ACLT.
                                                                           &End.
                                                                              &End)));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   AEstagiario: iRemuneravel;
begin
   AEstagiario := TRenumeracaoEstagio.new;
   ShowMessage('Funcionário CLT ganha: ' + CurrToStr(FolhaPgto.Calcular(AEstagiario.
                                                                           &End.
                                                                              &End)));
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(FFolhaPgto);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   FFolhaPgto := TFolhaPgto.Create;
end;

end.
