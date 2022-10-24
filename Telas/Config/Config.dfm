object frameConfig: TframeConfig
  Left = 0
  Top = 0
  Caption = '..::Configura'#231#245'es::..'
  ClientHeight = 411
  ClientWidth = 740
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 16
    Width = 289
    Height = 33
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 113
      Height = 19
      Caption = 'Cor de Fundo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ColorBox1: TColorBox
    Left = 141
    Top = 19
    Width = 145
    Height = 22
    NoneColorColor = clNone
    TabOrder = 1
    OnChange = ColorBox1Change
  end
end
