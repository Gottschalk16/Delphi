unit eTodos;

interface

type
  TInfo = class
    private
      FCount: Integer;
      FPages: Integer;
      FNext: string;
      FPrev: string;
    public
      property Count: Integer read FCount write FCount;
      property Pages: Integer read FPages write FPages;
      property Next: string read FNext write FNext;
      property Prev: string read FPrev write FPrev;
  end;

implementation

end.
