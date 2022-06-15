program Project_Delphi_Paralelismo_Loading;

uses
  Vcl.Forms,
  Delphi_Paralelismo_Loading in 'Delphi_Paralelismo_Loading.pas' {frmLoading};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLoading, frmLoading);
  Application.Run;
end.
