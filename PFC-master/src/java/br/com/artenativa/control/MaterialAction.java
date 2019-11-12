/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.ClienteDAO;
import br.com.artenativa.dao.FornecedorDAO;
import br.com.artenativa.model.Cliente;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class MaterialAction implements ICommand{
    
    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response){

       request.setAttribute("pageRedirect", "material.jsp");
       try {
            FornecedorDAO fdao = new FornecedorDAO();
            request.setAttribute("fornecedores", fdao.listar());
             } catch (SQLException | ClassNotFoundException ex) {}
        
        return request;
    }
    
}
