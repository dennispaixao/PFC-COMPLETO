/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.control;

import br.com.artenativa.dao.ClienteDAO;
import br.com.artenativa.model.Cliente;
import br.com.artenativa.model.Endereco;
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
public class SalvarClienteAction implements ICommand {

    String msg = null;

    @Override
    public HttpServletRequest executar(HttpServletRequest request, HttpServletResponse response) {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String sexo = request.getParameter("sexo");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String cep = request.getParameter("cep");
        String rua = request.getParameter("rua");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String UF = request.getParameter("UF");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
            
        
        
        Cliente p = new Cliente(id);
        p.setNome(nome);
        p.setSobrenome(sobrenome);
        p.setSexo(sexo);
        p.setRg(rg);
        p.setCpf(cpf);
        p.setEmail(email);
        p.setTelefone(telefone);
        p.setCelular(celular);
        Endereco end = new Endereco();
        end.setCep(cep);
        end.setRua(rua);
        end.setBairro(bairro);
        end.setCidade(cidade);
        end.setUF(UF);
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
        msg = vl.validaString(UF, "UF", 0, 2, false); 
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
                ClienteDAO cdao = new ClienteDAO();
                cdao.alterar(p);
                if ("f".equals(sexo)) {
                    msg = "Cliente " + nome + " " + sobrenome + " alterada com sucesso";
                } else {
                    msg = "Cliente " + nome + " " + sobrenome + " alterado com sucesso";
                }
                
                
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(CadastrarClienteAction.class.getName()).log(Level.SEVERE, null, ex);

            }
        }
        
        request.setAttribute("msg", msg);
        ClienteDAO cdao;
        try {
            cdao = new ClienteDAO();
            request.setAttribute("ListaCliente", cdao.listar());
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SalvarClienteAction.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        request.setAttribute("pageRedirect", "clienteListar.jsp");
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
