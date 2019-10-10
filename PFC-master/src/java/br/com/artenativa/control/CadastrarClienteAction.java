/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.ClienteDAO;
import br.com.artenativa.model.Cliente;
import br.com.artenativa.model.Endereco;
import br.com.artenativa.util.ParseDates;
import br.com.artenativa.util.Validator;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class CadastrarClienteAction implements ICommand {

    String msg;

    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response) {
        
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String rg= request.getParameter("rg");   
        String cpf = request.getParameter("cpf"); 
        String sexo = request.getParameter("sexo");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String cep = request.getParameter("cep");
        String rua = request.getParameter("rua");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("UF");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");

        Cliente p = new Cliente();
        p.setNome(nome);
        p.setSobrenome(sobrenome);
        p.setDataCadastro(ParseDates.getNowUnix().toString());    
        p.setRg(rg);
        p.setCpf(cpf); 
        p.setEmail(email);
        p.setTelefone(telefone);
        p.setCelular(celular);
        p.setSexo(sexo);
        
        Endereco end = new Endereco();
        end.setCep(cep);
        end.setRua(rua);
        end.setBairro(bairro);
        end.setCidade(cidade);
        end.setUF(uf);
        end.setNumero(numero);
        end.setComplemento(complemento);   
        p.setEndereco(end);

        //valida��o se tudo ok msg == null
      
        Validator vl = new Validator();
        
        //nos metodos � ideal inverter a ordem de verifica��o para mensagens obedecerem uma ordem
       
        char[] CharsSexo = new char[2];
        CharsSexo[0] = 'm';
        CharsSexo[1] = 'f';
        msg = vl.validaCharset(p.getSexo(),CharsSexo,"Sexo");
        // msg = vl.validaRg(rg);
        // msg = vl.validaCPF(cpf);
        msg = vl.validaString(sobrenome, "Sobrenome", 2, 80, false); 
        msg = vl.validaString(nome, "Nome", 2, 40, false); //ultima valida��o feita ex: nome n�o pode ficar em branco
        msg = vl.validaCPF(cpf);
        
  
        
        if (msg == null) {
            try {
                ClienteDAO cdao = new ClienteDAO();
                cdao.inserir(p);
                

                if("f".equals(sexo))
                    msg = "Cliente " + nome + " " + sobrenome + " cadastrada com sucesso";
                else    
                     msg = "Cliente " + nome + " " + sobrenome + " cadastrado com sucesso";
                
                
                
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(CadastrarClienteAction.class.getName()).log(Level.SEVERE, null, ex);
               
            }
        }
        request.setAttribute("msg", msg);
        request.setAttribute("pageRedirect", "cliente.jsp");
        return request;
    }

    public static boolean isNumeric(String s) {
        try {
            Long.parseLong(s);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

  

}
