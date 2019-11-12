/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.dao.ProdutoDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class ListarMaterialAction implements ICommand{
   
    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response) {
        try {
         MaterialDAO  mdao = new MaterialDAO();
         request.setAttribute("ListaMateriais", mdao.listar());
         request.setAttribute("pageRedirect", "materialListar.jsp");   
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ListarMaterialAction.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("pageRedirect", "erro.jsp");
            request.setAttribute("erro", "ex");       
        }
        return request;
    } 
}
