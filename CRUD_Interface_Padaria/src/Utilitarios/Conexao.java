
package Utilitarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;


public class Conexao {
    public Statement stm;
    public ResultSet rs;
    private String driver = "com.mysql.jdbc.Driver";
    private String caminho = "jdbc:mysql://localhost:3306/padaria";
    private String usuario = "root";
    private String senha = "";
    public Connection conn;
    
    public void Conectar(){
        
        try {
            System.setProperty("jdbc.Drivers", driver);
            conn = (Connection) DriverManager.getConnection(caminho, usuario, senha);
           // JOptionPane.showMessageDialog(null, "Conectado com sucesso! \n Olá " + usuario);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro de conexão! \n" + ex.getMessage());
        }
    
    }
    public void Desconectar(){
        try {
            conn.close();
            JOptionPane.showMessageDialog(null, "Desconectado com sucesso!");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao fechar conexão! \n" + ex.getMessage());
        }
    }
    public void executaSQL(String sql){
        try {
            stm = conn.createStatement(rs.TYPE_SCROLL_INSENSITIVE, rs.CONCUR_READ_ONLY);
            rs = stm.executeQuery(sql);
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro no executaSQL!\nERRO:" + ex.getMessage());
        }
    }
}
