<%-- 
    Document   : verOrcamento.jsp
    Created on : 24/05/2019, 20:24:53
    Author     : Dennis
--%>

<%@page import="br.com.artenativa.util.ParseDates"%>
<%@page import="br.com.artenativa.model.Orcamento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="src/css/tabela.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="/menu.jsp" %>    
        
      <%  
          Orcamento o = (Orcamento) request.getAttribute("orcamento");
      %>
      
                 <div class="container" >
  
            <form action="ControllerFactory" method="post">
                <div class="row row-content">
                    <div class="col-12">
                      <a href="orcamentoListar.jsp" style="margin-right: 20px; font-size:18px; font-weight: bold; color:yellowgreen"  > voltar </a>
                        <h1> Orcamento </h1>
                        <h4>Orçamento: <%=o.getId()%></h4>
                    <h4>Cliente: <%= o.getCliente().getNome()%> <%= o.getCliente().getSobrenome()%></h4>
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
                                <input type="text" class="form-control" value="<%= o.getCliente().getId() %>" id="cliente"  
                                       placeholder="id">
                            </div>
                        </div>
                        
                          <div class="form-group row">
                            <label for="datainicio" class="col-md-4 col-form-label">data do início:</label>
                            <div class="col-md-8">
                                <input type="date" class="form-control" value="<%= ParseDates.formatUnixToBrowser(o.getDataInicio())%>" id="datainicio">
                                   
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="dataprevista" class="col-md-4 col-form-label">data prevista:</label>
                            <div class="col-md-8">
                                <input type="date" class="form-control"  id="dataprevista" value="<%= ParseDates.formatUnixToBrowser(o.getDataPrevista())%>"
                                       placeholder="id">
                            </div>
                        </div>
                          <div class="form-group row">
                            <label for=descricao class="col-md-4 col-form-label">Descricao</label>
                            <div class="col-md-8">
                                <textarea style="height: 200px" class="form-control" id="descricao" rows="12"> <%= o.getRelatorio() %></textarea>
                            </div>
                        
  
                    </div>
                </div>
                    
                 <div class="col-12 col-md-7">    
                   
                   
                    <div class="form-group row">
                         <label for="dataprevista" class="col-md-3 col-form-label">Inserir Item:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control"  id="q" >
                                <div id="itens">
                                    <table id="table" class="table table-dark" border="1" >  
                                        <tbody id="tbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        
                           
                    </div>     
                     
                    
                     <div id="tabela-orcamento" style="margin-top:20px; height: 350px; overflow: scroll; background: #333; color:white">
                        <table id="table" class="table table-dark" border="1"  >  
                            <thead>
                            <th>id</th>
                            <th>nome</th>
                            <th>preco</th>
                            <th>qt</th>
                            <th>total</th>
                            <th>opções</th>
                            </thead>     
                            <tbody id="itens-orcamento">
                            <input id="btn-alterar-orcamento" style="background: #ffcc66; padding: 5px" type="button" name="acao" value="Continuar Orcamento">

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
                    
              

        <script src="src/js/OrcamentoAlterar.js"></script>     
    </body>
</html>
