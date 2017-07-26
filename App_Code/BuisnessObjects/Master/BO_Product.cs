using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BO_Product
/// </summary>
public class BO_Product
{
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public string ProductCode { get; set; }
    public string ProductDescription { get; set; }
    public decimal Price { get; set; }
    public int ProductQty { get; set; }
    public string ContactName { get; set; }
    public long ConatctTelephone { get; set; }
    public string ConatctEmail { get; set; }
    public string XMLImagesPath { get; set; }
}