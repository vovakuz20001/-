unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Grids;

type

  { TForm4Leaders }

  TForm4Leaders = class(TForm)
    ButtonBack: TButton;
    ButtonExit: TButton;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

  private

  public

  end;

var
  Form4Leaders: TForm4Leaders;

implementation
       Uses Unit1, Unit2, Unit3;
{$R *.lfm}

       { TForm4Leaders }

procedure TForm4Leaders.ButtonExitClick(Sender: TObject);    //закрыть игру
begin
  Form1Menu.close;
  Form2Play.close;
  Form3Win.close;
  close;
end;

procedure TForm4Leaders.StringGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);      //сортировка
begin
    if STringGrid1.RowCount = 1 then exit;
    StringGrid1.SortColRow(true, 1);

end;



procedure TForm4Leaders.ButtonBackClick(Sender: TObject);  //закрыть форму лидеры
begin
   close;
end;


{ TForm4Leaders }



end.

