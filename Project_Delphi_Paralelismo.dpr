program Project_Delphi_Paralelismo;

uses
  Vcl.Forms,
  Delphi_Paralelismo in 'Delphi_Paralelismo.pas' {Form1};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
