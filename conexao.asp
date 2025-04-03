<%
Dim conn, connStr
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "DRIVER={MySQL ODBC 9.2 ANSI Driver};SERVER=localhost;DATABASE=TaskManager;UID=root;PWD=root;"
conn.Open connStr
%>