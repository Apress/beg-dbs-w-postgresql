import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;

public class PostgreSQLMetaData {
    
    public static void main(String args[]) throws Exception {
        
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://gw1/bpfinal";
        Connection con = 
            DriverManager.getConnection(url,"rick","password");
        DatabaseMetaData dbmd = con.getMetaData();
        
        System.out.print("Database Product Name : ");
        System.out.println(dbmd.getDatabaseProductName());
        
        System.out.print("Database Product Version : ");
        System.out.println(dbmd.getDatabaseProductVersion());
        
        System.out.print("Driver Major Version : ");
        System.out.println(dbmd.getDriverMajorVersion());
        
        System.out.print("Driver Minor Version : ");
        System.out.println(dbmd.getDriverMinorVersion());
        
        System.out.print("Driver Name : ");
        System.out.println(dbmd.getDriverName());
        
        System.out.print("Driver Version : ");
        System.out.println(dbmd.getDriverVersion());
        
        System.out.print("JDBC URL : ");
        System.out.println(dbmd.getURL());
        
        System.out.print("Supports Transactions : ");
        System.out.println(dbmd.supportsTransactions());

	System.out.print("Default Transaction Isolation level : ");
	System.out.println(dbmd.getDefaultTransactionIsolation());
        
        System.out.print("Uses Local Files : ");
        System.out.println(dbmd.usesLocalFiles());
        
        con.close();
        
    }
    
}
