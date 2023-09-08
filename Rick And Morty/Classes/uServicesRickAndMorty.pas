unit uServicesRickAndMorty;
//
interface
//
//uses
//  uIRickAndMorty, eTodos, eLocalizacao, eEpisodio,
//  ePersonagem, System.Classes;
//
//type
//  TServicesRickAndMorty = class(TInterfacedObject, IRickAndMorty)
//    private
//      FContent: string;
//    public
//      property Content: string read FContent write FContent;
//
//      function Personagens(_Nome: string): IRickAndMorty;
//      function TodosPersonagens(_Index: integer): IRickAndMorty;
//      function MultiplosPersonagens: IRickAndMorty;
//      function FilterPersonagem(_AId: Integer): IRickAndMorty;
//
//
//      function Localizacao: IRickAndMorty;
//      function TodasLocalizacoes: IRickAndMorty;
//      function MultiplasLocalizacoes: IRickAndMorty;
//      function FilterLocalizacao: IRickAndMorty;
//
//
//      function Episodio: IRickAndMorty;
//      function TodosEpisodios: IRickAndMorty;
//      function MultiplosEpisodio: IRickAndMorty;
//      function FilterEpisodio: IRickAndMorty;
//
//
//      function Imagem(_AURL: string): TStream;
//
//      constructor Create;
//      destructor Destroy; override;
//
//
//      class function New: IRickAndMorty;
//
//
//      function &End: IRickAndMorty;
//  end;
//
implementation
//
//uses
//  uREST, uConfiguracao, uIRest, uIConfiguracaoRest,
//  uResourceString, uEnumeradores, jpeg, System.SysUtils;
//
//{ TServicesRickAndMorty }
//
//constructor TServicesRickAndMorty.Create;
//begin
//
//end;
//
//destructor TServicesRickAndMorty.Destroy;
//begin
//
//  inherited;
//end;
//
//function TServicesRickAndMorty.&End: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.Episodio: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.FilterEpisodio: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.FilterLocalizacao: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.FilterPersonagem(_AId: Integer): IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.Imagem(_AURL: string): TStream;
//var
//  oConfigRest: IConfiguracao;
//  oRest: IREST;
//  oStream : TMemoryStream;
//begin
//  oConfigRest := TConfiguracao.New.
//                   URL(_AURL).&End.
//                   ContentType(tctAplicationImage).&End.
//                   Accept(taUTF8).&End.
//                   Method(tmGET).&End.
//                 &End;
//  oRest := TRest.New.
//             RestRequest(oConfigRest).
//             Execute.
//             &End.
//           &End;
//  oStream := TMemoryStream.Create;
//  oStream.WriteBuffer(Pointer(oRest.RestResponse.RawBytes)^, Length(oRest.RestResponse.RawBytes));
//  oStream.Position := 0;
//  Result := oStream;
//end;
//
//function TServicesRickAndMorty.Localizacao: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.MultiplasLocalizacoes: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.MultiplosEpisodio: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.MultiplosPersonagens: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//class function TServicesRickAndMorty.New: IRickAndMorty;
//begin
//  Result := Self.Create;
//end;
//
//function TServicesRickAndMorty.Personagens(_Nome: string): IRickAndMorty;
//var
//  oConfigRest: IConfiguracao;
//  oRest: IRest;
//begin
//  Result := Self;
//  oConfigRest := TConfiguracao.New.
//                   URL(uResourceString.URLRickAndMorty).&End.
//                   Resource('character').&End.
//                   ContentType(tctApplicationJSON).&End.
//                   Accept(taUTF8).&End.
//                   Method(tmGET).&End.
//                 &End;
//  oRest := TRest.New.
//             RESTRequest(oConfigRest).
//           &End;
//  oRest.
//    RestRequest.AddParameter('name', _Nome);
//  oRest.
//    Execute.&End.
//  &End;
//  FContent := oRest.Content;
//end;
//
//function TServicesRickAndMorty.TodasLocalizacoes: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.TodosEpisodios: IRickAndMorty;
//begin
//  Result := Self;
//end;
//
//function TServicesRickAndMorty.TodosPersonagens(_Index: integer): IRickAndMorty;
//var
//  oConfigRest: IConfiguracao;
//  oRest: IREST;
//begin
//  Result := Self;
//  oConfigRest := TConfiguracao.New.
//                   URL(uResourceString.URLRickAndMorty).&End.
//                   Resource('character').&End.
//                   ContentType(tctApplicationJSON).&End.
//                   Accept(taUTF8).&End.
//                   Method(tmGET).&End.
//                 &End;
//  oRest := TRest.New.
//             RESTRequest(oConfigRest).
//           &End;
//  oRest.RestRequest.AddParameter('page', _Index.ToString);
//  oRest.
//    Execute.&End.
//  &End;
//  FContent := oRest.Content;
//end;
//
end.
