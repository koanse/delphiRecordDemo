program Project1;

{$APPTYPE CONSOLE}
uses
  SysUtils, Classes;

type
  // Создание структуры Книга
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

// Сравнение двух кнги по году для сортировки
function Compare(const book1, book2: TBook): Integer;
begin
  Result := Trunc(book1.year - book2.year);
end;

// Процедура для перестановки местами двух книг в массиве для соритровки
procedure Swap(var book1, book2: TBook);
var
  temp: TBook;
begin
  temp := book1;
  book1 := book2;
  book2 := temp;
end;

// Сортировка методом пузырька массива книг 
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
  // Ввод размера массива книг
  WriteLn('Enter the size of the array:');
  ReadLn(size);

  // Проверка размера массива книг
  if (size > 30) then
  begin
      WriteLn('Incorrect array size!');
      ReadLn;
      Exit;
  end;

  // Установка размера массива книг
  SetLength(booksArray, size);

 // Ввод массива книг
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

  // Сортировка списка методом пузырька
  Sort(booksArray);

  // Вывод результатов
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

  // Ожидание нажатия любой клавиши
  ReadLn;
end.







