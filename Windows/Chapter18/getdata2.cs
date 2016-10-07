// Getdata2.cs - a simple retrieve of meta-data from the customer table
                                                                                
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
      datard.Read();
      Console.Write("There are {0} columns\n", datard.FieldCount);
      for (int i = 0; i < datard.FieldCount; i++) {
        Console.Write("Name: {0}, NpgsqlType: {1}", datard.GetName(i), datard.GetFieldType(i));
        Console.WriteLine();
      }
      Console.Write("First row by named column: {0}, {1}", datard["fname"], datard["lname"]);
    }
    finally {
      conn.Close();
    }
  }
}