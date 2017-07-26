using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BAL_Product
/// </summary>
public class BAL_Product
{
    DAL_Product dalObj;
    public bool InsertProduct(BO_Product BoProducts)
    {
        dalObj = new DAL_Product();
        try
        {
            return dalObj.InsertItem(BoProducts);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataTable GEtAllProducts()
    {
        dalObj = new DAL_Product();
        try
        {
            return dalObj.GetAllProducts();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public DataSet GetSelectedProductData(BO_Product BoProduct)
    {
        dalObj = new DAL_Product();
        try
        {
            return dalObj.GetSelectedProductData(BoProduct);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool RemoveProduct(BO_Product BoProduct)
    {
        dalObj = new DAL_Product();
        try
        {
            return dalObj.RemoveProduct(BoProduct);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}