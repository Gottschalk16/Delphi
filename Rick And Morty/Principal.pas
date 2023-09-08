unit Principal;

interface

uses
  System.SysUtils, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, Skia.FMX,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, System.ImageList, FMX.ImgList,
  System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.Layouts, FMX.Effects, FMX.ListBox,
  FrmCharacter, FMX.Edit, uIRickAndMorty, System.Types;

type
  TDlgPrincipal = class(TForm)
    ImgLogo: TImage;
    lbCharacter: TListBox;
    btnLocation: TSpeedButton;
    btnCharacter: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure lbCharacterViewportPositionChange(Sender: TObject;
      const OldViewportPosition, NewViewportPosition: TPointF;
      const ContentSizeChanged: Boolean);
    procedure btnLocationClick(Sender: TObject);
    procedure btnCharacterClick(Sender: TObject);
  private
    FoServiceCharacter: IRickAndMorty;
    FoServiceLocation: IRickAndMorty;
    FContent: string;
    FnCount: Integer;
    FbPersonagem: Boolean;
    FnIndex: Integer;
    procedure CriarPersonagens(AcContent: string);
    procedure CriarLocais(AcContent: string);
    procedure ListarCharacter(AnPage: Integer; AbIndClear: Boolean = False);
    procedure ListarLocation(AnPage: Integer; AbIndClear: Boolean = False);
    procedure ThreadCharacterTerminate(Sender: TObject);
    procedure ThreadLocationTerminate(Sender: TObject);
    function ExceptionThread(Sender: TObject): Boolean;
    function Terminou: boolean;
    procedure setContent(Value: string);
    property Content: string read FContent write setContent;
  public
    { Public declarations }
  end;

var
  DlgPrincipal: TDlgPrincipal;

implementation

uses
  uEntidadeGenerica, uServicesPersonagem, ePersonagem,
  uFuncoes, Threading, System.UIConsts, Location, eLocalizacao,
  uServicesLocalizacao, uREST;

{$R *.fmx}

procedure TDlgPrincipal.btnCharacterClick(Sender: TObject);
begin
  FnCount := 0;
  FbPersonagem := True;
  ListarCharacter(1, True);
end;

procedure TDlgPrincipal.btnLocationClick(Sender: TObject);
begin
  FnCount := 0;
  FbPersonagem := False;
  ListarLocation(1, true);
end;

procedure TDlgPrincipal.CriarLocais(AcContent: string);
var
  oLocais: eLocalizacao.TTodos;
  i: integer;
  oListBoxItem: TListBoxItem;
  oFrmLocais: TFrmDlgLocation;
begin
  if AcContent.Trim.IsEmpty then
    Exit;
  oLocais := TEntGener<eLocalizacao.TTodos>.New.
               GetEntidade<eLocalizacao.TTodos>(AcContent);
  if FnCount = 0 then
    FnCount := oLocais.Info.Count;
  try
    for i := 0 to Pred(Length(oLocais.Results)) do
      begin
      oListBoxItem := TListBoxItem.Create(nil);
      oListBoxItem.Selectable := False;
      oListBoxItem.Text := EmptyStr;
      oListBoxItem.Tag := oLocais.Results[i].Id;
      oListBoxItem.Cursor := crHandPoint;

      oFrmLocais := TFrmDlgLocation.Create(oListBoxItem);
      oFrmLocais.HitTest := False;
      oFrmLocais.Align := TAlignLayout.Client;
      oFrmLocais.lblLocation.Text := oLocais.Results[i].Name;
      oFrmLocais.lblLocation.AutoSize := True;
      oFrmLocais.Height := oFrmLocais.lblLocation.Height;
      oFrmLocais.Width := oFrmLocais.lblLocation.Width;

      FnIndex := oLocais.Results[i].Id;

      oListBoxItem.Height := oFrmLocais.Height;
      oListBoxItem.Width := oFrmLocais.Width;

      oListBoxItem.AddObject(oFrmLocais);
      lbCharacter.AddObject(oListBoxItem);
    end;
  finally
    FreeAndNil(oLocais);
  end;
end;

procedure TDlgPrincipal.CriarPersonagens(AcContent: string);
var
  oPersonagem: ePersonagem.TTodos;
  i: integer;
  oListBoxItem: TListBoxItem;
  oFrmCharacter: TFrmDlgCharacter;
  oStream: TStream;
