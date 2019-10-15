/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.ajax;

import br.com.artenativa.AutorizacaoDeAcesso.AcessoAdministrativo;
import br.com.artenativa.dao.ClienteDAO;
import br.com.artenativa.dao.OrcamentoDAO;
import br.com.artenativa.dao.ProdutoDAO;
import br.com.artenativa.model.Orcamento;
import br.com.artenativa.model.Produto;
import br.com.artenativa.model.mock.OrcamentoMock;
import br.com.artenativa.util.ParseDates;
import br.com.artenativa.util.ParseJson;
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
public class BuscarListaEstoqueAjax extends HttpServlet {

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
              String busca = "";
              busca = request.getParameter("busca"); 
              String retorno; 
               HttpSession sessao = request.getSession();
              try{            
                if (AcessoAdministrativo.validaSessao(sessao)) { 
                  
                   ProdutoDAO pdao = new ProdutoDAO();
                   ArrayList<Produto> produtos = pdao.listar(busca);
                   ParseJson pj = new ParseJson();
                   retorno = pj.parseJson((ArrayList) produtos);
                   response.getWriter().write(retorno); 
                }
                   
              }catch(IOException | ClassNotFoundException | SQLException e){
                        response.getWriter().write("Nenhum produto encontrado");
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
