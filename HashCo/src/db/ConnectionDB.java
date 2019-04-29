package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionDB {

     Connection conn = null;
    public static Connection conDB()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/docter_table", "root", "");
            
            return con;
        } catch (ClassNotFoundException | SQLException ex) {
              System.out.println("1231331321");
            System.err.println("ConnectionUtil : "+ex.getMessage());
           return null;
        }
    }
}
