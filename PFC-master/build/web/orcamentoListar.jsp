<%-- 
    Document   : OrcamentoListar
    Created on : 23/05/2019, 16:27:03
    Author     : Dennis
--%>

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
        <div class="container" >
                <div class="row row-content">
                    <div class="col-12">
                         <h1 id="listarh1">Orçamentos</h1> 
             
                     </div>
                    
                 <style> 
                     #menu-orcamento ul a li{
                         display:inline-block;
                         text-decoration:none;
                         color:wheat;
                         margin:20px;
                         margin-right: 0;
                     }
                 </style>
                   <nav id="menu-orcamento" >   
                        <ul>        
                            <a href="orcamentoListar.jsp?status=1"><li id="iniciados"> Iniciados</li></a>
                            <a href="orcamentoListar.jsp?status=2"><li id="producao"> Produção</li></a>
                            <a href="orcamentoListar.jsp?status=3"><li id="entrega"> Entrega</li> </a>
                            <a href="orcamentoListar.jsp?status=4"><li id="finalizados"> Finalizados </li></a>
                        </ul>    
                    </nav>
                        
                         <table class="table table-dark" style="overflow:scroll" >     
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Cliente</th>
                                        <th>Cadastro</th>
                                        <th>Opções</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyOrcamentos">
                                </tbody>
                        </table>
              
                   
              
                        
                
             </div>  
         </div> 
    <script src="src/js/ListarOrcamentos.js"></script>    
    <script src="src/js/AprovarOrcamento.js">  </script> 
    </body>
</html>
