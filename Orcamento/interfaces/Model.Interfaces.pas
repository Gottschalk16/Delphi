unit Model.Interfaces;

interface

uses
  Model.Records;

type
   iObserver = interface
      ['{719A8C1E-A452-4718-B6E3-C6D2A7D45132}']
      procedure AtualizarCentroCto(_CentroCusto: TCentroCto);
end;

type
   iSubject = interface
      ['{4B15E991-B1A6-4D43-A39F-6304E91294BA}']
      procedure AdicionarObserver(_Observer: iObserver);
      procedure RemoverObserver(_Observer: iObserver);
      procedure Notificar;
end;

implementation

end.
