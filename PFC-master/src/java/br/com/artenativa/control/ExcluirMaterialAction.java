/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.model.Material;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class ExcluirMaterialAction implements ICommand{

    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response) {
      
       int id = Integer.parseInt(request.getParameter("id"));
       Material p = new Material(id);
       request.setAttribute("pageRedirect", "materialListar.jsp");
      
       try {
       MaterialDAO mdao = new MaterialDAO();
       
            mdao.excluir(p);
            request.setAttribute("msg", "Material "+p.getId()+" excluído com sucesso!");
            request.setAttribute("ListaMateriais", mdao.listar());
   
      
            
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("pageRedirect", "erro.jsp");
            request.setAttribute("", "Não foi possível excluir o Material, contate o administrador!");
        }
        return request;
        
    }
    
}
