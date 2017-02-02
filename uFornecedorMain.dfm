object frmFornec: TfrmFornec
  Left = 0
  Top = 0
  Caption = 'Fornecedor'
  ClientHeight = 410
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tabControlFornec: TPageControl
    Left = 0
    Top = 0
    Width = 615
    Height = 410
    ActivePage = ConsultaFornec
    Align = alClient
    TabOrder = 0
    object ConsultaFornec: TTabSheet
      Caption = 'Consulta'
      object DBGrid1: TDBGrid
        Left = 16
        Top = 40
        Width = 577
        Height = 297
        DataSource = dmDados.dtFornecedor
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CodFornec'
            Title.Caption = 'C'#243'digo '
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 166
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CGC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endere'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataCadastro'
            Title.Caption = 'Data de Cadastro'
            Width = 115
            Visible = True
          end>
      end
      object edtConsulta: TEdit
        Left = 167
        Top = 13
        Width = 218
        Height = 21
        TabOrder = 1
        OnKeyDown = edtConsultaKeyDown
      end
      object btnConsultar: TBitBtn
        Left = 480
        Top = 9
        Width = 113
        Height = 25
        Caption = 'Consultar'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = btnConsultarClick
      end
      object cbConsulta: TComboBox
        Left = 16
        Top = 13
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = 'CODIGO'
        Items.Strings = (
          'CODIGO'
          'NOME'
          'CGC'
          'ENDERECO'
          'DATA CADASTRO')
      end
      object btnEditar: TButton
        Left = 518
        Top = 343
        Width = 75
        Height = 25
        Caption = 'Editar'
        TabOrder = 4
        OnClick = btnEditarClick
      end
      object btnExcluir: TButton
        Left = 416
        Top = 343
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 5
        OnClick = btnExcluirClick
      end
    end
    object CadFornec: TTabSheet
      Caption = 'Cadastro Fornecedor'
      ImageIndex = 1
      object btnSalvar: TSpeedButton
        Left = 568
        Top = 344
        Width = 25
        Height = 25
        Glyph.Data = {
          F2060000424DF206000000000000360400002800000019000000190000000100
          080000000000BC020000232E0000232E00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF08F7A4A45B52525252
          52525252525252525B9BA4A407F6FF000000FF09040404040404040404040404
          04040404040404040409FF000000FF8804040404040404040404040404040404
          040404040404FF000000FF989004040404040404040404040404040404040404
          0404FF000000FF9806900404048989898989898989898989040404040404FF00
          0000FF9806069891FF07FFFFFFFFFFFFFFFFFF07FF8904040404FF000000FF98
          060606F5FFEDFF07070707070707FFEDFFED04040404FF000000FF98060606F4
          FFECF6E4E4E4E4E4E4E4F6E4FFE404040404EF000000FF98060606F4FFF4F6E3
          DBDBDBDBDBDBF6E4FFE404040404AF000000FF98060606F4FFEBFFFFFFFFFFFF
          FFFFFFDBFFE404040441AF000000FF98060606ECF608A3E3E3A39AE3E3A39BF6
          F6EC04044201AE000000FF98060606F508F6F6F6F6F6F6F6F6F6F608F6EC0442
          0101AE000000FF98060606F4FFFFFF0808080809F5F6FFFFFFEC42010101AE00
          0000FF98060606F4FFFFF498060698F6F698FFFFFF4C55010101AE000000FF98
          060606F4FFFFF406060606FFFFA1FFFF4C55AE550101AE000000FF06A4A106F4
          FFFFF406060606FFFFA9FF4C0101FFA5A601F6000000FF06FEEB9AF4FFFFF406
          060698F6F6E14D01FF0755070140FF000000FFA8FEFEF2A5FFFFFFF4F4F4F4EB
          F20B01089E559E010404FF000000FFA8FEFEFEFEA4A2A9AAAAAAAAE9F94F08EF
          4CAE01989004FF000000FFA8FEFEFEFEFEEB98060606064DA7F6F9EFEFF90606
          0690FF000000FFA8FEFEFEFEFEFEF2060606A4A4F7085E4FF90606060606FF00
          0000FF06FEFEFEFEFEFEFEF106A4A4A4A30808A4060606060606FF000000FF08
          06A8A8A8A8E8F0A85C5D5D55564E0E060606069806F6FF000000FFFFFFFFFFFF
          FFF6A7A7A7A7A7A7A6A6FFFFFFFFFFFFFFFFFF000000}
        OnClick = btnSalvarClick
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 19
        Width = 577
        Height = 289
        TabOrder = 0
        object Label1: TLabel
          Left = 37
          Top = 26
          Width = 33
          Height = 13
          Caption = 'Codigo'
        end
        object Label2: TLabel
          Left = 37
          Top = 130
          Width = 45
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label4: TLabel
          Left = 37
          Top = 74
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label5: TLabel
          Left = 396
          Top = 130
          Width = 21
          Height = 13
          Caption = 'CGC'
        end
        object edtCodigo: TEdit
          Left = 37
          Top = 45
          Width = 60
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 37
          Top = 93
          Width = 484
          Height = 21
          TabOrder = 1
        end
        object edtEndereco: TEdit
          Left = 37
          Top = 149
          Width = 284
          Height = 21
          TabOrder = 2
        end
        object edtCGC: TEdit
          Left = 396
          Top = 149
          Width = 125
          Height = 21
          TabOrder = 3
        end
      end
    end
  end
end
