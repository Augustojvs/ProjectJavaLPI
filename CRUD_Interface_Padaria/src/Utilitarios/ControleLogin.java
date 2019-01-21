/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilitarios;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import modelo.ModeloLogin;


public class ControleLogin {
   Conexao conexao = new Conexao(); 
   ModeloLogin model = new ModeloLogin();
    
    public void salvar(ModeloLogin mod){
        conexao.Conectar();
       try {
           PreparedStatement pst = conexao.conn.prepareStatement("INSERT INTO login (usuario, senha, nome, permissao, pergunta, resposta) VALUES (?, ?, ?, ?, ?, ?)");
           pst.setString(1, mod.getLogin());
           pst.setString(2, mod.getSenha());
           pst.setString(3, mod.getNome());
           pst.setString(4, mod.getPermissao());
           pst.setString(5, mod.getPergunta());
           pst.setString(6, mod.getResposta());
           pst.execute();
           JOptionPane.showMessageDialog(null, "Usuario cadastrado com sucesso");
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Erro ao inserir usuario!\nERRO: " + ex);
       }
    }
    public ModeloLogin Primeiro(){
        conexao.Conectar();
        
       try {
           conexao.executaSQL("SELECT * FROM login");
           conexao.rs.first();
           model.setCod(conexao.rs.getInt("cod_login"));
           model.setLogin(conexao.rs.getString("usuario"));
           model.setSenha(conexao.rs.getString("senha"));
           model.setNome(conexao.rs.getString("nome"));
           model.setPermissao(conexao.rs.getString("permissao"));
           
           
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Erro ao selecionar o primeiro registro!\nERRO: " + ex);
       }
       return model;
       
    }
    public ModeloLogin Anterior(){
        
        
       try {
           
           conexao.rs.previous();
           model.setCod(conexao.rs.getInt("cod_login"));
           model.setLogin(conexao.rs.getString("usuario"));
           model.setSenha(conexao.rs.getString("senha"));
           model.setNome(conexao.rs.getString("nome"));
           model.setPermissao(conexao.rs.getString("permissao"));
           
           
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Este e o primeiro registro!\nERRO: " + ex);
       }
       return model;
       
    }
    public ModeloLogin Proximo(){
        
        
       try {
           
           conexao.rs.next();
           model.setCod(conexao.rs.getInt("cod_login"));
           model.setLogin(conexao.rs.getString("usuario"));
           model.setSenha(conexao.rs.getString("senha"));
           model.setNome(conexao.rs.getString("nome"));
           model.setPermissao(conexao.rs.getString("permissao"));
           
           
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Este e o ultimo registro!\nERRO: " + ex);
       }
       return model;
       
    }
    public ModeloLogin Ultimo(){
        conexao.Conectar();
        
       try {
           conexao.executaSQL("SELECT * FROM login");
           conexao.rs.last();
           model.setCod(conexao.rs.getInt("cod_login"));
           model.setLogin(conexao.rs.getString("usuario"));
           model.setSenha(conexao.rs.getString("senha"));
           model.setNome(conexao.rs.getString("nome"));
           model.setPermissao(conexao.rs.getString("permissao"));
           
           
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Erro ao selecionar o ultimo registro!\nERRO: " + ex);
       }
       return model;
       
    }
    public void Excluir(ModeloLogin mod){
        conexao.Conectar();
        
       try {
            PreparedStatement pst = conexao.conn.prepareStatement("DELETE FROM login WHERE cod_login = ?");
            pst.setInt(1, mod.getCod());
            pst.execute();
            JOptionPane.showMessageDialog(null, "Usuario excluido com sucesso!");
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Erro ao excluir usuário!\nERRO: " + ex);
       }
        
    }
    public void Alterar(ModeloLogin mod){
        conexao.Conectar();
       try {
           PreparedStatement pst = conexao.conn.prepareStatement("UPDATE login SET usuario = ?, senha = ?, nome = ?, permissao = ?, pergunta = ?, resposta = ? WHERE cod_login = ?");
           pst.setString(1, mod.getLogin());
           pst.setString(2, mod.getSenha());
           pst.setString(3, mod.getNome());
           pst.setString(4, mod.getPermissao());
           pst.setString(5, mod.getPergunta());
           pst.setString(6, mod.getResposta());
           pst.setInt(7, mod.getCod());
           pst.execute();
           JOptionPane.showMessageDialog(null, "Usuario alterado com sucesso!");
       } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, "Erro ao alterar usuário!\nERRO: " + ex);
       }
    }
}
