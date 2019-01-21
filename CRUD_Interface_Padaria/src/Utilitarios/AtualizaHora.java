/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilitarios;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JLabel;

/**
 *
 * @author Augusto
 */
public class AtualizaHora {
    
    public static void Start(final JLabel txtHora){
        Thread atualizaHora = new Thread(new Runnable(){
        
        @Override
        public void run(){
        try{
            while (true){
                Date date = new Date();
                StringBuffer data = new StringBuffer();
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
                txtHora.setText(data.toString() + sdf.format(date));
                Thread.sleep(1000);
                txtHora.revalidate();
            }
        } catch (InterruptedException ex){
            
        }
    }
        });
        atualizaHora.start();
    }
}
    
