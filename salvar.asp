<!--#include file="conexao.asp"-->
<%
Dim modo, titulo, descricao, data, id, status, sql

modo = Request.Form("modo")
titulo = Request.Form("titulo")
descricao = Request.Form("descricao")
data = Request.Form("data")
id = Request.Form("id")

If Request.Form("concluida") = "1" Then
  status = 1
Else
  status = 0
End If

If modo = "novo" Then
  sql = "INSERT INTO Tasks (Title, Description, DueDate, IsCompleted) VALUES ('" & titulo & "', '" & descricao & "', '" & data & "', " & status & ")"
ElseIf modo = "editar" Then
  sql = "UPDATE Tasks SET Title='" & titulo & "', Description='" & descricao & "', DueDate='" & data & "', IsCompleted=" & status & " WHERE Id=" & id
End If

conn.Execute(sql)
Response.Redirect "index.asp"
%>
