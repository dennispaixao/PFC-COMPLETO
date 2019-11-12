/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.util;

import static br.com.artenativa.control.CadastrarClienteAction.isNumeric;
import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Dennis
 */
public class Validator implements IValidator {
    String msg = null;
    
    @Override
    public String validaString(String string,String nomeDoCampo, int minLenght,int maxLenght, boolean canBeNum){
    
    String text = string;
    byte[] byteText = text.getBytes(Charset.forName("UTF-8"));
    //To get original string from byte.
        
        //não pode ser maior que
        if (string.length() > maxLenght) {
            msg = nomeDoCampo+ " não pode ter mais de "+maxLenght+" caracteres!";
        }
        //não pode ser menor que
         else if (string.length() < minLenght) {
            msg = nomeDoCampo+" não pode ter menos de "+minLenght+" caracteres!";
        } 
        //se não pode ser numero 
         else if ((!canBeNum) && isNumeric(string)) {
            msg = nomeDoCampo+ " não pode ser um numero";
        }
        // não pode ter caracteres especiais 
         else if(string.length()>0&&!string.matches("[a-zA-Z0-9- \\u00C0-\\u00FF]+")){
            msg = nomeDoCampo+ " não pode ter caracteres especiais"+string;
        }
       return msg;
    }

    @Override
    public String validaCPF(String cpf, boolean nul) {
        if (cpf.length()<11){
            if (!(cpf.length()==0 && nul)){ 
                msg="cpf invalido";
            }
        }       
       return msg;
    }

    @Override
    public String validaRg(String rg,boolean nul) {
           if (rg.length()<8){
            if (!(rg.length()==0 && nul)){ 
                msg="rg invalido";
            }
        }   
        return msg;
    };

    @Override
    public String validaCep(String cep,boolean nul) {
            if (cep.length()<8){
            if (!(cep.length()==0 && nul)){ 
                msg="cep invalido";
            }
        }   
        return msg;
    
    }

    @Override
    public String validaTelefone(String telefone,String campo,boolean nul){
         if(!(telefone.length()==0 &&nul)){
            if (!telefone.matches("^[0-9-()]+")){
                 msg=campo+" invalido";
            }
         }
       return msg;
    }

    @Override
    public String validaNumero(int num, int minLenght, int maxLenght,boolean nul) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override //charValid = array de characteres permitidos 
    public String validaCharset(String character, char[] charValid, String nomeDoCampo,boolean nul) {
        boolean ok = false;
        for(char c : charValid){
            if (character.equals(""+c)){
                    ok = true;
                    break;
            }        
            else {
                    ok = false;
            }                
        }
          if (!ok)
              msg = nomeDoCampo+ " inválido";
          
          return msg;
    }

    @Override
    public String validaEmail(String email,boolean nul) {
        
        if(!(email.length()==0 &&nul)){
                boolean isEmailIdValid = false;
                if (email.length() > 0) {
                    String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
                    Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
                    Matcher matcher = pattern.matcher(email);
                    if (matcher.matches()) {
                        isEmailIdValid = true;
                    }
                }
                if(!isEmailIdValid){
                    msg= "Email informado é incorreto";
                }
        }    
      return msg;    
    }

   
}
