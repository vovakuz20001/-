unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, ActnList,DateUtils;

type

  { TForm2Play }

  TForm2Play = class(TForm)
    ButtonAgain: TButton;
    ButtonLeadersShow: TButton;
    LabelTimmeNadpis: TLabel;
    LabelHodiNadpis: TLabel;
    LabelTimme: TLabel;
    LabelHodi: TLabel;
    MainMenu1: TMainMenu;
    proverka: TMenuItem;
    Panel1: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure ButtonAgainClick(Sender: TObject);
    procedure ButtonLeadersShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure proverkaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

  private

  public

  end;

var
  Form2Play: TForm2Play;
  Buf: TBitmap;
  Img: array[0..15] of TBitmap;
  path: string;
  map: array [0..3,0..3] of integer;
  k: integer;
  s: integer =0;
  m: integer =0;
  h: integer =0;


implementation
     Uses Unit1,Unit3, Unit4;
{$R *.lfm}

     { TForm2Play }



procedure TForm2Play.FormCreate(Sender: TObject);   //прорисовка костяшек
var i,j,n: integer;
begin

Timer2.Enabled:=false;

  Buf:=TBitmap.Create;
  Buf.Width:=64*4;
  Buf.Height:=64*4;

  path:=ExtractFileDir(Application.ExeName);

  for i:= 0 to 15 do
  begin
    Img[i]:=TBitmap.Create;
    Img[i].LoadFromFile(path+'\tr\'+IntToStr(i)+'.bmp');      //путь к файлу с картинками костяшек
  end;

  for i:= 0 to 3 do        //рандомное расположение костяшек
  for j:= 0 to 3 do
  map[i,j]:=0;

  randomize;
  n:=0;
  while (n<=15) do
     begin
       i:= random(4);
       j:= random(4);
         if map[i,j]=0 then
         begin
           map[i,j]:=n;
           n:=n+1;
         end;
     end;
end;

function nol(s: string): string;
begin
  if Length(s) =1 then
  Result:= '0'+s
  Else
    Result:=s;
  end;

procedure TForm2Play.ButtonLeadersShowClick(Sender: TObject);  //открытие формы лидеров
var i,j,n: integer;

begin
  Timer2.Enabled:=false;



  Form3Win.Memo1.Lines.Clear;
  Form3Win.Memo1.Lines.LoadFromFile(path+'\reyting.txt');

  n:=Form3Win.Memo1.Lines.Count div 2;
  Form4Leaders.StringGrid1.RowCount:= n+1;

  Form4Leaders.Show;
  Form4Leaders.StringGrid1.Cells[0,0]:='Ник';
  Form4Leaders.StringGrid1.Cells[1,0]:='Время';

  for j:= 1 to n do

  begin
  Form4Leaders.StringGrid1.Cells[0,j]:=Form3Win.Memo1.Lines.Strings[(j-1)*2];
  Form4Leaders.StringGrid1.Cells[1,j]:=Form3Win.Memo1.Lines.Strings[(j-1)*2+1];
end;
end;

procedure TForm2Play.FormClose(Sender: TObject; var CloseAction: TCloseAction);  //чтобы при закрытии формы закрывалась игра
begin
  Form1Menu.close;
end;


procedure TForm2Play.ButtonAgainClick(Sender: TObject);  //новая игра
var i,j,n: integer;
begin
k:=0; h:=0; m:=0; s:=0;

Timer1.Enabled:= true;
Timer2.Enabled:= false;

LabelHodi.Caption:=IntToStr(k);
LabelTimme.Caption:= nol(IntToStr(h))+':'+nol(IntToStr(m))+':'+ nol(IntToStr(s));

for i:= 0 to 3 do
for j:= 0 to 3 do
 map[i,j]:=0;

 randomize;
 n:=0;
 while (n<=15) do
    begin
      i:= random(4);
      j:= random(4);
        if map[i,j]=0 then
        begin
          map[i,j]:=n;
          n:=n+1;
        end;
    end;

end;

procedure TForm2Play.FormMouseDown(Sender: TObject; Button: TMouseButton;   //перемещение костяшек
  Shift: TShiftState; X, Y: Integer);
var i,j: integer;
begin

  Timer2.Enabled:=true;

  if map[x div 64, y div 64]<>0 then
  begin
  inc(k);
  LabelHodi.Caption:=IntToStr(k);
  end;

  for i:= x div 64-1 to x div 64+1 do
  for j:= y div 64-1 to y div 64+1 do


  begin
    if ((i>=0) and (j>=0) and (i<=3) and (j<=3) and (map[i,j]=0) and (i=x div 64)) or
    ((i>=0) and (j>=0) and (i<=3) and (j<=3) and (map[i,j]=0) and (j=y div 64))  then
    begin
      map[i,j]:= map[x div 64, y div 64];
      map[x div 64, y div 64]:=0;
    end;
  end;
end;

procedure TForm2Play.proverkaClick(Sender: TObject);
var i,j,n: integer;
begin
  n:=1;
  for j:=0 to 3 do
  for i:=0 to 3 do

  begin
  map[i,j]:=n;
  inc(n);
  if n>15 then n:=0;
  end;

end;


procedure TForm2Play.Timer1Timer(Sender: TObject);   //проверка на победу
var i,j,n: integer; win: boolean;
begin

       for i:= 0 to 3 do
       for j:= 0 to 3 do
       Buf.Canvas.Draw(i*64,j*64,Img[ map[i,j] ]);

       Form2Play.Canvas.Draw(0,0,Buf);

       win:=true;
       n:=1;
       for j:=0 to 3 do
       for i:= 0 to 3 do
       begin
         if map[i,j]<>n then win:= false;
         inc(n);
         if n> 15 then n:=0;
       end;

         if win=true then
         begin
           Timer1.Enabled:= false;
           Timer2.Enabled:= false;
           Form3Win.show;
         end;
     end;

procedure TForm2Play.Timer2Timer(Sender: TObject); //таймер
begin
     if s = 59 then
        begin
        s:= 0;
          if m = 59 then
        begin
        m:= 0;
          if h = 23 then
        h:= 0
        else
      inc(h);
         end
        else
      inc(m);
         end
        else
      inc(s);



LabelTimme.Caption:= nol(IntToStr(h))+':'+nol(IntToStr(m))+':'+ nol(IntToStr(s));
end;

end.

