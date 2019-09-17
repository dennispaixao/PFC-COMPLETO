<%-- 
    Document   : menu.jsp
    Created on : 03/04/2019, 14:05:02
    Author     : Dennis
--%>


<%@page import="br.com.artenativa.model.Usuario"%>
<link href="src/css/menu.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="src/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="src/css/demo.css" />
<link rel="stylesheet" type="text/css" href="src/css/component.css" />
<script src="js/modernizr.custom.js"></script>

<%try {
        HttpSession sessao = request.getSession();
        Usuario usuario = (Usuario) sessao.getAttribute("usuario");
        if (usuario.getNome() != null) {
            sessao.setMaxInactiveInterval(100000);
%>




 
      <!--  <ul>
         <div>
            <a href="index.jsp"> <li style="text-align: right"> 
                    <div id="logo-menu" 
                         style="  
                         width:40px;
                         height:40px;
                         background-image: url('logoMenu.png');
                         background-size: 80%;
                         background-repeat: no-repeat;
                         background-position: center;
                         position: absolute;
                         transition:2s;
                         top:-10px;
                         ">

                    </div></a>
            </li>
            <li>Cadastrar
                <ul>
                    <a href="cliente.jsp"><li>Cliente</li></a>
                    <a href="funcionario.jsp"><li>Funcionario</li></a>
                    <a href="fornecedor.jsp"><li>Fornecedor</li></a>
                    <a href="produto.jsp"><li>Produto</li></a>
                    <a href="orcamento.jsp"><li>Orçamento</li></a>
                </ul>
            </li>
            <li>Listar
                <ul>
                    <a href="ControllerFactory?acao=ListarCliente"><li>Clientes</li></a>
                    <a href="ControllerFactory?acao=ListarFuncionario"><li>Funcionarios</li></a>
                    <a href="ControllerFactory?acao=ListarFornecedor"><li>Fornecedores</li></a>
                    <a href="ControllerFactory?acao=ListarProduto"><li>Produtos</li></a>
                    <a href="orcamentoListar.jsp"><li>Orçamentos</li></a>
                </ul>
            </li>

            <li>Relatórios
                <ul>
                    <a href="estoque.jsp"><li>Estoque</li></a>
                    <a href="#"><li>Orçamentos</li></a>
                </ul>
            </li>

            <li>
                <form method="post" action="ControllerFactory">
                    <input type="submit" name="acao" value="Deslogar">
                </form>
            </li>    
        </ul>  
        

    </div> 
      --> 
 <div class="container" style="position: absolute; z-index: 899999999">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								
								<li>
									<a class="gn-icon gn-icon-download" style="background: #00b5bd" >Cadastrar</a>
									<ul class="gn-submenu ">
										<li><a class="gn-icon gn-icon-illustrator" href="cliente.jsp" style="background: #00d9df">Cliente</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="funcionario.jsp" style="background: #00d9df">Funcionario</a></li>
                                                                                <li><a class="gn-icon gn-icon-photoshop" href="fornecedor.jsp" style="background: #00d9df">Fornecedor</a></li>
                                                                                <li><a class="gn-icon gn-icon-photoshop" href="produto.jsp" style="background: #00d9df">Produto</a></li>
                                                                                <li><a class="gn-icon gn-icon-photoshop" href="orcamento.jsp" style="background: #00d9df">Orçamento</a></li>
									</ul>
								</li>
                                                                <li>
									<a class="gn-icon gn-icon-download" style="background: #00b5bd" >Listar</a>
									<ul class="gn-submenu ">
										<li><a class="gn-icon gn-icon-illustrator" href="ControllerFactory?acao=ListarCliente" style="background: #00d9df">Clientes</a></li>
										<li><a class="gn-icon gn-icon-photoshop" href="ControllerFactory?acao=ListarFuncionario" style="background: #00d9df">Funcionarios</a></li>
                                                                                <li><a class="gn-icon gn-icon-photoshop" href="ControllerFactory?acao=ListarFornecedor" style="background: #00d9df">Fornecedors</a></li>
                                                                                <li><a class="gn-icon gn-icon-photoshop" href="ControllerFactory?acao=ListarProduto" style="background: #00d9df">Produtos</a></li>
                                                                                <li><a class="gn-icon gn-icon-photoshop" href="orcamentoListar.jsp" style="background: #00d9df">Orçamentos</a></li>
									</ul>
                                                                        <a class="gn-icon gn-icon-download" style="background: #00b5bd" >Relatorios</a>
									<ul class="gn-submenu ">
										<li><a class="gn-icon gn-icon-illustrator" href="estoque.jsp" style="background: #00d9df">Estoque</a></li>
										
									</ul>
								</li>
								
                                                        </ul>
                                                </div><!-- /gn-scroller -->
                                        </nav>
                                </li>
                                <li><a href="index.jsp">Arte Nativa</a></li>
                                <li>
                                    <form method="post" action="ControllerFactory">
                                        <input type="submit" name="acao" class="btn btn-danger" style="margin:5px" value="Deslogar">
                                    </form>
                                </li>
                        </ul>
			
		</div><!-- /container -->
		<script src="src/js/classie.js"></script>
		<script src="src/js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
      
    
    
   
    

<p id="saudacao">
    <%=usuario.getNivel()%><br>
    <%=usuario.getId()%>:
    <%=usuario.getNome()%> <br>
</p>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%} else {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            request.setAttribute("msg", "Não foi possível autenticar o usuário");
            rd.forward(request, response);
        }
    } catch (Exception e) {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        request.setAttribute("msg", "Não foi possível autenticar o usuário");
        rd.forward(request, response);
            }%>            

