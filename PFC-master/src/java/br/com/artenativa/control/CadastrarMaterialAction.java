/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.FornecedorDAO;
import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.model.Fornecedor;
import br.com.artenativa.model.Material;
import br.com.artenativa.util.ParseDates;
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
public class CadastrarMaterialAction implements ICommand {

    String msg;

    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            String nome = request.getParameter("nome");
            int fornecedor = Integer.parseInt(request.getParameter("fornecedor"));
            Float precoUnitario =Float.parseFloat(request.getParameter("precounitario"));
            Material m = new Material();
            m.setNome(nome);
            m.setFornecedor(new FornecedorDAO().buscar(new Fornecedor(fornecedor)));
            m.setDataCadastro(ParseDates.getNowUnix().toString());
            m.setQtEstoque(0);
            m.setQtMin(0);
            m.setPrecoUnitario(precoUnitario);
            
            //validação se tudo ok msg == null
            
            Validator vl = new Validator();
            
            //nos metodos é ideal inverter a ordem de verificação para mensagens obedecerem uma ordem
         
            msg = vl.validaString(nome, "Nome", 2, 40, false); //ultima validação feita ex: nome não pode ficar em branco
   
            if (msg == null) {
                try {
                    MaterialDAO mdao = new MaterialDAO();
                    mdao.inserir(m);
                    msg = "Material " + nome + " cadastrado com sucesso";
                    
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(CadastrarMaterialAction.class.getName()).log(Level.SEVERE, null, ex);
                    
                }
            }
            request.setAttribute("msg", msg);
             
           
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CadastrarMaterialAction.class.getName()).log(Level.SEVERE, null, ex);
        }
         request.setAttribute("pageRedirect", "ControllerFactory?acao=Material");
         return request;
    }


}
