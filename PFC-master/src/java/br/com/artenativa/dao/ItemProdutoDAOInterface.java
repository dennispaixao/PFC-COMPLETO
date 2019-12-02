
package br.com.artenativa.dao;

import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Produto;
import java.util.ArrayList;

public interface ItemProdutoDAOInterface {
        
    public boolean inserir(ItemProduto i);
    public boolean excluirTodos(Produto p);
    public  ArrayList<ItemProduto> listar(Produto p);
    
}
