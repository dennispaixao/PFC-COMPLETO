/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;

import br.com.artenativa.AutorizacaoDeAcesso.AcessoAdministrativo;
import br.com.artenativa.dao.ItemProdutoDAO;
import br.com.artenativa.dao.ProdutoDAO;
import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Material;
import br.com.artenativa.model.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dennis
 */
public class AlterarProdutoAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession sessao = request.getSession();

            String erro = null;
            String retorno = "";

        //recebe-se uma string com os parametros do orçamento
        String itens = request.getParameter("itens");
        //separa-se cada parametro em um indice do array
        String[] campos = itens.split(",");

        //separa-se cada campo em uma variável
        String its = campos[0]; //ids dos produtos e quantidades de cada produto separado por 'id : qt'
        String nome = campos[1];  //id do cliente
        String descricao = campos[2];
        double preco = Double.parseDouble(campos[3]);
        double peso = Double.parseDouble(campos[4]);
        double largura = Double.parseDouble(campos[5]);
        double altura = Double.parseDouble(campos[6]);
        double espessura = Double.parseDouble(campos[7]);
        int id= Integer.parseInt(campos[8]);
        
        if (AcessoAdministrativo.validaSessao(sessao)) {
            Produto p = new Produto(id);
            p.setNome(nome);
            p.setDescricao(descricao);
            p.setPreco(preco);
            p.setPeso(peso);
            p.setLargura(largura);
            p.setAltura(altura);
            p.setEspessura(espessura);
            try {

                ProdutoDAO pdao = new ProdutoDAO();
                pdao.alterar(p); 
                new ItemProdutoDAO().excluirTodos(p); 
                if(!its.isEmpty()){
                String[] itensProd = its.split(";");
              
                for (String itensProd1 : itensProd) {
                    String[] item = itensProd1.split(":");
                    int idMaterial = Integer.parseInt(item[0]);
                    Float quantidade = Float.parseFloat(item[1]);
                    ItemProduto iProd= new ItemProduto();  
                    iProd.setProduto(new Produto(p.getId())); 
                    iProd.setMaterial(new Material(idMaterial));
                    iProd.setQuantidade(quantidade);
                    ItemProdutoDAO idao = new ItemProdutoDAO();
                    idao.inserir(iProd);
                }}

                retorno = "O produto foi alterado com sucesso!";
            } catch (ClassNotFoundException | SQLException e) {
                retorno = "Erro ao alterar";
            }
        } 

        response.getWriter().write(retorno);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AlterarProdutoAjax.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
