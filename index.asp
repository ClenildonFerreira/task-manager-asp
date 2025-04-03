<!--#include file="header.asp"-->
<!--#include file="conexao.asp"-->

<%
Dim rs, sql
sql = "SELECT * FROM Tasks ORDER BY DueDate ASC"
Set rs = conn.Execute(sql)
%>

<div class="max-w-4xl mx-auto mt-10">
  <h2 class="text-3xl font-bold mb-6 text-center">Lista de Tarefas</h2>

  <div class="overflow-x-auto">
    <table class="table-auto w-full border-collapse border border-gray-300">
      <thead class="bg-gray-200">
        <tr>
          <th class="p-3 border border-gray-300">Título</th>
          <th class="p-3 border border-gray-300">Descrição</th>
          <th class="p-3 border border-gray-300">Data de Vencimento</th>
          <th class="p-3 border border-gray-300">Status</th>
          <th class="p-3 border border-gray-300">Ações</th>
        </tr>
      </thead>
      <tbody>
        <% Do Until rs.EOF %>
          <tr class="text-center">
            <td class="p-3 border border-gray-300"><%=rs("Title")%></td>
            <td class="p-3 border border-gray-300"><%=rs("Description")%></td>
            <td class="p-3 border border-gray-300"><%=Left(rs("DueDate"), 10)%></td>
            <td class="p-3 border border-gray-300">
              <% If rs("IsCompleted") = True Then %>
                <span class="text-green-600 font-semibold">Concluída</span>
              <% Else %>
                <span class="text-red-600 font-semibold">Pendente</span>
              <% End If %>
            </td>
            <td class="p-3 border border-gray-300 space-x-2">
              <a href="edit.asp?id=<%=rs("Id")%>" class="text-blue-500 hover:underline">Editar</a>
              <a href="deletar.asp?id=<%=rs("Id")%>" class="text-red-500 hover:underline" onclick="return confirm('Tem certeza que deseja excluir esta tarefa?');">Excluir</a>
            </td>
          </tr>
        <% 
          rs.MoveNext
        Loop
        rs.Close
        Set rs = Nothing
        %>
      </tbody>
    </table>
  </div>

  <div class="text-center mt-6">
    <a href="add.asp" class="bg-blue-500 text-white px-6 py-2 rounded hover:bg-blue-600 transition">
      ➕ Adicionar Nova Tarefa
    </a>
  </div>
</div>

<!--#include file="footer.asp"-->
