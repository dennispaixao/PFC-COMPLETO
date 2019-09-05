/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.util;

import static br.com.artenativa.control.CadastrarClienteAction.isNumeric;

/**
 *
 * @author Dennis
 */
public class Validator implements IValidator {
    String msg = null;
    
    @Override
    public String validaString(String string,String nomeDoCampo ,int minLenght, int maxLenght, boolean canBeNum ) {
        //n�o pode ser vazio
        if ("".equals(string)) {
            msg = nomeDoCampo+" n�o pode ficar em branco";
        }
        //n�o pode ser maior que
         else if (string.length() > maxLenght) {
            msg = nomeDoCampo+ " n�o pode ter mais de "+maxLenght+" caracteres!";
        }
        //n�o pode ser menor que
         else if (string.length() < minLenght) {
            msg = nomeDoCampo+" n�o pode ter menos de "+minLenght+" caracteres!";
        } 
        //se n�o pode ser numero 
         else if ((!canBeNum) && isNumeric(string)) {
            msg = nomeDoCampo+ " n�o pode ser um numero";
        }  else if(!string.matches("(\\w|\\s){"+string.length()+"}")){
            msg = nomeDoCampo+ " n�o pode ter caracteres especiais";
        }
       return msg;
    }

    @Override
    public String validaCPF(String cpf) {
        if (cpf.length()<11){
            msg="cpf invalido";
        }
         
       return msg;
    }

    @Override
    public String validaRg(String rg) {
        if(rg.length()<8){
            msg= "rg invalido";
        }
        return msg;
    };

    @Override
    public String validaCep(String cep) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String validaTelefone(String cpf) {
         return msg;
    }

    @Override
    public String validaNumero(int num, int minLenght, int maxLenght) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override //charValid = array de characteres permitidos 
    public String validaCharset(String character, char[] charValid, String nomeDoCampo) {
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
              msg = nomeDoCampo+ " inv�lido";
          
          return msg;
    }
    
}
