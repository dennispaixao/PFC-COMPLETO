/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.artenativa.model;

/**
 *
 * @author ArteNativa
 */
public class Material {
    private int id;
    private String nome;
    private String DataCadastro;
    private float qtEstoque;
    private float qtMin;
    private Fornecedor fornecedor;
    private float precoUnitario;

    public Material() {
    }

    public Material(int id) {
        this.id = id;
    }

    public Material(int id, String nome, String DataCadastro, float qtEstoque, float qtMin) {
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

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }
    
    
}
