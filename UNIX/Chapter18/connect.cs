// Connect.cs
// Connect to the bpfinal PostgreSQL database on the server 192.168.0.3 as
// the user rick, with a password of 'password'.
                                                                                
using System;
using Npgsql;
                                                                                
public class connect
{
  public static void Main(String[] args) {
    NpgsqlConnection conn = new
NpgsqlConnection("Server=192.168.0.3;User Id=rick;Password=password;Database=bpfinal;");
    try {
      conn.Open();
      Console.Write("State: {0}, Server Version: {1}", conn.State, conn.ServerVersion);
      Console.WriteLine();
    }
    finally {
      conn.Close();
    }
  }
}
