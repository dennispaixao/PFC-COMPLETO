<%-- 
    Document   : clienteEditar
    Created on : 21/11/2018, 13:23:46
    Author     : Dennis
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.artenativa.model.Material"%>
<%@page import="br.com.artenativa.model.Fornecedor"%>
<%@page import="br.com.artenativa.model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
       <%@include file="/menu.jsp" %>    
       <h1>Editar cadastro de material</h1>
       <% 
           Material m = (Material) request.getAttribute("material");
           List<Fornecedor> fornecedores = (List<Fornecedor>) request.getAttribute("fornecedores");
    
       %>

        <div class="container" >
            <form action="ControllerFactory" method="post">
                <div class="row row-content">
                    <div class="col-12">
                        <h1> Material </h1>
                    </div>
                    <div class="col-12 col-md-6 offset-md-3">
                        <div class="form-group row">
                            <label for="nome" class="col-md-2 col-form-label">Nome:</label>
                            <div class="col-md-8">
                                 <input type="hidden" name="id" value="<%=m.getId()%>">
                                 <input type="text" class="form-control" name="nome" value="<%=m.getNome()%>"
                                       placeholder="Nome">
                            </div>
                        </div>
                      
                        <div class="form-group row">
                            <label for="precounitario" class="col-md-3 col-form-label">Preço Unitário:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="precounitario"
                                       placeholder="R$" value="<%=m.getPrecoUnitario()%>">
                            </div>
                        </div>
                        <br>
                                       
                        <div class="form-group row">
                            <label for="fornecedor" class="col-md-2 col-form-label">Fornecedor:</label>
                            <div class="col-md-8">
                                <select name="fornecedor" class="form-control">
                                    <% for(Fornecedor p : fornecedores ){ %>   
                                    <option value="<%=p.getId()%>" <%=p.getId()==m.getFornecedor().getId()?"selected":""%>  ><%=p.getNome()%></option>
                                <%
                                    }
                               %>
     
                                </select>
                            </div>
                        </div>                
                
                        <div class="form-group row">
                            <div class=" col-md-6 offset-md-4"  style="text-align: right" >
                                <a href="ControllerFactory?acao=ListarMaterial" style="margin-right: 20px"  > voltar </a>
                                <input type="submit" class="btn " style="background:#00b5bd" name="acao" value="Salvar Material">
                               
                            </div>
                        </div>

                    </div>
                </div>
            </form>



            <div id="mensagem">
                <% if (request.getAttribute("msg") != null) {%>
                <h2><%=request.getAttribute("msg")%> </h2>
                <% }%>
            </div>
        
            <script src="src/js/ConsultarCEP.js"> </script>   
            
       </div>       
              
              
              
              
              
              
              
              
    </body>
</html>
