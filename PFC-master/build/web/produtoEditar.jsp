<%-- 
    Document   : cliente
    Created on : 19/11/2018, 23:33:13
    Author     : Dennis
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.com.artenativa.model.ItemProduto"%>
<%@page import="br.com.artenativa.model.Produto"%>
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
       
       <% Produto p = (Produto) request.getAttribute("produto"); %>
       <%  ArrayList<ItemProduto> m = (ArrayList<ItemProduto>) request.getAttribute("materiais"); %>
      
      
       
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
                                <input type="hidden"  name="id" id="id" value=<%=p.getId()%>>
                                <input type="text" class="form-control"  name="nome" id="nome" value=<%=p.getNome()%>
                                       placeholder="Nome">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="feedback" class="col-md-2 col-form-label">Descricao</label>
                            <div class="col-md-8">
                                <textarea class="form-control" name="descricao" id="descricao"   rows="12"><%=p.getDescricao()%></textarea>
                            </div>
                    </div>
                        
                    </div>
                    
                    
                    
                    <div class="col-12 col-md-6 " style="vertical-align: right" >
                        <div class="form-group row">
                            <label for="preco" class="col-md-2 col-form-label">Preço:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" value=<%=p.getPreco()%> name="preco" id="preco" 
                                       placeholder="Preço">
                            </div>  
                        </div>
                        <div class="form-group row">
                            <label for="peso" class="col-md-2 col-form-label">Peso:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="peso" value=<%=p.getPeso()%> id="peso" 
                                       placeholder="Peso">
                            </div>  
                        </div>
                        
                         <div class="form-group row">
                            <label for="largura" class="col-md-2 col-form-label">Largura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="largura" value=<%=p.getLargura()%> id="largura" 
                                       placeholder="largura">
                            </div>  
                        </div>

                         <div class="form-group row">
                            <label for="Altura" class="col-md-2 col-form-label">Altura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="altura" id="altura" value=<%=p.getAltura()%>
                                       placeholder="altura">
                            </div>  
                        </div>

                         <div class="form-group row">
                            <label for="Espessura" class="col-md-2 col-form-label">Espessura:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="espessura" id="espessura" value=<%=p.getEspessura()%>
                                       placeholder="espessura">
                            </div>  
                        </div>
                    </div> 
                        
                 </div> 
                    
                    <div class="col-12">     
                         <div class="form-group row">
                         <label for="dataprevista" class="col-md-2 col-form-label"><b>Inserir material necessário:</b></label>
                            <div class="col-md-3">
                                <input type="text" class="form-control"  id="q" autocomplete="off">
                                <div id="itens" style="position:absolute ;height: 350px; width:100%; overflow: scroll;">
                                    <table id="table" class="table table-dark" border="1" >  
                                        <tbody id="tbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        
                        <div id="tabela-orcamento" style="margin-top:20px; height: 350px; width:100%; overflow: scroll; background: #333; color:white">
                           <table  class="table table-dark" border="1"  >  
                               <thead>
                               <th>id</th>
                               <th style="width:40%">nome</th>
                               <th>fornecedor</th>
                               <th>qt</th>
                               <th>opções</th>
                               </thead>     
                               <tbody id="itens-orcamento">
                               <%for(ItemProduto i :m){%>
                               <tr  class="tr-<%=i.getMaterial().getId()%>">
                                <td><%=i.getMaterial().getId()%></td>
                                <td><%=i.getMaterial().getNome()%></td>
                                <td><%=i.getMaterial().getFornecedor().getNome()%></td>
                                <td style="text-align: center"><input id="item-orc" class="tdqt-<%=i.getMaterial().getId()%>" value="<%=i.getQuantidade()%>" style="width: 50px; margin: 5px; font-size: 20px;" /></td>
                                <td style="text-align: center"> <input type="button" alt="Excluir" title="Excluir" value="x" style="width:30px; color:white; background:#333; padding-left: 3px; padding-right: 3px" class="btnExcluir-<%=i.getMaterial().getId()%>"></td>
                                <script>
                                    document.querySelector(".btnExcluir-<%=i.getMaterial().getId()%>").addEventListener("click",()=>{
                                        let tbody= document.querySelector("#itens-orcamento");
                                        let tr = document.querySelector(".tr-<%=i.getMaterial().getId()%>")
                                        tbody.removeChild(tr);     
                                    })
                                     
                                    
                                </script>    
                                
                               </tr>
                               <%}%>
                               </tbody>
                           </table>
                       </div>      
                    </div>
                        
<br>

                        <div class="form-group row">
                            <div class=" col-md-12" style="text-align: right">
                                 <input type="button" class="btn " style="background:#00b5bd" id="alterarProduto" value="Alterar Produto">
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
            <script src="src/js/AlterarProduto.js"></script>  
            
       </div>
            
    </body>      
</html>

