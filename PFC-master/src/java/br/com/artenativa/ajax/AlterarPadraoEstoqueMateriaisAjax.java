/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;


import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.dao.UsuarioDAO;
import br.com.artenativa.model.Material;
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


/**
 *
 * @author Dennis
 */
public class AlterarPadraoEstoqueMateriaisAjax extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession sessao = request.getSession();
            Usuario usuario = (Usuario) sessao.getAttribute("usuario");
            UsuarioDAO udao = new UsuarioDAO();
            if (udao.confirmar(usuario)) {
                
                String retorno="";
                
                String receive = request.getParameter("id");
                String[] paramAlt = receive.split("-");
                
                int idProd = Integer.parseInt(paramAlt[0]);
                Float qt = Float.parseFloat(paramAlt[1]);
                
                try{
                    Material p = new Material(idProd);
                    MaterialDAO pdao= new MaterialDAO();
                    p = pdao.buscar(p);
                    p.setQtMin(qt);
                    pdao.alterar(p);
                    retorno = "A quantidade do material "+p.getNome()+" foi alterada";
                    
                    
                }catch(ClassNotFoundException | SQLException e){
                    
                    retorno = "Não foi possível alterar a quantidade do material";
                    
                    
                }
                
                response.getWriter().write(retorno);
                
            }   } catch (SQLException ex) {
            Logger.getLogger(AlterarPadraoEstoqueMateriaisAjax.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlterarPadraoEstoqueMateriaisAjax.class.getName()).log(Level.SEVERE, null, ex);
        }
    


    } 
}
