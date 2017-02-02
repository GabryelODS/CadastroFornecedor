unit uProdutoDao;

interface
uses
  uDmDados,SqlEXpr, DBXOracle,SYSUTILS, DB, uProdutoModel, Generics.Collections;
type
  TPRODUTODAO = class
    private
      FQryProduto : TSQLQuery;
      FListaProduto : TList<TProduto>;
      FListaCategoria : TList<TCategoria>;
//  function ConsultarProdutoEnde(pCtegoria : string) : TProduto;
    public
      procedure Salvar(pProduto : TProduto);
      procedure Update(pProduto : TProduto);
      procedure Deletar(pCodigo : integer);

      function Consultar (pCodigo : Double) : TProduto;
      function ConsultarProduto(pDescricao : string) : TList<TProduto>;
      function ConsultarProdutoNCM(pNCM : double) : TProduto;
      function ConsultarProdCategoria(pCategoria: string): TProduto;
      function ConsultarProdutoDat(pData : TDateTime) : TProduto;
      function ConsultarTodos() :TList<TProduto>;
      function getCategoria(): TList<TCategoria>;


      property ListaProduto : TList<TProduto> read FListaProduto write FListaProduto;
    constructor create;
    const
      SQLInsert = 'insert into CPRODUTO(CODFORNEC,NOME,CGC,ENDERECO,DATACADASTRO) values (GETPROXCOD.NEXTVAL,:NOME,:CGC,:ENDERECO,trunc(sysdate))';
      SQLUpdate = 'update CPRODUTO set DESCRICAO = :DESCRICAO, NCM = :NCM , CATEGORIA = :CATEGORIA, PRECO = :PRECO where CODPROD = :CODPROD';
      SQLDelete = 'DELETE FROM CPRODUTO WHERE CODPROD = :CODPROD';
      SQLConsulta = 'Select * from CPRODUTO WHERE CODPROD = :CodProd';
      SQLConsultaC = 'select * from CPRODUTO where like CGC = %:CGC%';
      SQLConsultaEnde = 'select * from CPRODUTO where  CATEGORIA = :CATEGORIA';
      SQLConsultaDat ='select * from CPRODUTO where datacadastro = :datacadastro ';
      SQLConsultaTodos = 'Select * from CPRODUTO';
      SQLCategoria = 'select * from CCATEGORIA';
  end;
implementation
{ TFornecedorDao }

function TProdutoDao.Consultar(pCodigo : Double) : TProduto;
var
  Produto : TProduto;
begin
  Produto := TProduto.Create;

  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLConsulta);

  FQryProduto.ParamByName('CodProd').AsFloat := pCodigo;

  FQryProduto.Open;

  if not FQryProduto.IsEmpty then
  begin
    FQryProduto.First;
    while not FQryProduto.Eof do
    begin
      Produto.CodProd := FQryProduto.FieldByName('CodProd').AsInteger;
      Produto.Descricao := FQryProduto.FieldByName('Descricao').AsString;
      Produto.NCM := FQryProduto.FieldByName('NCM').AsInteger;
      Produto.Categoria := FQryProduto.FieldByName('Categoria').AsString;
      Produto.DataCadastro := FQryProduto.FieldByName('DATACADASTRO').AsDateTime;

      Result := Produto;

      FQryProduto.Next;
    end;
  end;


end;

function TProdutoDao.ConsultarProduto(pDescricao: string): TList<TProduto>;
var
  Produto : TProduto;
begin
  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add ('select * from CFORNECEDOR where NOME  like  ''%'+(pDescricao)+ '%''');

//  FQryFornecedor.ParamByName('NOME').AsString := pNome;

  FQryProduto.Open;

  while not FQryProduto.Eof do
  begin
    Produto := TProduto.Create;
    Produto.CodProd := FQryProduto.FieldByName('CodProd').AsInteger;
    Produto.Descricao := FQryProduto.FieldByName('Descricao').AsString;
    Produto.NCM := FQryProduto.FieldByName('NCM').AsInteger;
    Produto.Categoria := FQryProduto.FieldByName('Categoria').AsString;
    produto.DataCadastro := FQryProduto.FieldByName('DATACADASTRO').AsDateTime;
  end;
    Result := FListaProduto;
end;

function TProdutoDao.ConsultarProdutoNCM(pNCM: double): TProduto;
var
  Produto : TProduto;
begin
  Produto := TProduto.Create;

  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add('select * from CFORNECEDOR where NCM  like  ''%'+FloatToStr(pNCM)+ '%''');


  FQryProduto.Open;

  while not FQryProduto.Eof do
  begin
    Produto.CodProd := FQryProduto.FieldByName('CodProd').AsFloat;
    Produto.Descricao := FQryProduto.FieldByName('Descricao').AsString;
    Produto.NCM := FQryProduto.FieldByName('NCM').AsFloat;
    Produto.Categoria := FQryProduto.FieldByName('Categoria').AsString;
    Produto.DataCadastro := FQryProduto.FieldByName('DATACADASTRO').AsDateTime;

    Result := Produto;

    FQryProduto.Next;
  end;
