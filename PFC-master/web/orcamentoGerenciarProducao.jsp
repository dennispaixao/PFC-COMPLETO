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
        <title>Or�amentos</title>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/tabela.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <%@include file="/menu.jsp" %>    
        <div class="container">
            <div class="row">


                <% List<ItemOrcamento> itens = (ArrayList<ItemOrcamento>) request.getAttribute("itens"); %>
                <% Orcamento o = (Orcamento) request.getAttribute("orcamento");
                    String inicio = ParseDates.formatUnixToDisplayNoHour(o.getDataInicio());
                    String prevista = ParseDates.formatUnixToDisplayNoHour(o.getDataPrevista());
                %> 

                <input type="hidden" value="<%=o.getId()%>" id="idOrc">
                <div class="col-md-5">
                    <a href="orcamentoListar.jsp" style="margin-right: 20px; font-size:18px; font-weight: bold; color:yellowgreen"  > voltar </a>
                    
                      <br><br>
                     <img src="img/tool.png"><h5>Produ��o</h5></img> 
                    <div class="card card-body bg-dark text-light">
                        
                        <h1> Orcamento : <%= o.getId()%> </h1> 
                        <h3> Cliente: <%= o.getCliente().getNome()%></h3>
                        <h5> In�cio previsto: <%=inicio%></h3>
                            <h5> Termino previsto: <%=prevista%></h3>
                    </div>    
                </div>  
                <div class="col-md-7">
                      <div class="card bg-dark text-light">
                        <div class="card-header">
                        <h3>Relatorio: </h3>
                        </div>
                        <div class="card-body " >
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
                                    <% for (ItemOrcamento i : itens) {%>  

                                    <tbody>
                                    <input type="hidden" value="<%=i.getStatus()%>" id="st">

                                    <td id="idItem"><%=i.getId()%> </td> 
                                    <td><%= i.getProduto().getNome()%> </td> 
                                    <td><%= i.getQuantidade()%> </td>   
                                    <td id="tdSit"></td>      
                                    <td> <input type="button" id="finalizarItem" > </td>  
                                    </tbody>   
                                    <% }%>
                                </table>
                    </div >            
                </div> 

                            <input type="button" id="IniciarEntrega" value="Iniciar Entrega">
                                  
                            <script src="src/js/orcamentoGerenciarProducao.js"></script>    
    </body>
</html>
