/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.model.mock;

import br.com.artenativa.model.*;

/**
 *
 * @author ArteNativa
 */
public class MaterialMock {
    private int id;
    private String nome;
    private String DataCadastro;
    private float qtEstoque;
    private float qtMin;
    private String fornecedor;
    private float precoUnitario;

    public MaterialMock() {
    }

    public MaterialMock(int id) {
        this.id = id;
    }

    public MaterialMock(int id, String nome, String DataCadastro, float qtEstoque, float qtMin) {
        this.id = id;
        this.nome = nome;
        this.DataCadastro = DataCadastro;
        this.qtEstoque = qtEstoque;
        this.qtMin = qtMin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrecoUnitario() {
        return precoUnitario;
    }

    public void setPrecoUnitario(float precoUnitario) {
        this.precoUnitario = precoUnitario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDataCadastro() {
        return DataCadastro;
    }

    public void setDataCadastro(String DataCadastro) {
        this.DataCadastro = DataCadastro;
    }

    public float getQtEstoque() {
        return qtEstoque;
    }

    public void setQtEstoque(float qtEstoque) {
        this.qtEstoque = qtEstoque;
    }

    public float getQtMin() {
        return qtMin;
    }

    public void setQtMin(float qtMin) {
        this.qtMin = qtMin;
    }

    public String getFornecedor() {
        return this.fornecedor;
    }

    public void setFornecedor(String fornecedor) {
        this.fornecedor = fornecedor;
    }
    
    
}