end;

function TProdutoDao.ConsultarProdutoDat(pData: TDateTime): TProduto;
var
  Produto : TProduto;
begin
  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLConsultaDat);
  FQryProduto.ParamByName('datacadastro').AsDateTime := pData;

  FQryProduto.Open;

  while not FQryProduto.Eof do
  begin
    Produto := TProduto.Create;
    Produto.CodProd := FQryProduto.FieldByName('CodProd').AsInteger;
    Produto.Descricao := FQryProduto.FieldByName('Descricao').AsString;
    Produto.NCM := FQryProduto.FieldByName('NCM').AsInteger;
    Produto.Categoria := FQryProduto.FieldByName('Categoria').AsString;
    Produto.DataCadastro := FQryProduto.FieldByName('DATACADASTRO').AsDateTime;

    Result := Produto;
    FQryProduto.Next;
  end;

end;

function TProdutoDao.ConsultarProdCategoria(pCategoria: string): TProduto;
var
  Produto : TProduto;
begin
  Produto := TProduto.Create;

  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLConsultaEnde);
  FQryProduto.ParamByName('Categoria').AsString:= pCategoria;
  FQryProduto.Open;

  while not FQryProduto.Eof do
  begin
    Produto := TProduto.Create;
    Produto.CodProd := FQryProduto.FieldByName('CodProd').AsInteger;
    Produto.Descricao := FQryProduto.FieldByName('Descricao').AsString;
    Produto.NCM := FQryProduto.FieldByName('NCM').AsFloat;
    Produto.Categoria := FQryProduto.FieldByName('Categoria').AsString;
    Produto.DataCadastro := FQryProduto.FieldByName('DATACADASTRO').AsDateTime;

    Result := Produto;

    FQryProduto.Next;
  end;
end;

function TProdutoDao.ConsultarTodos : TList<TProduto>;
var
  Produto : TProduto;
begin

  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLConsultaTodos);
  FQryProduto.Open;
  FQryProduto.First;

  while not FQryProduto.Eof do
  begin
    Produto := TProduto.Create;
    Produto.CodProd := FQryProduto.FieldByName('CodProd').AsInteger;
    Produto.Descricao := FQryProduto.FieldByName('Descricao').AsString;
    Produto.NCM := FQryProduto.FieldByName('NCM').AsInteger;
    Produto.Categoria := FQryProduto.FieldByName('Categoria').AsString;
    Produto.DataCadastro := FQryProduto.FieldByName('DATACADASTRO').AsDateTime;
    FListaProduto.Add(Produto);
    FQryProduto.Next;
  end;

  Result := FListaProduto;

end;

constructor TPRODUTODAO.create;
begin
  FQryProduto := TSQLQuery.Create(nil);
  FQryProduto.SQLConnection := dmDados.sqlConexaoFornecedor;

  FListaProduto := TLIST<TProduto>.Create;
  FListaCategoria := Tlist<TCategoria>.create;
end;
procedure TProdutoDao.Deletar(pCodigo: integer);
begin
  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLDelete);

  FQryProduto.ParamByName('CODFORNEC').AsInteger := pCodigo;

  FQryProduto.ExecSQL();
  end;

function TPRODUTODAO.getCategoria: TList<TCategoria>;
var
  Categoria : TCategoria;
begin
  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add('select * from CCATEGORIA');
  FQryProduto.Open;
  FQryProduto.First;
  {
  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLConsultaTodos);
  FQryFornecedor.Open;
  FQryFornecedor.First;}

   while not FQryProduto.Eof do
  begin
    categoria := TCategoria.create;
    categoria.Descricao := FQryProduto.FieldByName('CATEGORIA').AsString;
    FListaCategoria.Add(Categoria);
    FQryProduto.Next;
  end;
end;

procedure TProdutoDao.Salvar(pProduto: TProduto);
begin
  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLInsert);

  FQryProduto.ParamByName('Descricao').AsString := pProduto.Descricao;
  FQryProduto.ParamByName('NCM').AsFloat:= pProduto.NCM;
  FQryProduto.ParamByName('Categoria').AsString := pProduto.Categoria;

  FQryProduto.ExecSQL;

end;

procedure TProdutoDao.Update(pProduto: TProduto);
begin
  FQryProduto.Close;
  FQryProduto.SQL.Clear;
  FQryProduto.SQL.Add(SQLUpdate);

  FQryProduto.ParamByName('Descricao').AsString := pProduto.Descricao;
  FQryProduto.ParamByName('NCM').AsFloat := pProduto.NCM;
  FQryProduto.ParamByName('Categoria').AsString := pProduto.Categoria;
  FQryProduto.ParamByName('CodProd').AsFloat := pProduto.CodProd;

  FQryProduto.ExecSQL;
end;

end.
