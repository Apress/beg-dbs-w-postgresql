import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.DriverManager;

public class StatementClient {
    
    public static void main(String args[]) throws Exception {

//Load the JDBC driver and get a connection. Create a statement from the connection:

        
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://gw1/bpfinal";
        Connection con = DriverManager.getConnection(url,"rick","password");
            
        Statement stmt = con.createStatement();

//Add two SQL statements for inserting records into the customer table into a batch:
        System.out.println("Inserting records");
        stmt.addBatch("INSERT INTO customer(title,fname," +
            "lname,addressline,town,zipcode,phone) values " +
            "('Mr','Fred','Flintstone','31 Bramble Avenue'," +
            "'London','NT2 1AQ','023 9876')"); 
        stmt.addBatch("INSERT INTO customer(title,fname," +
            "lname,addressline,town,zipcode,phone) values " +
            "('Mr','Barney','Rubble','22 Ramsons Avenue'," +
            "'London','PWD LS1','111 2313')");
        

//Execute the batch:
        stmt.executeBatch();           
        System.out.println("Records Inserted");
        System.out.println();

//Select the records from the customer table and print the contents to the standard output:        
        System.out.println("Selecting all records");
        String selectSQL = "SELECT title, fname, lname, town FROM customer";
        ResultSet res = stmt.executeQuery(selectSQL);
        
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
        System.out.println("Records deleted: " + stmt.executeUpdate(deleteSQL));
        

//Close the result set, statement and connection to free up resources:
        res.close();        
        stmt.close();
        con.close();
        
    }
    
}
