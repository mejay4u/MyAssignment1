using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Presentation_Master_AddProducts : System.Web.UI.Page
{
    #region Declaration
    static DataTable productDt = new DataTable();
    static DataTable imageURL = new DataTable();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        imageURL.Clear();
    }
    #region btn Click Events
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool res = InsertProduct();
        if (res)
        {
            Response.Redirect("../Master/AddProducts.aspx");
        }


    }
    #endregion

    #region Insert Product
    public bool InsertProduct()
    {
        BO_Product boObjects = new BO_Product();
        BAL_Product balObject = new BAL_Product();
        boObjects.XMLImagesPath = SaveImages();
        boObjects.ProductName = txtProductName.Text;
        boObjects.ProductCode = txtProductCode.Text;
        boObjects.ProductDescription = txtProductDescription.Text;
        boObjects.ProductQty = Convert.ToInt32(txtProductQty.Text);
        boObjects.Price = Convert.ToDecimal(txtPrice.Text);
        boObjects.ConatctEmail = txtConatctEmail.Text;
        boObjects.ConatctTelephone = Convert.ToInt64(txtContactTelephone.Text);
        boObjects.ContactName = txtContactName.Text;
        bool result = balObject.InsertProduct(boObjects);

        return result;
    }
    #endregion

    #region Bind Grid
    [WebMethod(Description = "Server Side DataTables support", EnableSession = true)]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static void Data(object parameters)
    {
        var req = DataTableParameters.Get(parameters);


        var resultSet = BindGrid();
        resultSet.draw = req.Draw;
        SendResponse(HttpContext.Current.Response, resultSet);

    }
    private static DataTableResultSet BindGrid()
    {
        BAL_Product balObj = new BAL_Product();
        productDt = balObj.GEtAllProducts();
        DataTableResultSet resultSet = new DataTableResultSet();
        if (productDt != null)
        {
            for (int i = 0; i < productDt.Rows.Count; i++)
            {
                var columns = new List<string>();
            
                columns.Add(productDt.Rows[i]["ProductID"].ToString());
                columns.Add(productDt.Rows[i]["ProductName"].ToString());
                columns.Add(productDt.Rows[i]["ProductCode"].ToString());
                columns.Add(productDt.Rows[i]["ProductDescription"].ToString());
                columns.Add(productDt.Rows[i]["Price"].ToString());
                columns.Add(productDt.Rows[i]["ProductQty"].ToString());
                columns.Add(productDt.Rows[i]["ConatctName"].ToString());
                columns.Add(productDt.Rows[i]["ContactTelephone"].ToString());
                columns.Add(productDt.Rows[i]["ConatctEmail"].ToString());
                columns.Add("<button id='btnViewProduct' type='button' class='btn btn-warning btn-xs' onclick='ViewModal();'; return false;'>View</button>  <button id='btnDeleteProduct' type='button' class='btn btn-danger btn-xs' onclick='DeleteItem()'; return false;'>Delete</button>");

                resultSet.data.Add(columns);
            }
            resultSet.recordsTotal = productDt.Rows.Count;
            resultSet.recordsFiltered = productDt.Rows.Count;
        }

        return resultSet;

    }
    private static void SendResponse(HttpResponse response, DataTableResultSet result)
    {
        response.Clear();
        response.Headers.Add("X-Content-Type-Options", "nosniff");
        response.Headers.Add("X-Frame-Options", "SAMEORIGIN");
        response.ContentType = "application/json; charset=utf-8";
        response.Write(result.ToJSON());
        response.Flush();
        response.End();
    }
    #endregion

    #region SaveImages
    public string SaveImages()
    {
        HttpFileCollection hfc = Request.Files;
        DataTable filePathDt = new DataTable { TableName = "Images" };
        filePathDt.Columns.Add("name");
        for (int i = 0; i < hfc.Count; i++)
        {
            HttpPostedFile hpf = hfc[i];
            if (hpf.ContentLength > 0)
            {
                hpf.SaveAs(Server.MapPath("~/ProductImages/") + "\\" + System.IO.Path.GetFileName(hpf.FileName));
                DataRow row = filePathDt.NewRow();
                row["name"] = System.IO.Path.GetFileName(hpf.FileName);
                filePathDt.Rows.Add(row);

            }
        }
        string resultinXML = string.Empty;
        using (StringWriter sw = new StringWriter())
        {
            if (filePathDt.Rows.Count > 0)
            {
                filePathDt.WriteXml(sw);

                resultinXML = sw.ToString();
            }
            else
                resultinXML = "";
        }

        return resultinXML;
    }
    #endregion

    #region Getting Product Data and Images
    [WebMethod]
    public static List<string> GetSelectedProductData(string par)
    {
        DataSet itemDs = new DataSet();
        BO_Product boProduct = new BO_Product();
        BAL_Product balObj = new BAL_Product();
        boProduct.ProductId = Convert.ToInt32(par);

        itemDs = balObj.GetSelectedProductData(boProduct);
        imageURL = itemDs.Tables[1];
        List<string> arr = new List<string>();
        arr.Clear();
        arr.Add(itemDs.Tables[0].Rows[0]["ProductID"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ProductName"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ProductCode"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ProductDescription"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["Price"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ProductQty"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ConatctName"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ContactTelephone"].ToString().Trim());
        arr.Add(itemDs.Tables[0].Rows[0]["ConatctEmail"].ToString().Trim());
        return arr;
    }


    [WebMethod]
    public static List<string> GetImageURL()
    {
        List<string> arr = new List<string>();
        for (int i = 0; i < imageURL.Rows.Count; i++)
        {
            arr.Add(imageURL.Rows[i]["ImageUrl"].ToString().Trim());
        }
        return arr;
    }

    #endregion

    #region Remove Product
    [WebMethod]
    public static void RemoveProduct(string par)
    {
        BAL_Product balobj = new BAL_Product();
        BO_Product boProduct = new BO_Product();
        boProduct.ProductId = Convert.ToInt32(par);
        balobj.RemoveProduct(boProduct);
    }
    #endregion
}