/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.AutorizacaoDeAcesso;

import br.com.artenativa.dao.UsuarioDAO;
import br.com.artenativa.model.Usuario;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dennis
 */
public class AcessoAdministrativo {
    
    
    public static boolean checarAcesso( HttpSession sessaoUsuario){
        Usuario user = (Usuario) sessaoUsuario.getAttribute("usuarioAutenticado");
        return user.getNivel() == PerfilDeAcesso.valueOf("ADMINISTRADOR"); //true or false
    }
    
    public static boolean validaSessao(HttpSession sessao) throws SQLException, ClassNotFoundException{
         Usuario usuario = (Usuario) sessao.getAttribute("usuario");
         UsuarioDAO udao = new UsuarioDAO();
         if (udao.confirmar(usuario)) {
             return true;
         }else{
             return false;
         }
        
    }
    
    
}
