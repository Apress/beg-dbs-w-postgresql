// Getdata3.cs - a retrieve of data from the customer table using parameters
                                                                                
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
      NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM customer WHERE customer_id = :cid OR fname = :fn", conn);
      cmd.Parameters.Add(new NpgsqlParameter("cid", DbType.Int32));
      cmd.Parameters.Add(new NpgsqlParameter("fn", DbType.String));
      cmd.Parameters[0].Value = 2;
      cmd.Parameters[1].Value = "Jenny";
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