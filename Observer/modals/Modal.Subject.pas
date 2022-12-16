unit Modal.Subject;

interface

uses
   System.Generics.Collections, Modal.Observer;

type
   TSubject = class
   private
      FObserver: TObjectList<TSubject>;
   public
      property Observer: TObjectList<TSubject> read FObserver;
      procedure Attach(const _Observer: TObserver);
      procedure Detach(const _Observer: TObserver);
      procedure DetachAll;
      procedure Notify;

end;

implementation

{ TSubject }

procedure TSubject.Attach(const _Observer: TObserver);
begin
   if not assigned(FObserver) then
      FObserver := TObjectList<TSubject>.Create;
end;

procedure TSubject.Detach(const _Observer: TObserver);
begin

end;

procedure TSubject.DetachAll;
begin

end;

procedure TSubject.Notify;
begin

end;

end.
