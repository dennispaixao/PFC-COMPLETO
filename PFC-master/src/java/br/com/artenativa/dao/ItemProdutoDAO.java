/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.dao;


import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Material;
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
    
 

 
    @Override
    public boolean excluirTodos(Produto p )  {
        try {
        connection = ConnectionFactory.getConexao();
        final String EXCLUIR_TODOS = "delete from itemproduto where idproduto = ?";
       
            //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
            try (PreparedStatement ps = connection.prepareCall(EXCLUIR_TODOS)) {
                //execute Update retorna um inteiro diferente do executeQuery que retorna um resultSet(dados da consulta)
                ps.setInt(1, p.getId());
                ps.executeUpdate();
            }
            connection.close();
            return true;
        } catch (SQLException | ClassNotFoundException e ) {
            return false;
        }
    } 
    
    
    
    /**
     *
     * @param p
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    @Override
    public ArrayList<ItemProduto> listar(Produto p) {
        ArrayList<ItemProduto> itens = new ArrayList<>();
        try {
            connection = ConnectionFactory.getConexao();
            final String SELECT_ALL = "select * from itemproduto where idproduto = ?";
            PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL);
            pstmt.setInt(1, p.getId());
            ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                   ItemProduto i= new ItemProduto();
                    i.setIdItem(rs.getInt("id"));
                    i.setMaterial(new MaterialDAO().buscar(new Material(rs.getInt("idmaterial"))));
                    i.setQuantidade(rs.getFloat("quantidade"));
                    itens.add(i);
                    connection.close();     
            }
            return itens;
        } catch (SQLException | ClassNotFoundException ex) {
           return null;
        }
    }

    
 

}