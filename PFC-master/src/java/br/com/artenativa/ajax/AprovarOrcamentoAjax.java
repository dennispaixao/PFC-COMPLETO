/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;
import br.com.artenativa.AutorizacaoDeAcesso.AcessoAdministrativo;
import br.com.artenativa.dao.ItemOrcamentoDAO;
import br.com.artenativa.dao.OrcamentoDAO;
import br.com.artenativa.dao.ProdutoDAO;
import br.com.artenativa.model.ItemOrcamento;
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
            o = odao.buscar(o);
            o.setEstado(2);
            odao.alterar(o);
                
            ItemOrcamentoDAO idao = new ItemOrcamentoDAO();
            ArrayList<ItemOrcamento> itens = idao.listar(o);
            
            for(ItemOrcamento i : itens){
                ProdutoDAO pdao = new ProdutoDAO();
                Produto p = new Produto(i.getProduto().getId());
                p = pdao.buscar(p);
                Float qtEstoque = p.getQtEstoque()-i.getQuantidade();
                p.setQtEstoque(qtEstoque);
                pdao.alterar(p);
            }
             response.getWriter().write(idOrc + "");     
        }   
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AprovarOrcamentoAjax.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
}
