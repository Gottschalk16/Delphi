program RickAndMorty;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  Principal in 'Principal.pas' {DlgPrincipal},
  uConfiguracao in 'Classes\uConfiguracao.pas',
  uEntidadeGenerica in 'Classes\uEntidadeGenerica.pas',
  uREST in 'Classes\uREST.pas',
  uServicesEpisodios in 'Classes\uServicesEpisodios.pas',
  uServicesLocalizacao in 'Classes\uServicesLocalizacao.pas',
  uServicesPersonagem in 'Classes\uServicesPersonagem.pas',
  eEpisodio in 'Entidades\eEpisodio.pas',
  eLocalizacao in 'Entidades\eLocalizacao.pas',
  ePersonagem in 'Entidades\ePersonagem.pas',
  eTodos in 'Entidades\eTodos.pas',
  uEnumeradores in 'Enumeradores\uEnumeradores.pas',
  uFuncoes in 'Funcoes\uFuncoes.pas',
  uIConfiguracaoRest in 'Interfaces\uIConfiguracaoRest.pas',
  uIEntidadeGenerica in 'Interfaces\uIEntidadeGenerica.pas',
  uIRest in 'Interfaces\uIRest.pas',
  uIRickAndMorty in 'Interfaces\uIRickAndMorty.pas',
  uResourceString in 'ResourceString\uResourceString.pas',
  FrmCharacter in 'Frames\FrmCharacter.pas' {FrmDlgCharacter: TFrame},
  Character in 'Character.pas' {DlgCharacter},
  Location in 'Location.pas' {FrmDlgLocation: TFrame};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TDlgPrincipal, DlgPrincipal);
  Application.Run;
end.
