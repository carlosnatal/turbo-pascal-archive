program SortRec;

const N = 4;
type
   TInfo = record
     Name: string [40];
     Age:  integer; { ������� }
   end;

   List = array [1..N] of TInfo; { ������ ������� �������� ������� � ��� }

var
  F: file of TInfo;
  Rec: Tinfo;
  I: Integer;

begin { Main }

     Assign (F, 'shop.dat');
     rewrite (F);
     { ���������� ������� ������� }
     for I := 1 to N do
     with Rec do
     begin
          writeln;
          write ('Enter name: '); readln (Name);
          write ('Enter age: ');  readln (Age);
          write (F, Rec);
     end;

     Close (F);
(*
      { ��������������� ����� �� ����� ������� ������� }
     writeln;
     writeln ('Name' : 40, 'Age' : 10);
     for I := 1 to 40 do write ('=');
     writeln;

     for I := 1 to N do
     with rec do
     begin
          write   (   I : 2 );
          write   ( ' ' : 4, Name);
          writeln ( Age : 44 - Length (Name));
     end;

     readln;*)
end.