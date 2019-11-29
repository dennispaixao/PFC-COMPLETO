<%-- 
    Document   : cliente
    Created on : 19/11/2018, 23:33:13
    Author     : Dennis
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.artenativa.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        
    <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>

    </head>
    
    <body>
       <%@include file="/menu.jsp" %>   
         <%  //recuperar a lista de fornecedores
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
                                <input type="text" class="form-control" name="nome"
                                       placeholder="Nome">
                            </div>
                        </div>
                        <br>
                        
                         <div class="form-group row">
                            <label for="precounitario" class="col-md-3 col-form-label">Preço Unitário:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="precounitario"
                                       placeholder="R$">
                            </div>
                        </div>
                        <br>
                        
                        <div class="form-group row">
                            <label for="fornecedor" class="col-md-2 col-form-label">Fornecedor:</label>
                            <div class="col-md-8">
                                <select name="fornecedor" class="form-control">
                                    <% for(Fornecedor p : fornecedores ){ %>   
                                    <option value="<%=p.getId()%>"><%=p.getNome()%></option>
                                <%
                                    }
                               %>
     
                                </select>
                            </div>
                        </div>
                        <br>

                        <div class="form-group row">
                            <div class="col-md-10" style="text-align: right">

                                <input type="submit" class="btn " style="background:#00b5bd" name="acao" value="Cadastrar Material">
                               
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
        
            <script src="src/js/listarFornecedores.js"> </script>   
            
       </div>
            
    </body>      
</html>

