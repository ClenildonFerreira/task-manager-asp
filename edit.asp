<!--#include file="header.asp"-->
<!--#include file="conexao.asp"-->

<%
Dim id, sql, rs
id = Request.QueryString("id")
sql = "SELECT * FROM Tasks WHERE Id=" & id
Set rs = conn.Execute(sql)
%>

<div class="max-w-xl mx-auto mt-10 bg-white p-6 rounded-lg shadow-lg">
  <h2 class="text-3xl font-bold mb-6 text-gray-800">Editar Tarefa</h2>

  <form action="salvar.asp" method="post" class="space-y-6">
    <input type="hidden" name="modo" value="editar" />
    <input type="hidden" name="id" value="<%=id%>" />

    <div>
      <label for="titulo" class="block font-semibold text-gray-700 mb-1">Título:</label>
      <input 
        type="text" 
        name="titulo" 
        id="titulo" 
        value="<%=rs("Title")%>" 
        class="w-full px-4 py-2 border rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300" 
        required 
      />
    </div>

    <div>
      <label for="descricao" class="block font-semibold text-gray-700 mb-1">Descrição:</label>
      <textarea 
        name="descricao" 
        id="descricao" 
        class="w-full px-4 py-2 border rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300" 
        rows="4"
      ><%=rs("Description")%></textarea>
    </div>

    <div>
      <label for="data" class="block font-semibold text-gray-700 mb-1">Data de Vencimento:</label>
      <input 
        type="date" 
        name="data" 
        id="data" 
        value="<%=Left(rs("DueDate"), 10)%>" 
        class="w-full px-4 py-2 border rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-300" 
        required 
      />
    </div>

    <div class="flex items-center gap-2">
      <input 
        type="checkbox" 
        name="concluida" 
        value="1" 
        class="checkbox" 
        <% If rs("IsCompleted") = True Then Response.Write("checked") %> 
      />
      <label class="text-gray-700">Tarefa Concluída</label>
    </div>

    <div class="flex justify-between">
      <a href="index.asp" class="btn btn-outline">Voltar</a>
      <button type="submit" class="btn btn-primary">Salvar Alterações</button>
    </div>
  </form>
</div>

<!--#include file="footer.asp"-->
