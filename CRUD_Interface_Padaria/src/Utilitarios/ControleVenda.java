
package Utilitarios;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import modelo.ModeloVenda;


public class ControleVenda {
  int codProd, codCliente;
  

Conexao conexao = new Conexao();

public void adicionaItem(ModeloVenda mod){
    achaCodProduto(mod.getNomeProduto());
    conexao.Conectar();
      try {
          PreparedStatement pst = conexao.conn.prepareStatement("INSERT INTO compra (cod_compra, cod_produto, quantidade_produto) VALUES (?, ?, ?)");
          pst.setInt(1, mod.getIdComanda());
          pst.setInt(2, codProd);
          pst.setInt(3, mod.getQtdItem());
          pst.execute();
          
          int quant = 0, resul = 0;
          conexao.executaSQL("SELECT * FROM produto WHERE nome ='" + mod.getNomeProduto()+"'");
          conexao.rs.first();
          quant = conexao.rs.getInt("quantidade");
          resul = quant - mod.getQtdItem();
          pst = conexao.conn.prepareStatement("UPDATE produto SET quantidade = ? WHERE nome = ?");
          pst.setInt(1, resul);
          pst.setString(2, mod.getNomeProduto());
          pst.execute();
          JOptionPane.showMessageDialog(null, "produto adicionado!");
      } catch (SQLException ex) {
          JOptionPane.showMessageDialog(null, "Erro ao realizar venda!\nERRO: " + ex);
      }
}
public void achaCodProduto(String nome){
    
      try {
          conexao.Conectar();
          conexao.executaSQL("SELECT * FROM produto WHERE nome ='"+nome+"'");
          conexao.rs.first();
          codProd = conexao.rs.getInt("cod_produto");
          
      } catch (SQLException ex) {
          JOptionPane.showMessageDialog(null, "Erro:" + ex);
      }
}
public void FechaVenda(ModeloVenda mod){
    AchaCliente(mod.getNomeCliente());
    conexao.Conectar();
      try {
          PreparedStatement pst = conexao.conn.prepareStatement("UPDATE comanda SET data_venda = ?, valor_venda = ?, cliente = ?, forma_pagamento = ? WHERE cod_comanda = ?");
          pst.setString(1, mod.getData());
          pst.setFloat(2, mod.getValorVenda());
          pst.setInt(3, codCliente);
          pst.setString(4, mod.getFormaPagamento());
          pst.setInt(5, mod.getIdComanda());
          pst.execute();
          JOptionPane.showMessageDialog(null, "Venda finalizada!");
      } catch (SQLException ex) {
          JOptionPane.showMessageDialog(null, "Erro ao fechar venda!\nERRO:" + ex);
      }
}
public void AchaCliente(String nome){
    conexao.Conectar();
      try {
          conexao.executaSQL("SELECT * FROM cliente WHERE nome = '" + nome + "'");
          conexao.rs.first();
          codCliente = conexao.rs.getInt("codigocliente");
      } catch (SQLException ex) {
          JOptionPane.showMessageDialog(null, "Erro ao procurar cliente!\nERRO:" + ex);
      }
    
}
public void CancelaVenda(){
    conexao.Conectar();
    PreparedStatement pst;
    conexao.executaSQL("SELECT * FROM comanda INNER JOIN compra ON comanda.cod_comanda = compra.cod_compra "
            + "INNER JOIN produto ON compra.cod_produto = produto.cod_produto WHERE comanda.valor_venda = 0");
    
      try {
          conexao.rs.first();
          do{
              int qtdProd = conexao.rs.getInt("quantidade");
              int qtdVend = conexao.rs.getInt("quantidade_produto");
              int soma = qtdProd + qtdVend;
              pst = conexao.conn.prepareStatement("UPDATE produto SET quantidade = ? WHERE cod_produto = ?");
              pst.setInt(1, soma);
              pst.setInt(2, conexao.rs.getInt("cod_produto"));
              pst.execute();
              pst = conexao.conn.prepareStatement("DELETE FROM compra WHERE cod_compra = ?");
              pst.setInt(1, conexao.rs.getInt("cod_comanda"));
              pst.execute();
          }while(conexao.rs.next());
          pst = conexao.conn.prepareStatement("DELETE FROM comanda WHERE valor_venda = ?");
          pst.setInt(1, 0);
          pst.execute();
      } catch (SQLException ex) {
         // JOptionPane.showMessageDialog(null, "Erro ao cancelar venda!\nERRO:" + ex);
      }
}
}
