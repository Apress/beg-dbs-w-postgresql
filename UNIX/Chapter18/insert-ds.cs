// insert-ds.cs - insert data via a dataset
                                                                                
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
      
      DataSet ds = new DataSet();
      
      NpgsqlDataAdapter da = new NpgsqlDataAdapter("SELECT description, cost_price, sell_price FROM item", conn);
      da.InsertCommand = new NpgsqlCommand("INSERT INTO item(description, cost_price, sell_price) VALUES(:de, :cp, :sp)", conn);
      da.InsertCommand.Parameters.Add(new NpgsqlParameter(":de", DbType.String));
      da.InsertCommand.Parameters.Add(new NpgsqlParameter(":cp", DbType.Double));
      da.InsertCommand.Parameters.Add(new NpgsqlParameter(":sp", DbType.Double));
      da.InsertCommand.Parameters[0].SourceColumn = "description";
      da.InsertCommand.Parameters[1].SourceColumn = "cost_price";
      da.InsertCommand.Parameters[2].SourceColumn = "sell_price";
      
      da.Fill(ds);
      
      DataTable dt = ds.Tables[0];
      DataRow dr = dt.NewRow();
      dr["description"] = "Large Penguin";
      dr["cost_price"] = 7.23;
      dr["sell_price"] = 9.99;
            
      dt.Rows.Add(dr);
      da.Update(ds);
      
    }
    finally {
      conn.Close();
    }
  }
}
