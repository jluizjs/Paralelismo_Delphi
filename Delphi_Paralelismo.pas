unit Delphi_Paralelismo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  System.Threading, Delphi_Paralelismo_Loading;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnSemThread: TButton;
    btnComThread: TButton;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure btnSemThreadClick(Sender: TObject);
    procedure btnComThreadClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    frmLoading: TfrmLoading;
    task_a: IFuture<String>;
    task_b: IFuture<String>;
    task_c: IFuture<String>;
    AllTasks: array[0..1] of ITask;
  public
    { Public declarations }
    procedure ExecutarTasks(aLabel: TLabel; timer: Integer; var aTask: ITask);
    procedure RunningLoading();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ExecutarTasks(aLabel: TLabel; timer: Integer; var aTask: ITask);
begin
  aLabel.Caption := '--';
  aTask := TTask.Run(
    procedure
    begin
      Sleep(timer);
      TThread.Synchronize(TThread.Current,
        procedure
        begin
          aLabel.Caption := Random(100).ToString;
        end);
    end);
end;

procedure TForm1.RunningLoading;
begin
  TTask.Run(
    procedure
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          frmLoading := TFrmLoading.Create(nil);
          frmLoading.Show;
        end);

      TTask.WaitForAll(AllTasks);

      TThread.Queue(TThread.CurrentThread,
        procedure
        begin
          frmLoading.Close;
          frmLoading.DisposeOf;
        end);
    end);
end;

procedure TForm1.btnComThreadClick(Sender: TObject);
begin
  TTask.run(
    procedure
    begin
      Sleep(5000);
      TThread.Synchronize(TThread.Current,
        procedure
        begin
          Label1.Caption := DateTimeToStr(now);
        end);
    end);
end;

procedure TForm1.btnSemThreadClick(Sender: TObject);
begin
  Sleep(2000);
  Label1.Caption := DateTimeToStr(now);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  task : ITask;
begin
  task := TTask.Create(
            procedure
            begin
              SLeep(5000);
              TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin
                  ShowMessage('Thread usando ITask');
                end);
            end);
  task.Start;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TTask.run(
    procedure
    var
      tempoDecorrido: Cardinal;
      resultado : array[0..2] of String;
    begin
      tempoDecorrido := GetTickCount;
      task_a := TTask.Future<String>(
        function: String
        begin
          Sleep(5000);
          Result := Random(1000).ToString;
        end);
      task_b := TTask.Future<String>(
        function: String
        begin
          Sleep(3000);
          Result := Random(1000).ToString;
        end);
      task_c := TTask.Future<String>(
        function: String
        begin
          Sleep(2000);
          Result := Random(1000).ToString;
        end);
      tempoDecorrido := GetTickCount - tempoDecorrido;
      resultado[0] := task_a.Value;
      resultado[1] := task_b.Value;
      resultado[2] := task_c.Value;
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          Label1.Caption := (tempoDecorrido).ToString;
          Label2.Caption := resultado[0];
          Label3.Caption := resultado[1];
          Label4.Caption := resultado[2];
        end);
    end);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Label4.Caption := 'Aguardando...';
  TTask.run(
    procedure
    begin


      TTask.WaitForAll(AllTasks);
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          Label4.Caption := 'Finalizado';
        end);
    end);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ExecutarTasks(Label2, 5000, AllTasks[0]);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ExecutarTasks(Label3, 3000, AllTasks[1]);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  RunningLoading;
end;

end.
