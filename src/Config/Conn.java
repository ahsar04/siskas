/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ahmad Saifur Rohman
 */
public class Conn {
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Statement st;
    String SQL;
    int i;
    
    
    public Conn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String Database="db_siskas";
            String Username="root";
            String Password="";
            con = DriverManager.getConnection("jdbc:mysql://localhost/"+Database, Username, Password);
            System.out.println("Koneksi Berhasil");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //Overload fungsi untuk eksekusi query select semua kolom dengan where
    public void selectAllCondition(String nameTable, String condition) {
        try {
            SQL = "SELECT * FROM " + nameTable + " WHERE " + condition;
            pst = con.prepareStatement(SQL);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void insertDB(String nameTable, String[] namecolumn, String[] value) {
        try {
            SQL = "INSERT INTO " + nameTable +" (";
        for (i = 0; i <= namecolumn.length - 1; i++) {
            SQL +=namecolumn[i];
            if (i < namecolumn.length - 1) {
                SQL += ",";
            }
        }
        SQL+=") VALUES(";
        for (i = 0; i <= value.length - 1; i++) {
            SQL += "'" + value[i] + "'";
            if (i < value.length - 1) {
                SQL += ",";
            }
        }
        SQL += ")";
            pst = con.prepareStatement(SQL);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //
    public ResultSet selectDB(String tbl) {
        try {
            SQL ="select * from "+tbl;
            st = con.createStatement();
            rs = st.executeQuery(SQL);
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    //
    public void deleteDB(String tbl,String colum, String primary) {
        try {
            SQL = "delete from "+tbl+" where "+colum+"=?";
            pst = con.prepareStatement(SQL);
            pst.setString(1, primary);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDB(String nameTable, String[] namecolumn, String[] value, String condition) {
        try {
            SQL = "UPDATE " + nameTable + " SET ";

        for (i = 0; i <= namecolumn.length - 1; i++) {
            SQL += namecolumn[i] + "='" + value[i] + "'";
            if (i < namecolumn.length - 1) {
                SQL += ",";
            }
        }
        SQL += " WHERE " + condition;
            pst = con.prepareStatement(SQL);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public void FilterHuruf(KeyEvent a) {
//        if (Character.isDigit(a.getKeyChar())) {
//            a.consume();
//            //Pesan Dialog Boleh Di Hapus Ini Hanya Sebagai Contoh
//            JOptionPane.showMessageDialog(null, "Masukan Hanya Huruf", "Peringatan", JOptionPane.WARNING_MESSAGE);
//        }
//    }
// 
//    //Method Untuk Menyaring Angka
//    public void FilterAngka(KeyEvent b) {
//        if (Character.isAlphabetic(b.getKeyChar())) {
//            b.consume();
//            //Pesan Dialog Boleh Di Hapus Ini Hanya Sebagai Contoh
//            JOptionPane.showMessageDialog(null, "Masukan Hanya Angka", "Peringatan", JOptionPane.WARNING_MESSAGE);
//        }
//    }
// 
//    //Method Untuk Menyaring Huruf Besar
//    public void HurufBesar(KeyEvent c) {
//        if (Character.isLowerCase(c.getKeyChar())) {
//            c.consume();
//            //Pesan Dialog Boleh Di Hapus Ini Hanya Sebagai Contoh
//            JOptionPane.showMessageDialog(null, "Masukan Hanya Huruf Besar", "Peringatan", JOptionPane.WARNING_MESSAGE);
//        }
//    }
// 
//    //Method Untuk Menyaring Huruf Kecil
//    public void HurufKecil(KeyEvent d) {
//        if (Character.isUpperCase(d.getKeyChar())) {
//            d.consume();
//            //Pesan Dialog Boleh Di Hapus Ini Hanya Sebagai Contoh
//            JOptionPane.showMessageDialog(null, "Masukan Hanya Huruf Kecil", "Peringatan", JOptionPane.WARNING_MESSAGE);
//        }
//    }
// 
    //Method Untuk Membatasi Jumlah Karakter
//    public void JumlahKarakter(KeyEvent e) {
//        if (Charakter.getText().length() == 8) {
//            e.consume();
//            //Pesan Dialog Boleh Di Hapus Ini Hanya Sebagai Contoh
//            JOptionPane.showMessageDialog(null, "Maksimal yang dimasukan Hanya 8 Karakter", "Peringatan", JOptionPane.WARNING_MESSAGE);
//        }
//    }
}
