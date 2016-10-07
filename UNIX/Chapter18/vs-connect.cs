

using System;
using System.Data;
using Microsoft.Data.Odbc;



class PostgreSQL 
{
	static void Main(string[] args)	{
		
		const string CONNECTION_STRING = 
			"DRIVER={PostgreSQL};SERVER=192.168.0.3;UID=rick;PWD=password;DATABASE=bpfinal";
		OdbcConnection conn = new OdbcConnection();
		conn.ConnectionString = CONNECTION_STRING;
		conn.Open();
		Console.WriteLine("Version: {0}", conn.ServerVersion);
		conn.Close();
		Console.ReadLine();
		conn.ConnectionString = "dsn=PostgreSQL-bpfinal";
		conn.Open();
		Console.WriteLine("Version: {0}", conn.ServerVersion);
		conn.Close();
		Console.ReadLine();
	}
}
