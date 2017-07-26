using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DAL_Product
/// </summary>
public class DAL_Product
{
    public DataTable GetAllProducts()
    {
        DataTable dt = new DataTable();
        ConnectionHelper con = new ConnectionHelper();
        try
        {
            con.GetConnection();
            SqlCommand cmd = new SqlCommand("usp_GetAllProducts", con.Connection);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        catch (Exception ex)
        {
          
        }
        finally
        {
            con.CloseConnection();
        }
        return dt;
    }
    public bool InsertItem(BO_Product BoProduct)
    {
        int result = 0;
        ConnectionHelper con = new ConnectionHelper();
        try
        {
            con.GetConnection();
            SqlCommand cmd = new SqlCommand("usp_InsertProducts", con.Connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductName", BoProduct.ProductName);
            cmd.Parameters.AddWithValue("@ProductCode", BoProduct.ProductCode);
            cmd.Parameters.AddWithValue("@ProductDescription", BoProduct.ProductDescription);
            cmd.Parameters.AddWithValue("@Price", BoProduct.Price);
            cmd.Parameters.AddWithValue("@ProductQty", BoProduct.ProductQty);
            cmd.Parameters.AddWithValue("@ConatctName", BoProduct.ContactName);
            cmd.Parameters.AddWithValue("@ContactTelephone", BoProduct.ConatctTelephone);
            cmd.Parameters.AddWithValue("@ConatctEmail", BoProduct.ConatctEmail);
            cmd.Parameters.AddWithValue("@ImageXML", BoProduct.XMLImagesPath);


            result = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
          
        }
        finally
        {
            con.CloseConnection();
        }
        if(result>1)
        {
            return true;
        }
        else
        {
            return false;
        }
      
    }
    public DataSet GetSelectedProductData(BO_Product BoProduct)
    {
        DataSet ds = new DataSet();
        ConnectionHelper con = new ConnectionHelper();
        try
        {
            con.GetConnection();
            SqlCommand cmd = new SqlCommand("usp_GetSelectedProductData", con.Connection);
            cmd.Parameters.AddWithValue("@ProductId", BoProduct.ProductId);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
        }
        catch (Exception ex)
        {
            
        }
        finally
        {
            con.CloseConnection();
        }
        return ds;
    }

    public bool RemoveProduct(BO_Product BOProduct)
    {
        int result = 0;
      ConnectionHelper con = new ConnectionHelper();
        try
        {
            con.GetConnection();
            SqlCommand cmd = new SqlCommand("usp_RemoveProduct", con.Connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductId", BOProduct.ProductId);

          result=cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            
        }
        finally
        {
            con.CloseConnection();
        }
        if (result == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}