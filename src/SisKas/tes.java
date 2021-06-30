/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SisKas;
import java.util.Date;  
import java.text.DateFormat;  
import java.text.SimpleDateFormat; 
/**
 *
 * @author Ahmad Saifur Rohman
 */
public class tes {
    public static void main(String[] args) {
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");  
        Date date = new Date();
        int tgl = Integer.parseInt(dateFormat.format(date));
        System.out.println("tanggal = "+tgl);
        String nama = "T202106291";
        System.out.println("Nama = "+nama);
        System.out.println("sub string = "+nama.substring(1,9));
        int urut = Integer.parseInt(nama.substring(9));
        System.out.println("urut = "+urut);
        int taek = Integer.parseInt(nama.substring(1,9));
        if (tgl==taek) {
        System.out.println("T"+dateFormat.format(date)+(urut+1));
        }else{
        System.out.println("T"+dateFormat.format(date)+"1");
        }
    }
}
