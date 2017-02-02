unit uFornecedorModel;

interface
type
  TFornecedor = class
    private
      FCodFornec : integer;
      FNome : string;
      FCGC : integer;
      FEndereco : string;
      FDataCadastro : TDate;
    public
      property CodFornec : integer read FCodFornec write FCodFornec;
      property Nome : string read FNome write FNome;
      property cgc : integer read FCGC write FCGC;
      property Endereco : string read FEndereco write FEndereco;
      property DataCadastro : Tdate read FDataCadastro write FDataCadastro;
  end;
implementation

end.
