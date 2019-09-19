<%-- 
    Document   : orcamentoPagar
    Created on : 01/06/2019, 02:39:07
    Author     : Dennis
--%>

<%@page import="br.com.artenativa.util.ParseDates"%>
<%@page import="br.com.artenativa.model.Orcamento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/menu.jsp" %>     
        <%  Orcamento orc = (Orcamento) request.getAttribute("orcamento");
            double total = orc.getValor();
            String totalFormatado = String.format("%.2f", total);
            double p = orc.getTotalPago();
            String pago = String.format("%.2f", p);%>

        <div class="container">
            <div class="row" >
                <div class="col-12 col-md-6">
                    
                    <div style="float:left; width:400px; text-align: left;">
                        <a href="orcamentoListar.jsp" style="margin-right: 20px; font-size:18px; font-weight: bold; color:yellowgreen"  > voltar </a>
                        <h1> Orcamento:<%= orc.getId()%> </h1>
                        <h4> Cliente:<%= orc.getCliente().getNome()%> </h4>
                        <h4> Responsavel:<%= orc.getResponsavel().getNome()%> </h4>
                        <h4> DataCadastro:<%= ParseDates.formatUnixToDisplayNoHour(orc.getDataInicio())%> </h4>
                    </div> 
                </div>
                <div class="col-12 col-md-6">
                    
                    <form action="ControllerFactory" method="POST">

                        <div class="card" style="margin:10px">
                            <div class="card-header text-dark" >
                                <input type="hidden" id="idOrc" value="<%= orc.getId()%>" readonly ><br>
                                <h2>Pagamento</h2>
                            </div>
                            <div class="card-body text-dark">
                                <div class="row">
                                        <div class="col-xl-5">
                                            <div class="form-group row">
                                                <label for="nome" class="col-md-4 col-form-label">Total:</label>
                                                <div class="col-xl-7">
                                                    <input type="text" id="total" value="<%=totalFormatado%>" readonly  class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="nome" class="col-md-4 col-form-label">Pago:</label>
                                                <div class="col-xl-7">
                                                    <input type="text" id="qtpaga" value="<%=pago%>" readonly  class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                 
                                    <div class="col-xl-7">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="form-group row">
                                                    <div class="col-xl-12">
                                                        <input type="text" id="campoPagar" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-7">

                                                <div class="form-group row">
                                                    <div class="col-xl-12">
                                                        <input type="button" id="pagar" value="Inserir Pagamento" class="form-control text-white bg-success">
                                                    </div>
                                                </div>
                                                
                                               
                                            </div>    
                                        
                                        </div>    
                                        <div class="row">
                                            <div class="col-8 offset-4">
                                                     
                                                    
                                                    <div class="form-group row">
                                                    <label for="nome" class="col-xl-5 col-form-label">Troco:</label>
                                                    <div class="col-xl-7">
                                                        <input type="text" id="troco" class="form-control" readonly >
                                                    </div>
                                                </div>
                                                    
                                               
                                            </div>
                                        </div>
                                        
                                     
                                       
                                      
                                        
                                    </div>      
                                </div>    

                               
                            </div>                      
                        </div>

                        


                        </div>  
                    </form>
                </div>
            </div>


            <script src="src/js/GerenciarPagamentoOrcamento.js"></script> 
            <script src="src/js/AprovarOrcamento.js"></script> 
    </body>
</html>
