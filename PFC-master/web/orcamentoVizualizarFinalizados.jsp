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
            <% List<ItemOrcamento> itens = (ArrayList<ItemOrcamento>) request.getAttribute("itens"); %>
            <% Orcamento o = (Orcamento) request.getAttribute("orcamento");%>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card bg-dark text-light">
                                <div class="card-header">
                                <h1>Orçamento <%=o.getId()%></h1>
                                </div>
                                <div class="card-body">
                                <p>Cliente: <%=o.getCliente().getNome()%> <%=o.getCliente().getSobrenome()%></p> 
                                <p>id do cliente: <%=o.getCliente().getId()%></p> 
                                <p>Responsavel: <%=o.getResponsavel().getNome()%> </p> 
                                <p>Valor: <%=o.getValor()%> </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-body bg-dark text-light">
                                <p>Data de insercao: <%=ParseDates.formatUnixToDisplay(o.getDataInsercao())%> </p>   
                                <p>Data de inicio: <%=ParseDates.formatUnixToDisplayNoHour(o.getDataInicio())%> </p>   
                                <p>Data de prevista: <%=ParseDates.formatUnixToDisplayNoHour(o.getDataPrevista())%> </p>   
                                <p>Data do fim: <%=ParseDates.formatUnixToDisplay(o.getDataFim())%> </p>
                            </div>
                        </div>      
                    </div> 
                </div>
                <div class="col-md-6">

                    <div class="card bg-dark text-light">
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
             
               <label for=descricao class="col-12"><h2>Itens</h2></label>
                           
                        
  
                <table class="table table-dark">     
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Item</th>
                            <th>Quantidade</th>

                        </tr>
                    </thead>
                    <% for (ItemOrcamento i : itens) {%>  
    
                    <tbody>
                        <input type="hidden" value="<%=i.getStatus()%>" id="st">
                        
                        <td id="idItem"><%=i.getId()%> </td> 
                        <td><%= i.getProduto().getNome()%> </td> 
                        <td><%= i.getQuantidade()%> </td>   

                   </tbody>   
                    <% }%>
                </table>
             </div>       

        </div>  


    </body>
</html>
