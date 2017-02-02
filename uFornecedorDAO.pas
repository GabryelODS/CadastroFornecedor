unit uFornecedorDAO;

interface
uses
  uDmDados,SqlEXpr, DBXOracle,SYSUTILS, DB, uFornecedorModel, Generics.Collections;
type
  TFornecedorDao = class
    private
      FQryFornecedor : TSQLQuery;
      FListaFornec : TList<TFornecedor>;
    public
      procedure Salvar(pFornecedor : TFornecedor);
      procedure Update(pFornecedor : TFornecedor);
      procedure Deletar(pCodigo : integer);

      function Consultar (pCodigo : integer) : TFornecedor;
      function ConsultarFornec(pNome : string) : TList<TFornecedor>;
      function ConsultarFornecCgc(pCGC : double) : TFornecedor;
      function ConsultarFornecEnde(pEndereco : string) : TFornecedor;
      function ConsultarFornecDat(pData : TDateTime) : TFornecedor;
      function ConsultarTodos() :TList<TFornecedor>;


      property ListaFornec : TList<TFornecedor> read FListaFornec write FListaFornec;
    constructor create;
    const
      SQLInsert = 'insert into CFORNECEDOR(CODFORNEC,NOME,CGC,ENDERECO,DATACADASTRO) values (GETPROXCOD.NEXTVAL,:NOME,:CGC,:ENDERECO,trunc(sysdate))';
      SQLUpdate = 'update CFornecedor set NOME = :NOME, CGC = :CGC , ENDERECO = :ENDERECO where CODFORNEC = :CODFORNEC';
      SQLDelete = 'DELETE FROM CFORNECEDOR WHERE CODFORNEC = :CODFORNEC';
      SQLConsulta = 'Select * from CFORNECEDOR WHERE CODFORNEC = :Codigo';
      SQLConsultaN = 'select * from CFORNECEDOR where  NOME like :NOME';
      SQLConsultaC = 'select * from CFORNECEDOR where like CGC = %:CGC%';
      SQLConsultaEnde = 'select * from CFORNECEDOR where  ENDERECO = :ENDERECO';
      SQLConsultaDat ='select * from CFORNECEDOR where datacadastro = :datacadastro ';
      SQLConsultaTodos = 'Select * from CFornecedor';


  end;
implementation
{ TFornecedorDao }

function TFornecedorDao.Consultar(pCodigo : integer) : TFornecedor;
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.Create;

  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLConsulta);

  FQryFornecedor.ParamByName('CODIGO').AsInteger := pCodigo;

  FQryFornecedor.Open;

  if not FQryFornecedor.IsEmpty then
  begin
    FQryFornecedor.First;
    while not FQryFornecedor.Eof do
    begin
      fornecedor.CodFornec := FQryFornecedor.FieldByName('CODFORNEC').AsInteger;
      fornecedor.Nome := FQryFornecedor.FieldByName('Nome').AsString;
      fornecedor.cgc := FQryFornecedor.FieldByName('CGC').AsInteger;
      fornecedor.Endereco := FQryFornecedor.FieldByName('ENDERECO').AsString;
      fornecedor.DataCadastro := FQryFornecedor.FieldByName('DATACADASTRO').AsDateTime;

      Result := fornecedor;

      FQryFornecedor.Next;
    end;
  end;


end;

function TFornecedorDao.ConsultarFornec(pNome: string): TList<TFornecedor>;
var
  fornecedor : TFornecedor;
begin
  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add ('select * from CFORNECEDOR where NOME  like  ''%'+(pNome)+ '%''');

//  FQryFornecedor.ParamByName('NOME').AsString := pNome;

  FQryFornecedor.Open;

  while not FQryFornecedor.Eof do
  begin
    fornecedor := TFornecedor.Create;
    fornecedor.CodFornec := FQryFornecedor.FieldByName('CODFORNEC').AsInteger;
    fornecedor.Nome := FQryFornecedor.FieldByName('Nome').AsString;
    fornecedor.cgc := FQryFornecedor.FieldByName('CGC').AsInteger;
    fornecedor.Endereco := FQryFornecedor.FieldByName('ENDERECO').AsString;
    fornecedor.DataCadastro := FQryFornecedor.FieldByName('DATACADASTRO').AsDateTime;
    FListaFornec.Add(fornecedor);

    FQryFornecedor.Next;
  end;
    Result := FListaFornec;
end;

function TFornecedorDao.ConsultarFornecCgc(pCGC: double): TFornecedor;
var
  fornecedor : TFornecedor;
begin
  fornecedor := Tfornecedor.Create;

  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add('select * from CFORNECEDOR where CGC  like  ''%'+fLOATTOSTR(pCGC)+ '%''');


  FQryFornecedor.Open;

  while not FQryFornecedor.Eof do
  begin
    fornecedor.CodFornec := FQryFornecedor.FieldByName('CODFORNEC').AsInteger;
    fornecedor.Nome := FQryFornecedor.FieldByName('Nome').AsString;
    fornecedor.cgc := FQryFornecedor.FieldByName('CGC').AsInteger;
    fornecedor.Endereco := FQryFornecedor.FieldByName('ENDERECO').AsString;
    fornecedor.DataCadastro := FQryFornecedor.FieldByName('DATACADASTRO').AsDateTime;

    Result := fornecedor;

    FQryFornecedor.Next;
  end;
