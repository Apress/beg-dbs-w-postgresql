// insert.cs - insert data directly
                                                                                
using System;
using System.Data;
using Npgsql;
                                                                                
public class connect
{
  public static void Main(String[] args) {
    NpgsqlConnection conn = new
NpgsqlConnection("Server=192.168.0.3;Port=5432;User Id=rick;Password=password;Database=bpfinal;");
    try {
      conn.Open();
      NpgsqlCommand cmd = new NpgsqlCommand("INSERT INTO customer(title, fname, lname, addressline, town, zipcode, phone) VALUES('Mr.', 'Simon', 'Bennett', '1 Victoria Street', 'Nicetown', 'NT4 2WS', '342 6352')", conn);
      int rowsaffected = cmd.ExecuteNonQuery();
      Console.Write("Rows affected {0}", rowsaffected);
    }
    finally {
      conn.Close();
    }
  }
}
