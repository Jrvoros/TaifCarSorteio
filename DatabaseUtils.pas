unit DatabaseUtils;

interface

procedure InserirDadosBD(const SQL: string);
procedure ExecutarSQL(const SQL: string);

implementation

uses
  SysUtils, Dialogs;

procedure InserirDadosBD(const SQL: string);
begin
  Try
    ShowMessage('Executando: ' + SQL);
    // Aqui entra a l�gica de conex�o e execu��o com o banco de dados
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message);
    end;
  End;
end;

procedure ExecutarSQL(const SQL: string);
begin
  Try
    ShowMessage('Executando consulta: ' + SQL);
    // Aqui entra a l�gica de conex�o, consulta ao banco e mostrar o resultado
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message);
    end;
  End;
end;

end.