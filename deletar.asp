<!--#include file="conexao.asp"-->
<%
id = Request.QueryString("id")
sql = "DELETE FROM Tasks WHERE Id=" & id
conn.Execute(sql)
Response.Redirect "index.asp"
%>