/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.FornecedorDAO;
import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.model.Material;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class AlterarMaterialAction implements ICommand{
    
    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response){
        
       int id = Integer.parseInt(request.getParameter("id"));
       Material p = new Material(id);
       request.setAttribute("pageRedirect", "materialEditar.jsp");
       
       try {
          
       MaterialDAO cdao = new MaterialDAO();
       request.setAttribute("fornecedores", new FornecedorDAO().listar());
       request.setAttribute("material", cdao.buscar(p));

        } catch (SQLException | ClassNotFoundException ex){
            request.setAttribute("pageRedirect", "erro.jsp");
            request.setAttribute("erro", "Não foi possível alterar o material, contate o administrador!");
            return request;
        }
       
        return request;
        
    }
    
}
