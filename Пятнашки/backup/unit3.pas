unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm3Win }

  TForm3Win = class(TForm)
    ButtonSave: TButton;
    EditName: TEdit;
    LabelWin2: TLabel;
    LabelWin3: TLabel;
    LabelWin1: TLabel;
    Memo1: TMemo;
    procedure ButtonSaveClick(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public

  end;

var
  Form3Win: TForm3Win;

implementation
        Uses Unit1, Unit2, Unit4;
{$R *.lfm}

{ TForm3Win }



procedure TForm3Win.ButtonSaveClick(Sender: TObject);
begin

if EditName.text<>'' then
   begin

   Memo1.Lines.Clear; // чистим мемо
   Memo1.Lines.LoadFromFile(path+'\reyting.txt');
   Memo1.Lines.Add(EditName.Text);
   Memo1.Lines.Add(Form2Play.LabelTimme.Caption);

   Memo1.Lines.SaveToFile(path+'\reyting.txt');
   Form4Leaders.StringGrid1.RowCount:= Form4Leaders.StringGrid1.RowCount+1;


   EditName.Clear;
   close;
   end

else

begin
  if (length(EditName.text)=0) then
  Application.Title:='Ник';
  ShowMessage('Введите свой ник!');
end;


end;

procedure TForm3Win.EditNameChange(Sender: TObject);
var a: string;
begin
     a:='123456789123456';
     if Length(EditName.text)>Length(a) then
     begin
     showmessage('Вы ввели слишком много символов');
     EditName.text:='';
     end;

end;


procedure TForm3Win.FormActivate(Sender: TObject);   //текст в форме
begin
  LabelWin1.Caption:='Ты победил!';
  LabelWin2.Caption:='Твое время - ' + Form2Play.LabelTimme.Caption;
  LabelWin3.Caption:='Количество ходов - '+ Form2Play.LabelHodi.Caption;
end;


end.

