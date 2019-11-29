/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;

import br.com.artenativa.AutorizacaoDeAcesso.AcessoAdministrativo;
import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.model.Material;
import br.com.artenativa.model.mock.MaterialMock;
import br.com.artenativa.util.ParseJson;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dennis
 */
public class BuscarMateriaisAjax extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
              response.setContentType("text/html;charset=UTF-8");
              
              String id = request.getParameter("id"); 
              String retorno;  
              HttpSession sessao = request.getSession();
              try{
        
              if (AcessoAdministrativo.validaSessao(sessao)) { 
                  
                   MaterialDAO pdao = new MaterialDAO();
                   ArrayList<Material> materiais = pdao.listar(id);
                   
               
                ArrayList<MaterialMock> mmock = new ArrayList();
                  for( Material m: materiais){
                      MaterialMock mm= new MaterialMock();
                      mm.setId(m.getId());
                      mm.setNome(m.getNome());  
                      mm.setFornecedor(m.getFornecedor().getNome());
                      mm.setPrecoUnitario(m.getPrecoUnitario());
                      mmock.add(mm);
                  }
                   
                   
                   
                   
                   ParseJson pj = new ParseJson();
                   retorno = pj.parseJson((ArrayList)mmock);
         
                   response.getWriter().write(retorno);
              }
              }catch(IOException | ClassNotFoundException | SQLException e){
                        response.getWriter().write("Nenhum material encontrado");
              }
            
              
             
              
    }
    
 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
