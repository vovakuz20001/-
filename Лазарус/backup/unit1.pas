unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Timer1: TTimer;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Buf: TBitmap;
  Img: array[0..15] of TBitmap;
  path: string;
  map: array[0..3,0..3] of integer;
implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.MenuItem3Click(Sender: TObject);
begin
     close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i,j: integer; win: boolean;
begin
   for i:= 0 to 3 do
   for j:= 0 to 3 do
   Buf.Canvas.Draw(i*64,j*64,Img[ map[i,j]  ]);

   form1.Canvas.Draw(0,0,Buf);

   win:= true;
   if map[0,0]<>1 then win:=false;
   if map[1,0]<>2 then win:=false;
   if map[2,0]<>3 then win:=false;
   if map[3,0]<>4 then win:=false;
   if map[0,1]<>5 then win:=false;
   if map[1,1]<>6 then win:=false;
   if map[2,1]<>7 then win:=false;
   if map[3,1]<>8 then win:=false;
   if map[0,2]<>9 then win:=false;
   if map[1,2]<>10 then win:=false;
   if map[2,2]<>11 then win:=false;
   if map[3,2]<>12 then win:=false;
   if map[0,3]<>13 then win:=false;
   if map[1,3]<>14 then win:=false;
   if map[2,3]<>15 then win:=false;
   if map[3,3]<>16 then win:=false;

   if win=true then
   begin
     timer1.Enabled:=False;
     showmessage('Ты победил!');
   end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
 var i,j,n: integer;
begin
  Buf:=TBitmap.Create;
  Buf.Width:=64*4;
  Buf.Height:=64*4;

  path:=ExtractFileDir(Application.ExeName);

  for i:=0 to 15 do
  begin
    Img[i]:=TBitmap.Create;
    Img[i].LoadFromFile(path+'\img\'+IntToStr(i)+'.bmp');
  end;

  for i:= 0 to 3 do
  for j:= 0 to 3 do
  map[i,j]:=0;

  randomize;
  n:=0;
  while (n<=15) do
  begin
    i:=random(4);
    j:=random(4);
        if map[i,j]=0 then
        begin
          map[i,j]:=n;
          n:=n+1;
        end;
  end;

 Timer1.Enabled:=True;
end;

end.

