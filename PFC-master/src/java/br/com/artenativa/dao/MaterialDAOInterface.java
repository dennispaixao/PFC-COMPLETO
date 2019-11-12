/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.dao;

import br.com.artenativa.model.Material;
import br.com.artenativa.model.Produto;
import java.util.ArrayList;

/**
 *
 * @author Dennis
 */
public interface MaterialDAOInterface {
        
    public boolean inserir(Material m);
    public boolean alterar(Material m);
    public boolean excluir(Material m);
    public  ArrayList<Material> listar();
    public  ArrayList<Material> listar(String nome);
    public Material buscar(Material m);
  
    
}
