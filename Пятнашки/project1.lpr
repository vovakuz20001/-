program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit3, Unit4
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1Menu, Form1Menu);
  Application.CreateForm(TForm2Play, Form2Play);
  Application.CreateForm(TForm3Win, Form3Win);
  Application.CreateForm(TForm4Leaders, Form4Leaders);
  Application.Run;
end.

