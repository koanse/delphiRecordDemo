program Project1;

{$APPTYPE CONSOLE}
uses
  SysUtils, Classes;

type
  // �������� ��������� �����
  TBook = Record
    author    : string[100];
    title     : string[100];
    year      : Integer;
  end;

type
  TBookArray = array of TBook;

var
  booksArray  : TBookArray;
  size        : Integer;

// ��������� ���� ���� �� ���� ��� ����������
function Compare(const book1, book2: TBook): Integer;
begin
  Result := Trunc(book1.year - book2.year);
end;

// ��������� ��� ������������ ������� ���� ���� � ������� ��� ����������
procedure Swap(var book1, book2: TBook);
var
  temp: TBook;
begin
  temp := book1;
  book1 := book2;
  book2 := temp;
end;

// ���������� ������� �������� ������� ���� 
procedure Sort(var booksArray: array of TBook);
var
  i, n: Integer;
  Swapped: Boolean;
begin
  n := Length(booksArray);
  repeat
    Swapped := False;
    for i := 1 to n - 1 do begin
      if Compare(booksArray[i - 1], booksArray[i]) > 0 then begin
        Swap(booksArray[i - 1], booksArray[i]);
        Swapped := True;
      end;
    end;
    dec(n);
  until not Swapped;
end;

  var
  i, n: Integer;
  resultArray: TBookArray;
  sortedArray: TBookArray;
  book: TBook;
begin
  // ���� ������� ������� ����
  WriteLn('Enter the size of the array:');
  ReadLn(size);

  // �������� ������� ������� ����
  if (size > 30) then
  begin
      WriteLn('Incorrect array size!');
      ReadLn;
      Exit;
  end;

  // ��������� ������� ������� ����
  SetLength(booksArray, size);

 // ���� ������� ����
  for i := 0 to size - 1 do begin
    WriteLn('Enter the element number: ', i);
    WriteLn('Title: ');
    ReadLn(book.title);

    WriteLn('Author: ');
    ReadLn(book.author);

    WriteLn('Year: ');
    ReadLn(book.year);

    booksArray[i] := book;
  end;

  // ���������� ������ ������� ��������
  Sort(booksArray);

  // ����� �����������
  WriteLn('Sorted results: year < 1995');
  for i := 0 to size - 1 do begin
    book := booksArray[i];
    if (book.year < 1995) then
      begin
        WriteLn('Book number: ', i);
        WriteLn('Title: ', book.title);
        WriteLn('Author: ', book.author);
        WriteLn('Year: ', book.year);
      end;
  end;

  // �������� ������� ����� �������
  ReadLn;
end.







