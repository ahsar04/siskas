/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SisKas;

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
public class loginConn {
    PreparedStatement pst;
    ResultSet rs;
    Statement st;
    public static Connection con;
    public static Statement stm;
    
    public void config(){
    try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/db_siskas", "root", "");
            stm = con.createStatement();
            System.out.println("Koneksi Berhasil");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginConn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginConn.class.getName()).log(Level.SEVERE, null, ex);
        }
}
    public void insertDB(String admin_id, String nama, String telp, String username, String alamat, String password) {
        try {
            String sql = "insert into tb_admin values (?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, admin_id);
            pst.setString(2, nama);
            pst.setString(3, telp);
            pst.setString(4, username);
            pst.setString(5, alamat);
            pst.setString(6, password); 
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(loginConn.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet selectDB() {
        try {
            String sql ="select * from tb_admin";
            st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(loginConn.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

}
