unit Modal.Interfaces;

interface

uses
   Modal.Records;

type
   iObserver = interface
      procedure AtualizarCredito(_Notificacao: TNotificacao);
      procedure AtualizarDebito(_Notificacao: TNotificacao);
end;

type
   iSubject = interface
      procedure AdicionarObserver(_Observer: iObserver);
      procedure RemoverObserver(_Observer: iObserver);
      procedure Notificar;
   end;

implementation

end.
