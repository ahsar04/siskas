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
//    String location = "C:\\Users\\Ahmad Saifur Rohman\\OneDrive\\Documents\\NetBeansProjects\\";
    int i;
    
    
    public Conn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String Database="db_siskas";
            String Username="root";
            String Password="";
            con = DriverManager.getConnection("jdbc:mysql://localhost/"+Database, Username, Password);
//            System.out.println("Koneksi Berhasil");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void selectJoinCondition(String[] column, String nameTable, String condition){
        
        try {
            SQL = "SELECT ";
        for (i = 0; i <= column.length - 1; i++) {
            SQL += column[i];
            if (i < column.length - 1) {
                SQL += ",";
            }
        }
        SQL += " FROM " + nameTable + " WHERE " + condition;
            pst = con.prepareStatement(SQL);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Conn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //Overload fungsi untuk eksekusi query select semua kolom dengan where
    public void selectAllCondition(String nameTable, String column, String condition) {
        try {
            SQL = "SELECT * FROM " + nameTable + " WHERE " +column+"="+ condition;
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
}