begin
  DlgPrincipal.BeginUpdate;
  if AcContent.Trim.IsEmpty then
    Exit;
  try
    oPersonagem := TEntGener<ePersonagem.TTodos>.New.
                     GetEntidade<ePersonagem.TTodos>(AcContent);
    if FnCount = 0 then
      FnCount := oPersonagem.Info.Count;
    for i := 0 to Pred(Length(oPersonagem.Results)) do
      begin
      oListBoxItem := TListBoxItem.Create(nil);
      oListBoxItem.Selectable := False;
      oListBoxItem.Text := EmptyStr;
      oListBoxItem.Tag := oPersonagem.Results[i].Id;
      oListBoxItem.Cursor := crHandPoint;

      oFrmCharacter := TFrmDlgCharacter.Create(oListBoxItem);
      oFrmCharacter.HitTest := False;
      oFrmCharacter.Align := TAlignLayout.Client;
      oFrmCharacter.RgId.Tag := oPersonagem.Results[i].Id;
      oFrmCharacter.LblName.Text := oPersonagem.Results[i].Name;

      oStream := TServicePersonagem.New.Imagem(oPersonagem.Results[i].Image);
      if oStream <> nil then
        begin
        oFrmCharacter.ImageCharacter(oStream, oPersonagem.Results[i].Image);
        oStream.DisposeOf;
      end;

      oListBoxItem.Height := oFrmCharacter.Height;

      oListBoxItem.AddObject(oFrmCharacter);
      lbCharacter.AddObject(oListBoxItem);
    end;
    DlgPrincipal.EndUpdate;
  finally
    FreeAndNil(oPersonagem);
  end;
end;

procedure TDlgPrincipal.FormShow(Sender: TObject);
begin
  FnCount := 0;
  FbPersonagem := True;
  ListarCharacter(1, True);
end;

procedure TDlgPrincipal.lbCharacterViewportPositionChange(Sender: TObject;
  const OldViewportPosition, NewViewportPosition: TPointF;
  const ContentSizeChanged: Boolean);
var
  oItem: TListBoxItem;
begin
  if (lbCharacter.Items.Count >= 20) and (lbCharacter.Tag >= 0) then
    begin
    // Pega o item que está "entrando" na tela...
    if FbPersonagem then
      oItem := lbCharacter.ItemByPoint(30, lbCharacter.Height - 40)
    else
      oItem := lbCharacter.ItemByIndex(FnIndex - 1);
    if Assigned(oItem) then
      begin
      if oItem.Index >= lbCharacter.Items.Count - 10 then
        begin // Se chegou nos últimos x itens da lista
        if FbPersonagem then
          ListarCharacter(lbCharacter.Tag + 1)
        else
          ListarLocation(lbCharacter.Tag + 1);
      end;
    end;
  end;
end;

procedure TDlgPrincipal.ListarCharacter(AnPage: Integer; AbIndClear: Boolean = False);
var
  oThread: TThread;
begin
  // Evita o processamento concorrente
  if lbCharacter.TagString = 'S' then
    Exit;

  // Está processando
  lbCharacter.TagString := 'S';

  lbCharacter.BeginUpdate;

  if AbIndClear then
    begin
    AnPage := 1;
    lbCharacter.ScrollToItem(lbCharacter.ItemByIndex(0));
    lbCharacter.Items.Clear;
  end;

  // Se -1, então não possui mais personagens.
  lbCharacter.Tag := AnPage;

  oThread := TThread.CreateAnonymousThread(procedure
  begin
    FContent := TServicePersonagem.New.Todos(AnPage).Content;
  end);

  oThread.OnTerminate := ThreadCharacterTerminate;
  oThread.Start;
end;

procedure TDlgPrincipal.ListarLocation(AnPage: Integer;
  AbIndClear: Boolean);
var
  oThread: TThread;
begin
  if lbCharacter.TagString = 'S' then
    Exit;

  lbCharacter.TagString := 'S';
  lbCharacter.BeginUpdate;

  if AbIndClear then
    begin
      AnPage := 1;
      lbCharacter.ScrollToItem(lbCharacter.ItemByIndex(0));
      lbCharacter.Items.Clear;
  end;

  // Se -1, então não possui mais locais.
  lbCharacter.Tag := AnPage;

  oThread := TThread.CreateAnonymousThread(procedure
  begin
    FContent := TServiceLocalizacao.New.Todos(AnPage).Content;
  end);

  oThread.OnTerminate := ThreadLocationTerminate;
  oThread.Start;
end;

procedure TDlgPrincipal.setContent(Value: string);
begin
  FContent := EmptyStr;
  FContent := Value;
end;

procedure TDlgPrincipal.ThreadCharacterTerminate(Sender: TObject);
begin
  if not Terminou then
    Exit;

  CriarPersonagens(Content);
  lbCharacter.EndUpdate;

  // Terminou de processar
  lbCharacter.TagString := EmptyStr;

  // Se ocorreu alguma exceção
  if ExceptionThread(Sender) then
    Exit;
end;

procedure TDlgPrincipal.ThreadLocationTerminate(Sender: TObject);
begin
  if not Terminou then
    Exit;

  CriarLocais(Content);
  lbCharacter.EndUpdate;

  // Terminou de processar
  lbCharacter.TagString := EmptyStr;

  // Se ocorreu alguma exceção
  if ExceptionThread(Sender) then
    Exit;
end;

function TDlgPrincipal.ExceptionThread(Sender: TObject): Boolean;
begin
  Result := False;
  if Sender is TThread then
    begin
    if Assigned(TThread(Sender).FatalException) then
      begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;
  end;
  Result := True;
end;

function TDlgPrincipal.Terminou: Boolean;
begin
  Result := False;
  if (lbCharacter.Tag = FnCount) and (FnCount <> 0) then
    begin
    lbCharacter.Tag := -1; // Acabou os locais
    Exit;
  end;
  Result := True;
end;

end.
