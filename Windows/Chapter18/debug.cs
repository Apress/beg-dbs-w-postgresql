// Debug.cs
                                                                                
using System;
using Npgsql;
                                                                                
public class connect
{
  public static void Main(String[] args) {
    NpgsqlEventLog.Level = LogLevel.Debug;
    NpgsqlEventLog.LogName = "/tmp/Npgsqldebug.txt";
    NpgsqlEventLog.EchoMessages = true;
    
    NpgsqlConnection conn = new
NpgsqlConnection("Server=192.168.0.3;Port=5432;User Id=rick;Password=password;Database=bpfinal;");
    try {
      conn.Open();
      NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM customer", conn);
      NpgsqlDataReader datard = cmd.ExecuteReader();
      datard.Read();
      Console.Write("{0}, {1}, {2}", datard[0], datard[1], datard[2]);
      Console.WriteLine();
   }
   finally {
     conn.Close();
   }
}
}