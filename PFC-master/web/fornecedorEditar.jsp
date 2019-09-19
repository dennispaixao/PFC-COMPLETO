<%-- 
    Document   : clienteEditar
    Created on : 21/11/2018, 13:23:46
    Author     : Dennis
--%>

<%@page import="br.com.artenativa.model.Fornecedor"%>
<%@page import="br.com.artenativa.model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="src/css/cliente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
       <%@include file="/menu.jsp" %>    
     
       <% 
           Fornecedor p = (Fornecedor) request.getAttribute("fornecedor");
    
       
       
       %>
 
          <div class="container">

            <form action="ControllerFactory" method="post">
                <div class="row row-content">
                    <div class="col-12">
                        <h1> Fornecedor </h1>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group row">
                            <label for="nome" class="col-md-2 col-form-label">Nome:</label>
                            <div class="col-md-8">
                                <input type="hidden" name="id" value="<%=p.getId()%>">
                                <input type="text" class="form-control" name="nome"  value="<%=p.getNome()%> "
                                       placeholder="Nome">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cnpj" class="col-md-2 col-form-label">cnpj</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="cnpj"  value="<%=p.getCnpj()%> "
                                       placeholder="cnpj">
                            </div>
                        </div>

                       

                        <div class="form-group row">
                            <label for="email" class="col-md-2 col-form-label">Email:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="email"  value="<%=p.getEmail()%> "
                                       placeholder="Email">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="telefone" class="col-md-2 col-form-label">Telefone:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="telefone"  value="<%=p.getTelefone()%> "
                                       placeholder="telefone">
                            </div>
                        </div>

 
                        <div class="form-group row">
                            <label for="celular" class="col-md-2 col-form-label">Celular:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="celular"  value="<%=p.getCelular()%> "
                                       placeholder="Celular">
                            </div>
                        </div>




                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group row">
                            <label for="cep" class="col-md-2 col-form-label">Cep:</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="cep" id="cep" 
                                       placeholder="Cep">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="rua" class="col-md-2 col-form-label">Rua:</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" id="rua" name=rua"
                                       placeholder="Rua">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bairro" class="col-md-2 col-form-label">Bairro:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="bairro" name=bairro"
                                       placeholder="Bairro">
                            </div>
                        </div>

                        
                        <div class="form-group row">
                            <label for="cidade" class="col-md-2 col-form-label">Cidade:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="cidade" name=cidade"
                                       placeholder="Cidade">
                            </div>
                        </div>

                        
                        <div class="form-group row">
                            <label for="UF" class="col-md-2 col-form-label">UF:</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="uf" name=UF"
                                       placeholder="UF">
                            </div>
                        </div>
                        
                         <div class="form-group row">
                            <label for="numero" class="col-md-2 col-form-label">Numero:</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control" name=numero"
                                       placeholder="ex:88)">
                            </div>
                        </div>
                        
                         <div class="form-group row">
                            <label for="complemento" class="col-md-2 col-form-label">Comp.:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="complemento" name=complemento"
                                       placeholder="complemento">
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="offset-md-2 col-md-10" style="text-align: right">
                                <a href="ControllerFactory?acao=ListarFornecedor" style="margin-right: 20px"  > voltar </a>
                                <input type="submit" class="btn " style="background:#00b5bd" name="acao" value="Salvar Fornecedor">
                               
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
