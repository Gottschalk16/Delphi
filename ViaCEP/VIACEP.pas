unit VIACEP;

interface

type
  TViaCep = class
  private
    FCEP: string;
    FLogradouro: string;
    FComplemento: string;
    FBairro: string;
    FLocalidade: string;
    FUF: string;
    FIBGE: string;
    FGIA: string;
    FDDD: string;
    FSiaFi: string;
  published
    property CEP: string read FCEP write FCEP;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Complemento: string read FComplemento write FComplemento;
    property Bairro: string read FBairro write FBairro;
    property Localidade: string read FLocalidade write FLocalidade;
    property UF: string read FUF write FUF;
    property IBGE: string read FIBGE write FIBGE;
    property Gia: string read FGIA write FGIA;
    property DDD: string read FDDD write FDDD;
    property SiaFi: string read FSiaFi write FSiaFi;

    destructor Destroy; override;
  end;

implementation

{ TViaCep }

destructor TViaCep.Destroy;
begin

  inherited;
end;

end.

