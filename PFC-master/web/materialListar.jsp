<%-- 
    Document   : verClientes
    Created on : 20/11/2018, 13:10:03
    Author     : Dennis
--%>

<%@page import="br.com.artenativa.util.ParseDates"%>
<%@page import="br.com.artenativa.model.Material"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>JSP Page</title>
        <link href="src/css/tabela.css" rel="stylesheet" type="text/css"/> 
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%@include file="/menu.jsp" %>    
        <div class="container">
            <h1 id="listarh1">Materiais</h1> 
            <%
                List<Material> materiais = (List<Material>) request.getAttribute("ListaMateriais");
            %>
           <table class="table table-dark" border="l">     
                <thead>

                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Cadastro</th>
                        <th>Fornecedor</th>
                        <th>Ferramentas</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Material m : materiais) {
                    %>
                    <tr>
                        <th><%=m.getId()%></th>
                        <td><%=m.getNome()%> </td>
                        <td><%=ParseDates.formatUnixToDisplay(m.getDataCadastro())%> </td>
                        <td><%=m.getFornecedor().getNome()%></td>
                        <td><a onclick="excluir(<%=m.getId()%>)">
                                <img src="img/excluir.png" alt="excluir" title="excluir"/>
                            </a>
                            <a href="ControllerFactory?acao=AlterarMaterial&id=<%=m.getId()%>">
                                <img src="img/editar.png" alt="editar" title="editar"/>
                            </a>
                        </td> 
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <br><br>

            <% if (request.getAttribute("msg") != null) {%>
            <script> alert(" <%= request.getAttribute("msg")%> ");</script>
            <% }%>
            
            <script>
                function excluir(id){
                    if(confirm("deseja excluir o material de id:"+id)){
                        window.location = "ControllerFactory?acao=ExcluirMaterial&id="+id;
                    }   
                }
            </script>    
        </div>
    </body>
</html>
