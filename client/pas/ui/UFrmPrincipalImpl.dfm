object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 481
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelFazerPedido: TPanel
    Left = 3
    Top = 21
    Width = 585
    Height = 246
    Caption = 'PanelFazerPedido'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object Label4: TLabel
      Left = 299
      Top = 8
      Width = 118
      Height = 13
      Caption = 'Retorno do WebService:'
    end
    object Label1: TLabel
      Left = 14
      Top = 109
      Width = 90
      Height = 13
      Caption = 'Tamanho da Pizza:'
    end
    object Label2: TLabel
      Left = 14
      Top = 152
      Width = 74
      Height = 13
      Caption = 'Sabor da Pizza:'
    end
    object Label3: TLabel
      Left = 284
      Top = 23
      Width = 118
      Height = 13
      Caption = 'Retorno do WebService:'
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 583
      Height = 18
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PanelTituloConsultarPedido'
      Color = clLime
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object Label5: TLabel
        Left = 0
        Top = 0
        Width = 583
        Height = 18
        Align = alClient
        Alignment = taCenter
        Caption = 'FAZER PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 81
        ExplicitHeight = 16
      end
    end
    object edtEnderecoBackend: TLabeledEdit
      Left = 12
      Top = 39
      Width = 180
      Height = 21
      EditLabel.Width = 131
      EditLabel.Height = 13
      EditLabel.Caption = 'Endere'#231'o Pizzaria Backend:'
      TabOrder = 1
      Text = 'http://localhost'
    end
    object edtDocumentoCliente: TLabeledEdit
      Left = 14
      Top = 79
      Width = 193
      Height = 21
      EditLabel.Width = 98
      EditLabel.Height = 13
      EditLabel.Caption = 'N'#250'mero Documento:'
      TabOrder = 2
    end
    object edtPortaBackend: TLabeledEdit
      Left = 198
      Top = 39
      Width = 80
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = 'Porta'
      TabOrder = 3
      Text = '8080'
    end
    object cmbTamanhoPizza: TComboBox
      Left = 14
      Top = 125
      Width = 193
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      Items.Strings = (
        'enPequena'
        'enMedia'
        'enGrande')
    end
    object cmbSaborPizza: TComboBox
      Left = 14
      Top = 171
      Width = 193
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      Items.Strings = (
        'enCalabresa'
        'enMarguerita'
        'enPortuguesa')
    end
    object Button1: TButton
      Left = 15
      Top = 198
      Width = 95
      Height = 25
      Caption = '&1 - Fazer Pedido'
      TabOrder = 6
      OnClick = Button1Click
    end
    object mmRetornoWebService: TMemo
      Left = 284
      Top = 42
      Width = 265
      Height = 198
      Lines.Strings = (
        'mmRetornoWebService')
      TabOrder = 7
    end
  end
  object Panel4: TPanel
    Left = 3
    Top = 271
    Width = 585
    Height = 186
    Caption = 'PanelConsultarPedido'
    Color = clSilver
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    object Label7: TLabel
      Left = 146
      Top = 32
      Width = 58
      Height = 13
      Caption = 'Documento:'
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 583
      Height = 18
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PanelTituloConsultarPedido'
      Color = clLime
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 583
        Height = 18
        Align = alClient
        Alignment = taCenter
        Caption = 'CONSULTAR PEDIDO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 113
        ExplicitHeight = 16
      end
    end
    object MemoRetornoConsulta: TMemo
      Left = 128
      Top = 49
      Width = 369
      Height = 135
      TabOrder = 1
    end
    object EditDocumentoPesquisar: TEdit
      Left = 206
      Top = 26
      Width = 188
      Height = 21
      TabOrder = 2
      TextHint = 'Digite aqui o n'#250'mero do documento...'
    end
    object BTNGetPedido: TButton
      Left = 400
      Top = 25
      Width = 95
      Height = 25
      Caption = 'CONSULTAR'
      TabOrder = 3
      OnClick = BTNGetPedidoClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 18
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelTituloConsultarPedido'
    Color = clRed
    ParentBackground = False
    ShowCaption = False
    TabOrder = 2
    object Label6: TLabel
      Left = 0
      Top = 0
      Width = 596
      Height = 18
      Align = alClient
      Alignment = taCenter
      Caption = 'SERVIDOR REST'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 90
      ExplicitHeight = 16
    end
  end
end
