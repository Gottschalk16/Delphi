unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    lblAno: TLabel;
    lblMes: TLabel;
    btnBuscar: TButton;
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
   System.StrUtils;

{$R *.dfm}

procedure TForm1.btnBuscarClick(Sender: TObject);
var
  ADia: Integer;
  AStrDia: string;
  AData: tdate;
begin
   if (Edit2.Text = EmptyStr) or (Edit3.Text = EmptyStr) then begin
      ShowMessage('É necessário preencher todos os campos!');
      Exit;
   end;
   ADia := 0;
   for var i := 1 to 31 do begin
      AStrDia := IfThen(i < 10, '0' + I.ToString, I.ToString);
      AData := StrToDate(AStrDia + '/' + Edit2.Text + '/' + Edit3.Text);
      if DayOfWeek(AData) = 1 then begin
         inc(ADia);
         if (ADia = 2) then
            Break;
      end;
   end;
   ShowMessage('O segundo domingo do mês cai em ' + AStrDia + '/' + edit2.Text + '/' + Edit3.Text);
end;

end.
