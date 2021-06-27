/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package koneksi;

import com.mysql.jdbc.Driver;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tanti
 */
public class conek {
    public static Connection con;
    public static Statement stm;
    ResultSet rs;
    String SQL;

    public void config() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/db_tif", "root", "");
            System.out.println("Koneksi Berhasil");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(conek.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(conek.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ResultSet eksekusiQuery(String sql) {
        config();
        ResultSet resultSet = null;
       // System.out.println(sql);
        try {
            stm = con.createStatement();
            resultSet = stm.executeQuery(sql);      
        } catch (SQLException ex) {       
        }
        System.out.println(resultSet);
        return resultSet;
    }

    public String eksekusiUpdate(String sql) {
        config();
        String result = "";
        System.out.println(sql);
        try {
            stm = con.createStatement();
            stm.executeUpdate(sql);
        } catch (SQLException ex) {
            result = ex.toString();
            javax.swing.JOptionPane.showMessageDialog(null,result);
            //javax.swing.JOptionPane.showMessageDialog(null, ex); //Pesan Error jika Duplikat data  
        }
       return result;
    }
    
//Overload fungsi untuk eksekusi query select semua kolom dengan where
    public ResultSet querySelectAll(String nameTable, String condition) {
        SQL = "SELECT * FROM " + nameTable + " WHERE " + condition;
        System.out.println(SQL);
        return this.eksekusiQuery(SQL);
    }
    public ResultSet show() {
        try {
            String sql ="select * from barang";
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(conek.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
//Fungsi untuk eksekusi query select dengan kolom spesifik
    public ResultSet querySelect(String[] namecolumn, String nameTable) {
        SQL = "SELECT ";
        for (int i = 0; i <= namecolumn.length - 1; i++) {
            SQL += namecolumn[i];
            if (i < namecolumn.length - 1) {
                SQL += ",";
            }
        }
        SQL += " FROM " + nameTable;
        return this.eksekusiQuery(SQL);
    }

//Overload fungsi untuk eksekusi query select dengan kolom spesifik dengan where
    public ResultSet fcSelectCommand(String[] column, String nameTable, String condition) {
        SQL = "SELECT ";
        for (int i = 0; i <= column.length - 1; i++) {
            SQL += column[i];
            if (i < column.length - 1) {
                SQL += ",";
            }
        }
        SQL += " FROM " + nameTable + " WHERE " + condition;
        System.out.println(SQL);
        return this.eksekusiQuery(SQL);
    }


//Fungsi eksekusi query insert
    public String queryInsert(String nameTable, String[] namecolumn, String[] value) {
        SQL = "INSERT INTO " + nameTable +" (";
        for (int i = 0; i <= namecolumn.length - 1; i++) {
            SQL +=namecolumn[i];
            if (i < namecolumn.length - 1) {
                SQL += ",";
            }
        }
        SQL+=") VALUES(";
        for (int i = 0; i <= value.length - 1; i++) {
            SQL += "'" + value[i] + "'";
            if (i < value.length - 1) {
                SQL += ",";
            }
        }
        SQL += ")";
        return this.eksekusiUpdate(SQL);
    }
    
//Fungsi eksekusi query update
    public String queryUpdate(String nameTable, String[] namecolumn, String[] value, String condition) {
        SQL = "UPDATE " + nameTable + " SET ";

        for (int i = 0; i <= namecolumn.length - 1; i++) {
            SQL += namecolumn[i] + "='" + value[i] + "'";
            if (i < namecolumn.length - 1) {
                SQL += ",";
            }
        }
        SQL += " WHERE " + condition;
        return this.eksekusiUpdate(SQL);
    }

//Fungsi eksekusi query delete
    public String queryDelete(String nameTable) {
        SQL = "DELETE FROM " + nameTable;
        return this.eksekusiUpdate(SQL);
    }

//Overload fungsi eksekusi query delete dengan where
    public String queryDelete(String nameTable, String condition) {
        SQL = "DELETE FROM " + nameTable + " WHERE " + condition;
        return this.eksekusiUpdate(SQL);
    }

}
