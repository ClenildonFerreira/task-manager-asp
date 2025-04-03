<form action="salvar.asp" method="post">
  <input type="hidden" name="modo" value="novo" />
  Título: <input type="text" name="titulo" required /><br />
  Descrição: <textarea name="descricao"></textarea><br />
  Data de vencimento: <input type="date" name="data" required /><br />
  <input type="submit" value="Salvar" />
</form>