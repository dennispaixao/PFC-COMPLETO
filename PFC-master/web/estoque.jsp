<%-- 
    Document   : estoque.jsp
    Created on : 23/05/2019, 21:43:30
    Author     : Dennis
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>JSP Page</title>
        
        <link href="src/css/tabela.css" rel="stylesheet" type="text/css"/>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
      
        <%@include file="/menu.jsp" %>    
        <div class="container">

         

            <link href="src/css/menu-orcamento.css" rel="stylesheet" type="text/css"/>
            <style> 

                #menu-estoque{background:blue; margin-top:30px; text-align: center;}
                #menu-estoque ul{width:800px; margin:0 auto; max-width: 100%; text-align:left}
                #menu-estoque ul li {display: inline; font-size:25px; margin-left:20px;}
                #menu-estoque ul li:hover{cursor:pointer}
                @media only screen and (max-width:600px){#menu-estoque{margin-top:120px;}}


            </style>
          <div class="row">
              <div class="col">
          
                      <div class="col-12 ">    
                   
                   
                    <div class="form-group row">
                         <h1  class="col-12">Estoque</h1>
                           
                        
                           
                    </div>  
           
                   <form>
                       <div class="col-12 col-md-12">    
                   
                   
                    <div class="form-group row">
                         <label for="dataprevista" class="col-md-2 col-form-label" >Pequisar por nome:</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control"  id="q" >
                              
                            </div>
                        
                           
                    </div>    

                          

                  </form>   
                            </div> 
                       <table class="table  text-dark" style="background:#bcbcbc" border="l">    

                               <thead>
                                   <tr>
                                       <th>ID</th>
                                       <th>Produto</th>

                                       <th>Quantidade</th>
                                       <th>Padrao</th>
                                   </tr>
                               </thead>
                               <tbody id="tbodyOrcamentos">
                               </tbody>
                           </table>

              

           </div>  
      

        <script src="src/js/ListarEstoque.js"></script>    

    </body>
</html>
