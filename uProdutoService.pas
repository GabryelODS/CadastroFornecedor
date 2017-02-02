unit uProdutoService;

interface
uses
  uProdutoDao, uProdutoModel, Dialogs,SysUtils, Generics.Collections,uDmDados;
type
  TProdutoService = class
    private
      FPRODUTODAO : TPRODUTODAO;
    public
      procedure EditarProduto(pCodProd : double; pDescricao : string; pCategoria : string; pNCM : Double);
      procedure salvarProduto(pDescricao, pCategoria : string; pNCM : Double);
      procedure DeletarProduto(pCodProd : double);
      procedure validarDados(pProduto : TProduto);

      function ConsultarProdutoCodP(pCodProd : double) : TProduto;
      function ConsultarProduto(pDescricao : String): TList<TProduto>;
      function ConsultarProdutoNCM(pNCM : Double) : TProduto;
      function ConsultarTodos () : TList<TProduto>;
      function ConsultarCategoria() : TList<TCategoria>;
      function ConsultarProdutoCategoria(pCategoria : string) : TProduto;
      function ConsultarProdutodat (pData : TDateTime) : TProduto;
      constructor create;
  end;
implementation

{ TFornecedorService }


function TProdutoService.ConsultarCategoria: TList<TCategoria>;
begin
  Result :=FPRODUTODAO.getCategoria;
end;

function TProdutoService.ConsultarProduto(pDescricao: String): TList<TProduto>;
begin
  Result := FPRODUTODAO.ConsultarProduto(pDescricao);
end;

function TProdutoService.ConsultarProdutoNCM(pNCM: Double): TProduto;
begin
  Result := FPRODUTODAO.ConsultarProdutoNCM(pNCM);
end;

function TProdutoService.ConsultarProdutodat(pData: TDateTime): TProduto;
begin
  Result := FPRODUTODAO.ConsultarProdutodat(pData)
end;

function TProdutoService.ConsultarProdutoCodP(pCodProd: double): TProduto;
begin
  Result := FPRODUTODAO.Consultar(pCodProd);
end;

function TProdutoService.ConsultarProdutoCategoria(pCategoria: string): TProduto;
begin
  Result := FPRODUTODAO.ConsultarProdCategoria(pCategoria);
end;

function TProdutoService.ConsultarTodos: TList<TProduto>;
begin
  Result := FPRODUTODAO.ConsultarTodos;
end;

constructor TProdutoService.create;
begin
  FPRODUTODAO := TPRODUTODAO.create;
end;

procedure TProdutoService.DeletarProduto(pCodProd: Double);
var
  produto : TProduto;
begin
  produto := TProduto.Create;

  FProdutoDao.Deletar(dmDados.cdsFornecedorCodFornec.Value);

end;



procedure TProdutoService.editarProduto(pCodProd: double; pDescricao,
  pCategoria: string; pNCM: double);
var
  Produto : TProduto;
begin
  Produto := TProduto.Create;

  Produto.Descricao := pDescricao;
  Produto.Categoria := pCategoria;
  Produto.NCM := pNCM;
  Produto.CodProd := pCodProd;

  validarDados(produto);

  FProdutodao.Update(produto);

  FreeAndNil(produto);
end;

procedure TProdutoService.salvarProduto(pDescricao, pCategoria: string; pNCM: double);
var
  Produto : TProduto;
begin
  Produto := TProduto.Create;

  Produto.Descricao := pDescricao;
  Produto.NCM := pNCM;
  Produto.Categoria := pCategoria;

  validarDados(Produto);

  FProdutoDao.Salvar(Produto);

  FreeAndNil(Produto);

end;

procedure TProdutoService.validarDados(pProduto: TProduto);
begin
  if pProduto.Descricao = EmptyStr then
  begin
    showMessage ('O Descricao deve ser informado!');
    Abort;
  end;
  if pProduto.NCM = 0 then
  begin
    ShowMessage('o NCM deve ser informado!');
    Abort;
  end;
  if pProduto.Categoria = EmptyStr then
  begin
    ShowMessage('O Categoria deve ser informado!');
    Abort;
  end;
end;
end.
