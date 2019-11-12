/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.util;

/**
 *
 * @author Dennis
 */
public interface IValidator {
    
 
  public String validaCPF(String cpf, boolean nul);
  public String validaRg(String rg, boolean nul);
  public String validaCep(String cep, boolean nul);
  public String validaEmail(String email, boolean nul);
  public String validaTelefone(String telefone, String campo, boolean nul);
  public String validaNumero(int num, int minLenght, int maxLenght, boolean nul);
  public String validaCharset(String character, char[] charValid, String nomeDoCampo, boolean nul);
  public String validaString(String string,String nomeDoCampo, int minLenght,int maxLenght, boolean canBeNum);
}
