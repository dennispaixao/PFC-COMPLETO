/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.dao;

import br.com.artenativa.model.Fornecedor;
import br.com.artenativa.model.Material;
import br.com.artenativa.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dennis
 */
public class MaterialDAO implements MaterialDAOInterface {

    Connection connection;

    public MaterialDAO() throws SQLException, ClassNotFoundException {
        //cria-se o construtor e faz a conexão com o banco aqui e seta o connection
      
    }
 
    
    @Override
    public boolean inserir(Material m) {
      
        final String INSERT = "insert into material(nome, qtEstoque, qtMin, dataCadastro, fornecedor, precounitario, situacao) values (?, ?, ?, ?, ?,?,1)";

        try {
            connection = ConnectionFactory.getConexao();
            PreparedStatement ps = connection.prepareCall(INSERT);
            ps.setString(1, m.getNome());
            ps.setFloat(2, m.getQtEstoque());
            ps.setFloat(3, m.getQtMin());
            ps.setString(4, m.getDataCadastro());
            ps.setInt(5, m.getFornecedor().getId());
            ps.setFloat(6, m.getPrecoUnitario());
        

            
            //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
            ps.executeUpdate();
            ps.close();
            connection.close();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        
        }
        return true;
        
    }

    @Override
    public boolean alterar(Material m) {

        final String ALTERAR = "update material set "
              + " nome = ?,"
              + " qtestoque = ?,"
              + " qtmin = ?,"
              + " fornecedor = ?,"  
              + " precounitario = ?"  
              + " where id = ?";

        try {
            connection = ConnectionFactory.getConexao();
            try (PreparedStatement ps = connection.prepareCall(ALTERAR)) {
                ps.setString(1, m.getNome());
                ps.setFloat(2, m.getQtEstoque());
                ps.setFloat(3, m.getQtMin());
                ps.setInt(4, m.getFornecedor().getId());
                ps.setFloat(5, m.getPrecoUnitario());
     
                ps.setInt(6, m.getId());    
                ps.executeUpdate();
            }
            connection.close();
            return true;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
          
        }

    }

    @Override
    public boolean excluir(Material m) {

        final String DELETE = "update material set situacao = 0 where id = ?";
        try {
                connection = ConnectionFactory.getConexao();
            PreparedStatement ps = connection.prepareCall(DELETE);
            //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
            ps.setInt(1, m.getId());
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
           
        }
        return true;
    }

    @Override
    public ArrayList<Material> listar() {
        ArrayList<Material> materiais = new ArrayList<>();
        try {
            connection = ConnectionFactory.getConexao();
            final String SELECT_ALL = "SELECT * FROM material WHERE situacao <> 0 order by id desc";
            PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL);
            try ( //executa          
                ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Material m = new Material();
                    m.setId(rs.getInt("id"));
                    m.setNome(rs.getString("nome"));
                    m.setDataCadastro(rs.getString("datacadastro"));
                    m.setQtMin(rs.getFloat("qtestoque"));
                    m.setQtEstoque(rs.getFloat("qtmin"));
                    m.setPrecoUnitario(rs.getFloat("precounitario"));
                    m.setFornecedor(new FornecedorDAO().buscar(new Fornecedor(rs.getInt("fornecedor"))));
                    materiais.add(m);
                }
            }
              connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return materiais;
    }
    

    @Override
    public Material buscar(Material m) {
        
        final String BUSCAR = "SELECT * FROM material WHERE ID = ?";

        try {
            connection = ConnectionFactory.getConexao();
            PreparedStatement pstmt = connection.prepareStatement(BUSCAR);
            pstmt.setInt(1, m.getId());
            //executa
            ResultSet rs = pstmt.executeQuery();

            // como a query ira retornar somente um registro, faremos o NEXT
            rs.next();

            m.setNome(rs.getString("nome"));
            m.setDataCadastro(rs.getString("datacadastro"));
            m.setQtEstoque(rs.getFloat("qtestoque"));
            m.setQtMin(rs.getFloat("qtmin"));
            m.setPrecoUnitario(rs.getFloat("precounitario"));
            m.setFornecedor(new FornecedorDAO().buscar(new Fornecedor(rs.getInt("fornecedor"))));

            connection.close();
        }catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
          
        }
     
       return m;
    }

    @Override
    public ArrayList<Material> listar(String nome) {
       
        ArrayList<Material> materiais = new ArrayList<>();
        try {
                connection = ConnectionFactory.getConexao();
            final String SELECT_ALL = "SELECT id, nome,precounitario,fornecedor,qtestoque, qtmin,  datacadastro FROM material WHERE situacao <> 0 and nome ilike ? order by id desc";
            PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL);
             pstmt.setString(1, "%"+nome+"%");
            try ( //executa
                ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {

                    Material p = new Material();
                    p.setId(rs.getInt("id"));
                    p.setNome(rs.getString("nome"));
                    p.setPrecoUnitario(rs.getFloat("precounitario"));
                    p.setDataCadastro(rs.getString("datacadastro"));
                    p.setQtMin(rs.getFloat("qtmin"));
                    p.setQtEstoque(rs.getFloat("qtestoque"));
                    p.setFornecedor(new FornecedorDAO().buscar(new Fornecedor(rs.getInt("fornecedor"))));
                
                    //add na lista
                    materiais.add(p);
                }
               connection.close();
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MaterialDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        return materiais;
    }

 




}