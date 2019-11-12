/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.model.Fornecedor;
import br.com.artenativa.model.Material;
import br.com.artenativa.util.Validator;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class SalvarMaterialAction implements ICommand {

    String msg = null;

    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response) {
        
        try {  
            int id = Integer.parseInt(request.getParameter("id"));
            String nome = request.getParameter("nome");
            int fornecedor =Integer.parseInt(request.getParameter("fornecedor"));
            float precoUnitario= Float.parseFloat(request.getParameter("precounitario"));
            MaterialDAO mdao= new MaterialDAO();
            Material m = mdao.buscar(new Material(id));
            m.setNome(nome);
            m.setFornecedor(new Fornecedor(fornecedor));
            m.setPrecoUnitario(precoUnitario);
            
            //validação se tudo ok msg == null
            Validator vl = new Validator();
            
            msg = vl.validaString(nome, "Nome", 2, 40, false);
            
            if (msg == null) {
                    if(mdao.alterar(m)){;
                    msg = "Material " + nome + " alterado com sucesso";
                    }else{
                    msg = "erro ao alterar";
                    }
            }
            
            request.setAttribute("msg", msg);
            request.setAttribute("ListaMateriais", mdao.listar());
            request.setAttribute("pageRedirect", "materialListar.jsp");
            
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("pageRedirect", "erro.jsp");
            request.setAttribute("erro", ex);
          
        }
        return request;
    }

  
}
