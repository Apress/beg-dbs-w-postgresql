
using System;
using System.Data;
using Microsoft.Data.Odbc;



class PostgreSQL 
{
	static void Main(string[] args)	
	{
		
		const string CONNECTION_STRING = 
				  "DRIVER={PostgreSQL};SERVER=192.168.0.3;UID=rick;PWD=password;DATABASE=bpfinal";
		OdbcConnection conn = new OdbcConnection();
		conn.ConnectionString = CONNECTION_STRING;
		conn.Open();
		DataSet ds = new DataSet();
		OdbcDataAdapter da = new OdbcDataAdapter("SELECT * FROM customer", conn);
		da.Fill(ds, "customer");
		DataTable dt = ds.Tables["customer"];
		foreach(DataRow dr in dt.Rows) 
		{
			Console.Write("Name: {0}, {1}, {2}\n", dr[1], dr["fname"], dr["lname"]);
		}
		conn.Close();
		Console.WriteLine();
		Console.ReadLine();
	}
}
