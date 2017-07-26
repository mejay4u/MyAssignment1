using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnectionHelper
/// </summary>
public class ConnectionHelper
{
    public SqlConnection Connection { get; set; }

    public void GetConnection()
    {

        string ConnectionString = @"Data Source=MACHINE-222\SQLEXPRESS;Initial Catalog = DemoDb; Integrated Security = True";
        this.Connection = new SqlConnection(ConnectionString);
        SqlConnection.ClearPool(this.Connection);
        this.Connection.Open();
    }

    public void CloseConnection(SqlConnection con)
    {
        try
        {
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CloseConnection()
    {
        try
        {
            this.Connection.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}