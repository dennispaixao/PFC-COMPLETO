
package br.com.artenativa.dao;

import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Produto;
import java.util.ArrayList;

public interface ItemProdutoDAOInterface {
        
    public boolean inserir(ItemProduto i);
    public boolean alterar(ItemProduto i);
    public boolean excluir(ItemProduto i);
    public boolean limpar(Produto p);
    public  ArrayList<ItemProduto> listar(Produto p);
    
}
