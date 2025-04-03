<!--#include file="header.asp"-->
<!--#include file="conexao.asp"-->

<%
Dim id, sql, rs
id = Request.QueryString("id")
sql = "SELECT * FROM Tasks WHERE Id=" & id
Set rs = conn.Execute(sql)
%>

<script>
  function validarFormulario() {
    const dataInput = document.getElementById("data").value;
    const dataSelecionada = new Date(dataInput + "T00:00:00");
    
    const hoje = new Date();
    hoje.setHours(0, 0, 0, 0);

    if (dataSelecionada <= hoje) {
      alert("A data de vencimento deve ser maior que a data atual.");
      return false;
    }

    return true;
  }
</script>

<div class="max-w-xl mx-auto mt-10 bg-white p-6 rounded-lg shadow-lg">
  <h2 class="text-3xl font-bold mb-6 text-gray-800">Editar Tarefa</h2>

  <form action="salvar.asp" method="post" class="space-y-6" onsubmit="return validarFormulario()">
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
        class="w-4 h-4 text-blue-600 border-gray-300 rounded focus:ring focus:ring-blue-300" 
        <% If rs("IsCompleted") = True Then Response.Write("checked") %> 
      />
      <label class="text-gray-700">Tarefa Concluída</label>
    </div>

    <div class="flex justify-between mt-6">
      <a href="index.asp" class="bg-gray-200 text-gray-800 px-4 py-2 rounded hover:bg-gray-300 transition">Voltar</a>
      <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">Salvar Alterações</button>
    </div>
  </form>
</div>

<!--#include file="footer.asp"-->