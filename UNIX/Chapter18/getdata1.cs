// Getdata1.cs - a simple retrieve of data from the customer table
                                                                                
using System;
using Npgsql;
                                                                                
public class connect
{
  public static void Main(String[] args) {
    NpgsqlConnection conn = new
NpgsqlConnection("Server=192.168.0.3;Port=5432;User Id=rick;Password=password;Database=bpfinal;");
    try {
      conn.Open();
      NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM customer", conn);
      NpgsqlDataReader datard = cmd.ExecuteReader();
      while (datard.Read()) {
        for (int i = 0; i < datard.FieldCount; i++) {
          Console.Write("{0}, ", datard[i]);
        }
        Console.WriteLine();
        
      }
   }
   finally {
     conn.Close();
   }
}
}
