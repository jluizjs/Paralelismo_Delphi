object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 239
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 46
    Height = 19
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 320
    Top = 20
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 320
    Top = 50
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 320
    Top = 82
    Width = 31
    Height = 13
    Caption = 'Label4'
  end
  object btnSemThread: TButton
    Left = 24
    Top = 33
    Width = 75
    Height = 25
    Caption = 'Sem Thread'
    TabOrder = 0
    OnClick = btnSemThreadClick
  end
  object btnComThread: TButton
    Left = 24
    Top = 64
    Width = 75
    Height = 25
    Caption = 'TTask'
    TabOrder = 1
    OnClick = btnComThreadClick
  end
  object Button1: TButton
    Left = 24
    Top = 95
    Width = 75
    Height = 25
    Caption = 'ITask'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 126
    Width = 75
    Height = 25
    Caption = 'IFuture'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Whait'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 232
    Top = 8
    Width = 75
    Height = 25
    Caption = 'ArrayTask 1'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 232
    Top = 39
    Width = 75
    Height = 25
    Caption = 'ArrayTask 2'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 232
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Loading'
    TabOrder = 7
    OnClick = Button6Click
  end
end
