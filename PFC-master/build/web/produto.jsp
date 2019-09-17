<%-- 
    Document   : cliente
    Created on : 19/11/2018, 23:33:13
    Author     : Dennis
--%>

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
                                <input type="text" class="form-control" name="nome"
                                       placeholder="Nome">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="feedback" class="col-md-2 col-form-label">Descricao</label>
                            <div class="col-md-8">
                                <textarea class="form-control" name="descricao"  name="feedback" rows="12"></textarea>
                            </div>
                    </div>
                        
                    </div>
                    
                    
                    
                    <div class="col-12 col-md-6 " style="vertical-align: right" >
                        <div class="form-group row">
                            <label for="preco" class="col-md-2 col-form-label">Preço:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="preco" id="preco" 
                                       placeholder="Preço">
                            </div>  
                        </div>
                        <div class="form-group row">
                            <label for="peso" class="col-md-2 col-form-label">Peso:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="peso" id="peso" 
                                       placeholder="Peso">
                            </div>  
                        </div>
                        
                         <div class="form-group row">
                            <label for="largura" class="col-md-2 col-form-label">Largura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="largura" id="largura" 
                                       placeholder="largura">
                            </div>  
                        </div>

                         <div class="form-group row">
                            <label for="Altura" class="col-md-2 col-form-label">Altura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="altura" id="peso" 
                                       placeholder="altura">
                            </div>  
                        </div>

                         <div class="form-group row">
                            <label for="Espessura" class="col-md-2 col-form-label">Espessura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="espessura" id="peso" 
                                       placeholder="espessura">
                            </div>  
                        </div>

<br>

                        <div class="form-group row">
                            <div class=" col-md-12" style="text-align: right">

                                <input type="submit" class="btn " style="background:#00b5bd" name="acao" value="Cadastrar Produto">
                                <input type="submit" class="btn "  style="background:#e3ed02" name="acao" value="Listar Produto">
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

