unit uProdutoModel;

interface
type
  TProduto = class
    private
      FCodProd : double;
      FDescricao : string;
      FNCM : double;
      FCategoria : string;
      FDataCadastro : TDate;
    public
      property CodProd :      double read FCodProd      write FCodProd;
      property Descricao :    string read FDescricao    write FDescricao;
      property NCM :          double read FNCM          write FNCM;
      property Categoria :    string read FCategoria    write FCategoria;
      property DataCadastro : Tdate  read FDataCadastro write FDataCadastro;
  end;

  TCategoria = class
    private
      FDescricao: string;
    public
      property Descricao : string read FDescricao write FDescricao;
  end;
implementation

end.
