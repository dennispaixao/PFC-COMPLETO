/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;
import br.com.artenativa.AutorizacaoDeAcesso.AcessoAdministrativo;
import br.com.artenativa.dao.ItemOrcamentoDAO;
import br.com.artenativa.dao.UsuarioDAO;
import br.com.artenativa.model.ItemOrcamento;
import br.com.artenativa.model.Usuario;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AlterarStatusItemOrcamentoAjax extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        try {
            HttpSession sessao = request.getSession();
            if (AcessoAdministrativo.validaSessao(sessao)) {
                
                
                int idItem =Integer.parseInt(request.getParameter("id"));
            
                    ItemOrcamentoDAO idao = new ItemOrcamentoDAO();
                    ItemOrcamento i = idao.buscar(new ItemOrcamento(idItem));
                    switch (i.getStatus()) {
                        case 1:
                            i.setStatus(2);
                            break;
                        case 2:
                            i.setStatus(1);
                            break;
                        case 3:
                            i.setStatus(4);
                            break;
                        case 4:
                            i.setStatus(3);
                            break;
                        default:
                            break;
                    }
                    
                    idao.alterarItem(i);
                    response.getWriter().write(i.getStatus()+"");              
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AlterarStatusItemOrcamentoAjax.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
}
