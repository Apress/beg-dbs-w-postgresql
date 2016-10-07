import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.DriverManager;

public class PreparedStatementClient {
    
    public static void main(String args[]) throws Exception {

//Load the JDBC driver and get a connection. Create a statement from the connection:

        
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://gw1/bpfinal";
        Connection con = DriverManager.getConnection(url,"rick","password");
            
        PreparedStatement stmt;
        
        String insertSQL = "INSERT INTO customer(title,fname," +
            "lname,addressline,town,zipcode,phone) VALUES " +
            "(?,?,?,?,?,?,?)";
        
        stmt = con.prepareStatement(insertSQL);
                                
        System.out.println("Inserting records");
        
        stmt.setString(1,"Mr");
        stmt.setString(2,"Fred");
        stmt.setString(3,"Flintstone");
        stmt.setString(4,"31 Bramble Avenue");
        stmt.setString(5,"London");
        stmt.setString(6,"NT2 1AQ");
        stmt.setString(7,"023 9876");
        stmt.executeUpdate();
        
        stmt.clearParameters();
        
        stmt.setString(1,"Mr");
        stmt.setString(2,"Barney");
        stmt.setString(3,"Rubble");
        stmt.setString(4,"22 Ramsons Avenue");
        stmt.setString(5,"London");
        stmt.setString(6,"PWD LS1");
        stmt.setString(7,"111 2313");
        stmt.executeUpdate(); 
    

//Select the records from the customer table and print the contents to the standard output:        
        System.out.println("Selecting all records");
        String selectSQL = "SELECT title, fname, lname, town FROM customer";
        stmt = con.prepareStatement(selectSQL);
        ResultSet res = stmt.executeQuery();
        
// Retreve the MetaData from the result set
    ResultSetMetaData rsmd = res.getMetaData();
    int colCount = rsmd.getColumnCount();

// Display the column titles
    for(int i = 1;i <= colCount; i++) {
        System.out.print(rsmd.getColumnLabel(i) + "\t");
    }
    System.out.println();


        while(res.next()) {
            for(int i = 1;i <= colCount; i++) {
                System.out.print(res.getString(i) + "\t");
            }
            System.out.println();
        }
        System.out.println();
        

//Delete the records from the customer table and print the number of records deleted:

        System.out.println("Deleting records");
        String deleteSQL = "DELETE FROM customer WHERE (fname = 'Fred' AND lname = 'Flintstone') OR (fname = 'Barney' AND lname = 'Rubble')";
        stmt = con.prepareStatement(deleteSQL);
        System.out.println("Records deleted: " + stmt.executeUpdate());
        

//Close the result set, statement and connection to free up resources:
        res.close();        
        stmt.close();
        con.close();
        
    }
    
}
