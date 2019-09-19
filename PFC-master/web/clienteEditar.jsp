<%-- 
    Document   : clienteEditar
    Created on : 21/11/2018, 13:23:46
    Author     : Dennis
--%>

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
           Pessoa p = (Pessoa) request.getAttribute("cliente");
     
       
       
       %>
    
              
        <div class="container">

            <form action="ControllerFactory" method="post">
                <div class="row row-content">
                    <div class="col-12">
                        <h1> Cliente </h1>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group row">
                            <label for="nome" class="col-md-2 col-form-label">Nome:</label>
                            <div class="col-md-8">
                                <input type="hidden" name="id" value="<%=p.getId()%>">
                                <input type="text" class="form-control" name="nome" value="<%=p.getNome()%>"
                                       placeholder="Nome">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="sobrenome" class="col-md-2 col-form-label">Sobrenome:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="sobrenome" value="<%=p.getSobrenome()%>"
                                       placeholder="Sobrenome">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="sexo" class="col-md-2 col-form-label">Sexo:</label>
                            <div class="col-md-10">
                                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                    <label class="btn " style="background: #ff6666">
                                        <input type="radio" name="sexo" value="f" autocomplete="off"<% if("f".equals(p.getSexo())){ out.println("checked='checked'");} %>  checked="checked">
                                        Feminino
                                    </label>
                                    <label class="btn" style="background: #00ccff">
                                        <input type="radio" name="sexo"  value="m" autocomplete="off" <% if("m".equals(p.getSexo())){ out.println("checked='checked'");} %>
                                               checked> Masculino
                                    </label>
                                </div>   
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="rg" class="col-md-2 col-form-label">Rg:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="rg" value="<%= p.getRg() %>"
                                       placeholder="Rg">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cpf" class="col-md-2 col-form-label">CPF:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="cpf" value="<%= p.getCpf() %>"
                                       placeholder="cpf">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-2 col-form-label">Email:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="email" value="<%= p.getEmail() %>"
                                       placeholder="Email">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="telefone" class="col-md-2 col-form-label">Telefone:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="telefone" value="<%= p.getTelefone() %>"
                                       placeholder="Telefone">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="celular" class="col-md-2 col-form-label">Celular:</label>
                            <div class="col-md-7">
                                <input type="text" class="form-control" name="celular" value="<%= p.getCelular() %>"
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
                                 <a href="ControllerFactory?acao=ListarCliente" style="margin-right: 20px"  > voltar </a>
                                <input type="submit" class="btn " style="background:#00b5bd" name="acao" value="Salvar Cliente">
                         
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
