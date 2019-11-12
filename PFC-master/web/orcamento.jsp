<%-- 
    Document   : orcamento
    Created on : 04/04/2019, 16:02:23
    Author     : Dennis
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/tabela.css" rel="stylesheet" type="text/css"/>
        <title>Orçamento</title>
    </head>

    <body>
        <%@include file="/menu.jsp" %>    
     

           

         <div class="container" >
  
            <form action="ControllerFactory" method="post">
                <div class="row row-content">
                    <div class="col-12">
                        <h1> Orçamento </h1>
                    </div>
                    <div class="col-12 col-md-5">
                        
                        <div class="form-group row">
                            <div class="col-md-12">
                              <h3 id="nomeCli"></h3> <br>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="cliente" class="col-md-4 col-form-label">id do cliente:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="cliente"  
                                       placeholder="id">
                            </div>
                        </div>
                        
                          <div class="form-group row">
                            <label for="datainicio" class="col-md-4 col-form-label">data do início:</label>
                            <div class="col-md-8">
                                <input type="date" class="form-control"  id="datainicio">
                                   
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="dataprevista" class="col-md-4 col-form-label">data prevista:</label>
                            <div class="col-md-8">
                                <input type="date" class="form-control"  id="dataprevista"
                                       placeholder="id">
                            </div>
                        </div>
                          <div class="form-group row">
                            <label for=descricao class="col-md-4 col-form-label">Descricao</label>
                            <div class="col-md-8">
                                <textarea style="height: 200px" class="form-control" id="descricao" rows="12"></textarea>
                            </div>
                        
  
                         </div>
                </div>
                    
                 <div class="col-12 col-md-7">    
                   
                   
                    <div class="form-group row">
                         <label for="dataprevista" class="col-md-3 col-form-label">Inserir Item:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control"  id="q" autocomplete="off">
                                <div id="itens">
                                    <table id="table" class="table table-dark" border="1" >  
                                        <tbody id="tbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        
                           
                    </div>     
                     
                    
                     <div id="tabela-orcamento" style="margin-top:20px; height: 350px; overflow: scroll; background: #333; color:white">
                        <table  class="table table-dark" border="1"  >  
                            <thead>
                            <th>id</th>
                            <th style="width:40%">nome</th>
                            <th>preco</th>
                            <th>qt</th>
                            <th>total</th>
                            <th>opções</th>
                            </thead>     
                            <tbody id="itens-orcamento">
                            <input id="btn-gerar-orcamento" class="btn btn-success" type="button" name="acao" value="gerar orcamento">
                            </tbody>
                        </table>
                        <br>
                        Total  R$<input id="total-orcamento" readonly>
                    </div>  
                 </div> 
        
            </form>
                


            
            
            <div id="mensagem">
                <% if (request.getAttribute("msg") != null) {%>
                <h2><%=request.getAttribute("msg")%> </h2>
                <% }%>
            </div>
        
          </div>  
         </div>

        <script src="src/js/GerarOrcamento.js"></script>  


    </body>      
</html>
