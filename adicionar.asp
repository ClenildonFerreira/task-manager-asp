<!--#include file="header.asp"-->
<!--#include file="conexao.asp"-->

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
  <h2 class="text-3xl font-bold mb-6 text-gray-800">Adicionar Nova Tarefa</h2>

  <% If Request.QueryString("erro") = "duplicado" Then %>
    <div class="bg-red-100 text-red-700 p-3 mb-4 rounded-md border border-red-300">
      Já existe uma tarefa com esse título.
    </div>
  <% End If %>

  <form action="salvar.asp" method="post" class="space-y-6" onsubmit="return validarFormulario()">
    <input type="hidden" name="modo" value="novo" />

    <div>
      <label for="titulo" class="block font-semibold text-gray-700 mb-1">Título:</label>
      <input 
        type="text" 
        name="titulo" 
        id="titulo" 
        class="w-full px-4 py-2 border rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-400" 
        required 
      />
    </div>

    <div>
      <label for="descricao" class="block font-semibold text-gray-700 mb-1">Descrição:</label>
      <textarea 
        name="descricao" 
        id="descricao" 
        class="w-full px-4 py-2 border rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-400" 
        rows="4"
      ></textarea>
    </div>

    <div>
      <label for="data" class="block font-semibold text-gray-700 mb-1">Data de Vencimento:</label>
      <input 
        type="date" 
        name="data" 
        id="data" 
        class="w-full px-4 py-2 border rounded-md shadow-sm focus:outline-none focus:ring focus:ring-blue-400" 
        required 
      />
    </div>

    <div class="flex items-center gap-2">
      <input 
        type="checkbox" 
        name="concluida" 
        value="1" 
        class="checkbox checkbox-primary" 
      />
      <label class="text-gray-700">Tarefa Concluída</label>
    </div>

    <div class="flex justify-between mt-6">
      <a href="index.asp" class="px-4 py-2 bg-gray-300 text-gray-800 rounded hover:bg-gray-400 transition">Voltar</a>
      <button type="submit" class="px-4 py-2 bg-blue-600 text-white font-semibold rounded hover:bg-blue-700 transition">
        Salvar Tarefa
      </button>
    </div>
  </form>
</div>

<!--#include file="footer.asp"-->
