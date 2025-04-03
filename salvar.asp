<!--#include file="conexao.asp"-->
<%
Dim modo, titulo, descricao, data, concluida, status, id, sql, sqlCheck, rsCheck

modo = Request.Form("modo")
titulo = Request.Form("titulo")
descricao = Request.Form("descricao")
data = Request.Form("data")

' Verifica se o checkbox foi marcado (Request.Form retorna "" se não marcado)
If Request.Form("concluida") = "1" Then
    status = 1
Else
    status = 0
End If

If modo = "novo" Then
    ' Verifica se já existe tarefa com mesmo título
    sqlCheck = "SELECT COUNT(*) AS Total FROM Tasks WHERE Title = '" & Replace(titulo, "'", "''") & "'"
    Set rsCheck = conn.Execute(sqlCheck)

    If Not rsCheck.EOF And CLng(rsCheck("Total")) > 0 Then
        rsCheck.Close
        Set rsCheck = Nothing
        Response.Redirect "adicionar.asp?erro=duplicado"
        Response.End
    End If
    rsCheck.Close
    Set rsCheck = Nothing

    sql = "INSERT INTO Tasks (Title, Description, DueDate, IsCompleted) VALUES ('" & _
           Replace(titulo, "'", "''") & "', '" & Replace(descricao, "'", "''") & "', '" & data & "', " & status & ")"

ElseIf modo = "editar" Then
    id = Request.Form("id")

    sql = "UPDATE Tasks SET " & _
          "Title='" & Replace(titulo, "'", "''") & "', " & _
          "Description='" & Replace(descricao, "'", "''") & "', " & _
          "DueDate='" & data & "', " & _
          "IsCompleted=" & status & " " & _
          "WHERE Id=" & id
End If

conn.Execute(sql)
Response.Redirect "index.asp"
%>