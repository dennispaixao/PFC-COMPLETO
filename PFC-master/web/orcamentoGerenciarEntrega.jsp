<%-- 
    Document   : OrcamentoListar
    Created on : 23/05/2019, 16:27:03
    Author     : Dennis
--%>



<%@page import="br.com.artenativa.util.ParseDates"%>
<%@page import="br.com.artenativa.model.Orcamento"%>
<%@page import="java.util.List"%>
<%@page import="br.com.artenativa.model.ItemOrcamento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Orçamentos</title>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/tabela.css" rel="stylesheet" type="text/css"/>
      
        
    </head>
    <body>
        <%@include file="/menu.jsp" %>    
        <div class="container">

        <div class="row">

        <% List<ItemOrcamento> itens = (ArrayList<ItemOrcamento>) request.getAttribute("itens"); %>
        <% Orcamento o = (Orcamento) request.getAttribute("orcamento"); 
            String inicio = ParseDates.formatUnixToDisplay(o.getDataInicio());
            String prevista= ParseDates.formatUnixToDisplay(o.getDataPrevista());
        %> 
        
        <input type="hidden" value="<%=o.getId()%>" id="idOrc">
        <div class="col-5">
               <a href="orcamentoListar.jsp" style="margin-right: 20px; font-size:18px; font-weight: bold; color:yellowgreen"  > voltar </a>  
              <br><br>
               <img src="img/box.png"><h5>Entrega</h5></img> 
              <div class="card card-body bg-dark text-light">
                <h1> Orcamento : <%= o.getId()%> </h1> 
                 <h3> Cliente: <%= o.getCliente().getNome()%></h3>
                 <h5> Início previsto: <%=inicio%></h3>
                 <h5> Termino previsto: <%=prevista%></h3>
              </div>
        </div>  
        <div class="col-7">
              <div class="card bg-dark text-light" style="margin:20px">
                        <div class="card-header">
                        <h3>Relatorio: </h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group row">     
                            <div class="col-md-12">
                                <textarea style="height: 200px" class="form-control" id="descricao" rows="12"><%=o.getRelatorio()%> </textarea>
                            </div>
                         </div>
                        </div>
                    </div>  
        </div> 
        </div>
        <div class="row">
            <div class="col-12">
             <table class="table table-dark">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Item</th>
                        <th>Qt</th>
                        <th>Situacao</th>
                        <th>Ferramentas</th>
                    </tr>
                    
                </thead>
                    <% for(ItemOrcamento i : itens){ %>  
    
                    <tbody>
                        <input type="hidden" value="<%=i.getStatus()%>" id="st">
                        
                        <td id="idItem"><%=i.getId()%> </td> 
                        <td><%= i.getProduto().getNome() %> </td> 
                        <td><%= i.getQuantidade() %> </td>   
                        <td id="tdSit"></td>      
                        <td> <input type="button" id="finalizarItem" > </td>  
                   </tbody>   
                   <% } %>
                </table>
             
           <input type="button" id="FinalizarOrcamento" value="Finalizar Orcamento">
           </div>
        </div>   
    </div> 


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <iframe style="width:100%; height: 500px" src="ControllerFactory?acao=GerenciarPagamento&id=<%=o.getId()%>&modal#pag">

        </iframe>   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
                            
    <script src="src/js/orcamentoGerenciarEntrega.js"> </script>    
    </body>
</html>
