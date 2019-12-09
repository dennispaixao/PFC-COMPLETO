/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;
import br.com.artenativa.AutorizacaoDeAcesso.AcessoAdministrativo;
import br.com.artenativa.dao.ItemOrcamentoDAO;
import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.dao.OrcamentoDAO;
import br.com.artenativa.dao.ProdutoDAO;
import br.com.artenativa.model.ItemOrcamento;
import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Orcamento;
import br.com.artenativa.model.Produto;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class AprovarOrcamentoAjax extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sessao = request.getSession();
        try {
        if (AcessoAdministrativo.validaSessao(sessao)) { 
            String id = request.getParameter("id");
            int idOrc = Integer.parseInt(id);
            Orcamento o = new Orcamento(idOrc);       
            OrcamentoDAO odao= new OrcamentoDAO();
            String resposta = "Estoque Insuficiente, necessário: \n";
            o = odao.buscar(o);
            o.setItens(new ItemOrcamentoDAO().listar(o));
            
            ArrayList<ItemOrcamento> prodFalta = new ArrayList(); //para baixa de materiais
            ArrayList<ItemOrcamento> prodTem = new ArrayList(); //para baixa de produtos
            
            for(ItemOrcamento io: o.getItens()){
                float prodEstoque = io.getProduto().getQtEstoque();
                float qtProdFaltantes= io.getQuantidade() - prodEstoque<0?0:io.getQuantidade() - prodEstoque;
                float qtProdTem=io.getQuantidade()-qtProdFaltantes;
                ItemOrcamento itemFalta = new ItemOrcamento();
                itemFalta.setProduto(io.getProduto());
                itemFalta.setQuantidade(qtProdFaltantes);
                ItemOrcamento itemTem=new ItemOrcamento();
                itemTem.setProduto(io.getProduto());
                itemTem.setQuantidade(qtProdTem);
                prodFalta.add(itemFalta);
                prodTem.add(itemTem);    
            }
            
            ArrayList<ItemProduto> matHash = new ArrayList();
            for(ItemOrcamento io : prodFalta){
               for(ItemProduto ip:io.getProduto().getMateriais()){
                   boolean tem = false;
                   for(ItemProduto mh: matHash){
                       if(mh.getMaterial().getId()==ip.getMaterial().getId()){
                           mh.setQuantidade(mh.getQuantidade()+ip.getQuantidade()*io.getQuantidade());
                           tem = true;
                       }
                   }
                   if(tem==false){
                     ItemProduto ihash= new ItemProduto();
                     ihash.setMaterial(ip.getMaterial());
                     ihash.setQuantidade(ip.getQuantidade()*io.getQuantidade());
                     matHash.add(ihash);
                    
                   }
               }
            }
            
            boolean estoqueok= true;
            for(ItemProduto i:matHash){
               if(i.getQuantidade()>i.getMaterial().getQtEstoque()){
                    estoqueok= false;
               }
               resposta+= i.getMaterial().getNome()+": "+i.getQuantidade()+ "\n";
            }
            
            System.out.println(estoqueok);
            if(estoqueok){
                o.setEstado(4);
                odao.alterar(o);
                for(ItemOrcamento i:prodTem){
                    i.getProduto().setQtEstoque(i.getProduto().getQtEstoque()-i.getQuantidade());
                    new ProdutoDAO().alterar(i.getProduto());
                    
                } 
                for(ItemProduto i:matHash){
                    i.getMaterial().setQtEstoque(i.getMaterial().getQtEstoque()-i.getQuantidade());
                    new MaterialDAO().alterar(i.getMaterial());
                     
                }
                resposta = "orçamento aprovado \n Baixas em estoques efetuadas";
            } 
            
             response.getWriter().write(resposta);     
        }   
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AprovarOrcamentoAjax.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
}
