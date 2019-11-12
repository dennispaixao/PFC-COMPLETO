<%-- 
    Document   : erro
    Created on : 20/11/2018, 15:37:51
    Author     : Dennis
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/menu.jsp" %>  
        <h1> Erro </h1>
        <p><%= request.getAttribute("erro")%> </p>
            
    </body>
</html>
