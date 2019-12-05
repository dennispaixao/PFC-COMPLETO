/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.FuncionarioDAO;
import br.com.artenativa.model.Endereco;
import br.com.artenativa.model.Funcionario;
import br.com.artenativa.util.ParseDates;
import br.com.artenativa.util.Validator;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dennis
 */
public class CadastrarFuncionarioAction implements ICommand {

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

        Funcionario p = new Funcionario();
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

        //validação se tudo ok msg == null
      
        Validator vl = new Validator();
        
        //nos metodos é ideal inverter a ordem de verificação para mensagens obedecerem uma ordem
       
         char[] CharsSexo = new char[2];
        CharsSexo[0] = 'm';
        CharsSexo[1] = 'f';
        msg = vl.validaString(numero, "Complemento", 0, 80, true); 
        msg = vl.validaString(numero, "Numero", 0, 80, true); 
        msg = vl.validaString(uf, "UF", 0, 2, false); 
        msg = vl.validaString(cidade, "cidade", 0, 80, false); //0 para null
        msg = vl.validaString(bairro, "bairro", 0, 80, false); 
        msg = vl.validaString(rua, "rua", 0, 80, true); 
        msg = vl.validaCep(cep,true); 
        msg = vl.validaTelefone(p.getCelular(),"Celular", true);
        msg = vl.validaTelefone(p.getTelefone(),"Telefone",true);
        msg = vl.validaEmail(p.getEmail(),true);
        msg = vl.validaCharset(p.getSexo(),CharsSexo,"Sexo",true);
        msg = vl.validaRg(rg,true);
        msg = vl.validaCPF(cpf,true);
        msg = vl.validaString(sobrenome, "Sobrenome", 2, 80, false); 
        msg = vl.validaString(nome, "Nome", 2, 40, false); //ultima validação feita ex: nome não pode ficar em branco
        
        
        
        
  
        
        if (msg == null) {
            try {
                FuncionarioDAO cdao = new FuncionarioDAO();
                cdao.inserir(p);
                

                if("f".equals(sexo))
                    msg = "Funcionario " + nome + " " + sobrenome + " cadastrada com sucesso";
                else    
                     msg = "Funcionario " + nome + " " + sobrenome + " cadastrado com sucesso";
                
                
                
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(CadastrarFuncionarioAction.class.getName()).log(Level.SEVERE, null, ex);
               
            }
        }
        request.setAttribute("msg", msg);
        request.setAttribute("pageRedirect", "funcionario.jsp");
        return request;
       
}
}
