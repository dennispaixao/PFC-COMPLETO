/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.dao;


import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Produto;
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
public class ItemProdutoDAO implements ItemProdutoDAOInterface {

    Connection connection;

    public ItemProdutoDAO() throws SQLException, ClassNotFoundException {
        //cria-se o construtor e faz a conexão com o banco aqui e seta o connection
    }  
    
    @Override
    public boolean inserir(ItemProduto i) {
        try {
            connection = ConnectionFactory.getConexao();
            final String INSERT = "insert into itemProduto(idProduto,idmaterial, quantidade) values(?,?,?)";
     
                PreparedStatement ps = connection.prepareCall(INSERT);
                ps.setInt(1, i.getProduto().getId());
                ps.setInt(2, i.getMaterial().getId());
                ps.setFloat(3, i.getQuantidade());
                //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
                ps.executeUpdate(); 
                ps.close();
                connection.close();
                return true;

        } catch (SQLException | ClassNotFoundException ex) {
            return false;
        }  
    }
    
    public ItemProduto temItemNoProduto(Produto o,Produto p) throws SQLException, ClassNotFoundException{
       final String CONSULTA = "Select * from itemProduto where idproduto = ? and idorcamento =?";
       connection = ConnectionFactory.getConexao();
       PreparedStatement ps = connection.prepareCall(CONSULTA);
       ps.setInt(1, p.getId());
       ps.setInt(2, o.getId());
       ResultSet rs = ps.executeQuery();
       if(rs.next()){
           ItemProduto i = new ItemProduto();
           i.setId(rs.getInt("id"));
           i.setProduto(new ProdutoDAO().buscar(new Produto(rs.getInt("idProduto"))));
           i.setProduto(new ProdutoDAO().buscar(new Produto(rs.getInt("idProduto"))));
           i.setQuantidade(rs.getFloat("quantidade"));
           return i;
       }else{
           return null;
       }
    }

    public boolean alterarItem(ItemProduto i) throws SQLException, ClassNotFoundException{
       final String ALTERAR = "update itemorcamento set idorcamento = ?, idproduto =?, quantidade=?, dataInicio=?, datafim=?, status =? where id = ?";
       try{  
         connection = ConnectionFactory.getConexao();
         PreparedStatement ps = connection.prepareCall(ALTERAR);
         ps.setInt(1, i.getProduto().getId());
         ps.setInt(2, i.getProduto().getId());
         ps.setFloat(3, i.getQuantidade());
         ps.setString(4, i.getDataInicio());
         ps.setString(5, i.getDataFim());
         ps.setInt(6, i.getStatus());
         ps.setInt(7, i.getId());
         if(ps.executeUpdate()>0)
             return true;
         return false;
       }catch(ClassNotFoundException | SQLException e){
          return false;
       }finally{
         connection.close();
       }
    }

    public boolean excluirTodos(Produto o ) throws SQLException, ClassNotFoundException {
        connection = ConnectionFactory.getConexao();
        final String EXCLUIR_TODOS = "delete from itemorcamento where idorcamento = ?";
        try {
            PreparedStatement ps = connection.prepareCall(EXCLUIR_TODOS);
            //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
            ps.setInt(1, o.getId());
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ItemProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.close();
            } catch (SQLException ex1) {
                Logger.getLogger(ItemProdutoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return true;
    } 
    
    public boolean excluir(ItemProduto i) throws SQLException, ClassNotFoundException {
        connection = ConnectionFactory.getConexao();
        final String EXCLUIR_TODOS = "delete from itemorcamento where id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(EXCLUIR_TODOS);
            //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
            ps.setInt(1, i.getId());
            ps.executeUpdate();
            ps.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(ItemProdutoDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.close();
            } catch (SQLException ex1) {
                Logger.getLogger(ItemProdutoDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return true;
    }
    
    public ArrayList<ItemProduto> listar(Produto o) throws ClassNotFoundException, SQLException {
        connection = ConnectionFactory.getConexao();
        ArrayList<ItemProduto> itensProduto = new ArrayList<>();
        try {
            final String SELECT_ALL = "select * from itemorcamento where idorcamento = ?";
            PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL);
            pstmt.setInt(1, o.getId());
            try (
                ResultSet rs = pstmt.executeQuery()) {       
                while (rs.next()) {
                    ItemProduto i = new ItemProduto();
                    i.setId(rs.getInt("id"));
                    i.setProduto(new ProdutoDAO().buscar( new Produto((rs.getInt("idproduto")))));
                    i.setProduto(new ProdutoDAO().buscar( new Produto((rs.getInt("idorcamento")))));
                    i.setQuantidade(rs.getFloat("quantidade"));
                    i.setStatus(rs.getInt("status"));
                    itensProduto.add(i);  
                }
               connection.close();
            }
        }catch(SQLException e){}
        return itensProduto;
    }

    @Override
    public boolean alterar(ItemProduto i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean limpar(Produto p) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
 

}