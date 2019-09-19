<%-- 
    Document   : clienteEditar
    Created on : 21/11/2018, 13:23:46
    Author     : Dennis
--%>

<%@page import="br.com.artenativa.model.Produto"%>
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
       <h1>Editar cadastro de produto</h1>
       <% 
           Produto p = (Produto) request.getAttribute("produto");
    
       
       
       %>

      
        <div class="container" >
  
            <form action="ControllerFactory" method="post">
                <div class="row row-content">
                    <div class="col-12">
                        <h1> Produto </h1>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group row">
                            <label for="nome" class="col-md-2 col-form-label">Nome:</label>
                            <div class="col-md-8">
                                 <input type="hidden" name="id" value="<%=p.getId()%>">
                                <input type="text" class="form-control" name="nome" value="<%=p.getNome()%>"
                                       placeholder="Nome">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="feedback" class="col-md-2 col-form-label">Descricao</label>
                            <div class="col-md-8">
                                <textarea class="form-control" name="descricao"  name="feedback" rows="12"> 
                                    <%=p.getDescricao()%></textarea>
                            </div>
                    </div>
                        
                    </div>
                    
                    
                    
                    <div class="col-12 col-md-6 " style="vertical-align: right" >
                        <div class="form-group row">
                            <label for="preco" class="col-md-2 col-form-label">Preço:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="preco" id="preco"  value="<%=p.getPreco()%>"
                                       placeholder="Preço">
                            </div>  
                        </div>
                        <div class="form-group row">
                            <label for="peso" class="col-md-2 col-form-label">Peso:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="peso" id="peso" value="<%=p.getPeso()%>"
                                       placeholder="Peso">
                            </div>  
                        </div>
                        
                         <div class="form-group row">
                            <label for="largura" class="col-md-2 col-form-label">Largura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="largura" id="largura" value="<%=p.getLargura()%>" 
                                       placeholder="largura">
                            </div>  
                        </div>

                         <div class="form-group row">
                            <label for="Altura" class="col-md-2 col-form-label">Altura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="altura" id="peso"  value="<%=p.getPeso()%>"
                                       placeholder="altura">
                            </div>  
                        </div>

                         <div class="form-group row">
                            <label for="Espessura" class="col-md-2 col-form-label">Espessura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="espessura" id="espessura" value="<%=p.getEspessura()%>"
                                       placeholder="espessura">
                            </div>  
                        </div>

                        <div class="form-group row">
                            <div class=" col-md-12" style="text-align: right">
                                <a href="ControllerFactory?acao=ListarProduto" style="margin-right: 20px"  > voltar </a>
                                <input type="submit" class="btn " style="background:#00b5bd" name="acao" value="Salvar Produto">
                               
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
