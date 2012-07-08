{ ����஢�� ᫮� � �।������� ��⮤�� ����쪮��� ���஢�� }
program bubblesort;

function prevspace(s:string;from:integer):integer;
begin
	repeat
		dec(from);		
	until (copy(s,from,1)=' ') or (from=1);
	while (copy(s,from-1,1)=' ') and (from>1) do
		dec(from);
	if (from=1) then
		dec(from);
	prevspace:=from;
end;

function nextspace(s:string;from:integer):integer;
begin
	repeat
		inc(from);		
	until (copy(s,from,1)=' ') or (from=length(s));
	while(copy(s,from+1,1)=' ') and (from<length(s)) do
		inc(from);
	if (from=length(s)) then
		inc(from);
	nextspace:=from;
end;

function strcmp(s1,s2:string):boolean;
begin
	strcmp:=s1>s2;
end;

procedure bsort(var s:string);
var i,j,nw,nnw:integer;
	forswap:string;
begin
	i:=length(s)+1;
	while (i>nextspace(s,1)) do (* ���� i �� ������ � ��᫥����� ᫮�� �� ��ࢮ�� *)
		begin
			j:=0;
			while (j<prevspace(s,i)) do (* ��ॡ���� �� ᫮�� � j-⮣� �� i-1-�� : *)
				begin
					nw:=nextspace(s,j);
					nnw:=nextspace(s,nw);
					if strcmp(copy(s,j+1,nw-j-1),copy(s,nw+1,nnw-nw-1)) then (* �᫨ ⥪�饥 ᫮�� ����� ᫥���饣�, � *)
						begin
							forswap:=copy(s,nw,nnw-nw); (* ��१��� ᫥���饥 ᫮�� �� ��ப� � �஡���� ��। ��� *)
							delete(s,nw,nnw-nw); 
							if (j=0) then  (* �᫨ ��⠢�塞 � ��砫� ��ப� *)
								begin
									delete(forswap,1,1); (* ������� �஡�� �� ��砫� ᫮�� � ��� ����� *)
									forswap:=forswap+' ';
								end;
							insert(forswap,s,j); (* ��⠢��� ᫮�� � ��ப� ��। ⥪�騬 *)
						end;
					j:=nextspace(s,j); 
				end;
			i:=prevspace(s,i);
		end;
end;

var s:string;

begin
	writeln('������ ��ப� ��� ����쪮��� ���஢�� : ');
	readln(s); 	(* ����� ��ப� ��� ���஢�� *)
	bsort(s); (* �����஢��� �� *)
	writeln('�����஢����� ��ப� : ');
	writeln(s); (* �뢥�� �� �� ��࠭ *)
end.