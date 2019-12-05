
import br.com.artenativa.dao.ItemOrcamentoDAO;
import br.com.artenativa.dao.MaterialDAO;
import br.com.artenativa.dao.OrcamentoDAO;
import br.com.artenativa.dao.ProdutoDAO;
import br.com.artenativa.model.ItemOrcamento;
import br.com.artenativa.model.ItemProduto;
import br.com.artenativa.model.Orcamento;
import br.com.artenativa.model.Produto;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ArteNativa
 */
public class NewMain1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
         
        
        
            String id = 19+"";
            int idOrc = Integer.parseInt(id);
            Orcamento o = new Orcamento(idOrc);       
            OrcamentoDAO odao= new OrcamentoDAO();
            o = odao.buscar(o);
            //o.setEstado(2);
            // odao.alterar(o);
            //verifica produtos faltantes    
            ItemOrcamentoDAO idao = new ItemOrcamentoDAO();
            ArrayList<ItemOrcamento> itens = idao.listar(o);
            ArrayList<ItemOrcamento> pprod = new ArrayList();
            for(ItemOrcamento i : itens){
              ItemOrcamento ifalta = new ItemOrcamento();
              ifalta.setProduto(i.getProduto());
              ifalta.setQuantidade(i.getQuantidade()-i.getProduto().getQtEstoque()<0?0:i.getQuantidade()-i.getProduto().getQtEstoque()); 
              pprod.add(ifalta);
            }
            //verificar material em estoque faltantes
            ArrayList<ItemOrcamento> mprod = new ArrayList();
            for(ItemOrcamento ifaltante :pprod){
               ArrayList<ItemProduto>ifaltantes =new ArrayList();
                for(ItemProduto ip:ifaltante.getProduto().getMateriais()){
                    ItemProduto ifalta = new ItemProduto();
                    ifalta.setMaterial(ip.getMaterial());
                    ifalta.setQuantidade(ip.getQuantidade()*ifaltante.getQuantidade()-ip.getMaterial().getQtEstoque()<0?0:ip.getQuantidade()*ifaltante.getQuantidade()-ip.getMaterial().getQtEstoque());
                    ifaltantes.add(ifalta);
                }
               Produto prodFalta= new Produto();
               prodFalta.setNome(ifaltante.getProduto().getNome());
               prodFalta.setMateriais(ifaltantes);
               ItemOrcamento itensFalt = new ItemOrcamento();
               itensFalt.setProduto(prodFalta);
               itensFalt.setQuantidade(ifaltante.getQuantidade());
               mprod.add(itensFalt);
            }
            //verifica se falta algum material
            float cont =0;
            for(ItemOrcamento falt :mprod){
                for(ItemProduto its: falt.getProduto().getMateriais()){
                    cont+=its.getQuantidade();
                }
            }
             String resposta="";
             //se não faltar nenhum material para produção fará as baixas em estoque;
            if(cont==0){
               
            ArrayList<ItemOrcamento> pprod2 = new ArrayList();
            for(ItemOrcamento i : itens){
              ItemOrcamento ifalta = new ItemOrcamento();
              ifalta.setProduto(i.getProduto());
              ifalta.setQuantidade(i.getQuantidade()-i.getProduto().getQtEstoque()<0?0:i.getQuantidade()-i.getProduto().getQtEstoque()); 
              float qtestoque= i.getProduto().getQtEstoque();
              qtestoque= qtestoque-i.getQuantidade()<0?0:qtestoque-i.getQuantidade();
              pprod2.add(ifalta);  
              i.getProduto().setQtEstoque(qtestoque);
              new ProdutoDAO().alterar(i.getProduto());
            }
            ArrayList<ItemProduto> hash = new ArrayList();
            for(ItemOrcamento io:pprod2){
               for(ItemProduto ip:io.getProduto().getMateriais()){
                   boolean tem = false;
                   for(ItemProduto ihash:hash){
                       if(ihash.getMaterial().getId()==ip.getMaterial().getId()){
                            tem=true;
                            ihash.setQuantidade(ihash.getQuantidade()+(ip.getQuantidade()*io.getQuantidade()));
                       }
                   }
                   if(!tem){
                       ItemProduto it= ip;
                       it.setQuantidade(it.getQuantidade()*io.getQuantidade());
                       hash.add(ip);
                   }
               }
            }
                 
            for(ItemProduto ihash:hash){
               float qtestoque = ihash.getMaterial().getQtEstoque();
               ihash.getMaterial().setQtEstoque(qtestoque-ihash.getQuantidade());
               new MaterialDAO().alterar(ihash.getMaterial());
                
            }
            
                resposta="orçamento aprovado, baixas em estoques efetuadas";
            }else{
                resposta+="Não é possível aprovar o orçamento pois falta material em estoque:\n";
                for(ItemOrcamento falt :mprod){
                    resposta+=falt.getProduto().getNome()+": \n";
                     for(ItemProduto its: falt.getProduto().getMateriais()){
                        resposta+= its.getMaterial().getNome()+"-"+its.getQuantidade()+"\n";
                     }
                }
            }
            
            System.out.println(resposta);
            
            
        
           
                
    }
    
}
