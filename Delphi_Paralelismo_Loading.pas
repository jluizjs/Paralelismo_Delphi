unit Delphi_Paralelismo_Loading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls;

type
  TfrmLoading = class(TForm)
    imgLoading: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoading: TfrmLoading;

implementation

{$R *.dfm}

procedure TfrmLoading.FormCreate(Sender: TObject);
begin
  TGIFImage(imgLoading.Picture.Graphic).Animate := True;
end;

end.