end;

function TFornecedorDao.ConsultarFornecDat(pData: TDateTime): TFornecedor;
var
  fornecedor : TFornecedor;
begin
  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLConsultaDat);
  FQryFornecedor.ParamByName('datacadastro').AsDateTime := pData;

  FQryFornecedor.Open;

  while not FQryFornecedor.Eof do
  begin
    fornecedor := Tfornecedor.Create;
    fornecedor.CodFornec := FQryFornecedor.FieldByName('CODFORNEC').AsInteger;
    Fornecedor.Nome := FQryFornecedor.FieldByName('NOME').AsString;
    Fornecedor.cgc := FQryFornecedor.FieldByName('CGC').AsInteger;
    Fornecedor.Endereco := FQryFornecedor.FieldByName('ENDERECO').AsString;
    Fornecedor.DataCadastro := FQryFornecedor.FieldByName('DATACADASTRO').AsDateTime;

    Result := fornecedor;
    FQryFornecedor.Next;
  end;

end;

function TFornecedorDao.ConsultarFornecEnde(pEndereco: string): TFornecedor;
var
  fornecedor : TFornecedor;
begin
  fornecedor := TFornecedor.Create;

  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLConsultaEnde);
  FQryFornecedor.ParamByName('ENDERECO').AsString:= pEndereco;
  FQryFornecedor.Open;

  while not FQryFornecedor.Eof do
  begin
    fornecedor := TFornecedor.Create;
    fornecedor.CodFornec := FQryFornecedor.FieldByName('CODFORNEC').AsInteger;
    Fornecedor.Nome := FQryFornecedor.FieldByName('NOME').AsString;
    Fornecedor.cgc := FQryFornecedor.FieldByName('CGC').AsInteger;
    Fornecedor.Endereco := FQryFornecedor.FieldByName('ENDERECO').AsString;
    Fornecedor.DataCadastro := FQryFornecedor.FieldByName('DATACADASTRO').AsDateTime;

    Result := fornecedor;

    FQryFornecedor.Next;
  end;
end;

function TFornecedorDao.ConsultarTodos : TList<TFornecedor>;
var
  Fornecedor : TFornecedor;
begin

  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLConsultaTodos);
  FQryFornecedor.Open;
  FQryFornecedor.First;

  while not FQryFornecedor.Eof do
  begin
    Fornecedor := TFornecedor.Create;
    Fornecedor.CodFornec := FQryFornecedor.FieldByName('CODFORNEC').AsInteger;
    Fornecedor.Nome := FQryFornecedor.FieldByName('NOME').AsString;
    Fornecedor.cgc := FQryFornecedor.FieldByName('CGC').AsInteger;
    Fornecedor.Endereco := FQryFornecedor.FieldByName('ENDERECO').AsString;
    Fornecedor.DataCadastro := FQryFornecedor.FieldByName('DATACADASTRO').AsDateTime;
    FListaFornec.Add(Fornecedor);
    FQryFornecedor.Next;
  end;

  Result := FListaFornec;

end;

constructor TFornecedorDao.create;
begin
  FQryFornecedor := TSQLQuery.Create(nil);
  FQryFornecedor.SQLConnection := dmDados.sqlConexaoFornecedor;

  FListaFornec := TLIST<TFornecedor>.Create;

end;

procedure TFornecedorDao.Deletar(pCodigo: integer);
begin
  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLDelete);

  FQryFornecedor.ParamByName('CODFORNEC').AsInteger := pCodigo;

  FQryFornecedor.ExecSQL();
  end;

procedure TFornecedorDao.Salvar(pFornecedor: TFornecedor);
begin
  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLInsert);

  FQryFornecedor.ParamByName('Nome').AsString := pFornecedor.Nome;
  FQryFornecedor.ParamByName('CGC').AsFloat:= pFornecedor.cgc;
  FQryFornecedor.ParamByName('ENDERECO').AsString := pFornecedor.Endereco;

  FQryFornecedor.ExecSQL;

end;

procedure TFornecedorDao.Update(pFornecedor: TFornecedor);
begin
  FQryFornecedor.Close;
  FQryFornecedor.SQL.Clear;
  FQryFornecedor.SQL.Add(SQLUpdate);

  FQryFornecedor.ParamByName('Nome').AsString := pFornecedor.Nome;
  FQryFornecedor.ParamByName('CGC').AsFloat := pFornecedor.cgc;
  FQryFornecedor.ParamByName('ENDERECO').AsString := pFornecedor.Endereco;
  FQryFornecedor.ParamByName('CODFORNEC').AsInteger := pFornecedor.CodFornec;

  FQryFornecedor.ExecSQL;
end;

end.
