unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,Math;

type

  { TForm1Menu }

  TForm1Menu = class(TForm)
    Button1Start: TButton;
    Button2Leaders: TButton;
    MenuLabel: TLabel;
    procedure Button1StartClick(Sender: TObject);
    procedure Button2LeadersClick(Sender: TObject);
  private

  public

  end;

var
  Form1Menu: TForm1Menu;
  k1: integer;
  f: file;

implementation
     Uses Unit2,Unit3, Unit4;
{$R *.lfm}

     { TForm1Menu }

procedure TForm1Menu.Button1StartClick(Sender: TObject);  //открыть форму игра, скрыть форму меню
begin
        Form2Play.Show;
        Form1Menu.hide;

end;

procedure TForm1Menu.Button2LeadersClick(Sender: TObject);        //открыть форму лидеры
var i,j,n: integer;
begin
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

end.

