using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Data;

namespace sparklyasp
{
    public partial class PurchaseOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void DetailsView1_Load(object sender, EventArgs e)
        {
            string strOrderID = DetailsView1.Rows[0].Cells[1].Text;
            string strSelectQuery = "SELECT RawMaterials.rawMaterialsName, PurchaseOrderLines.purchaseOrderItemQty, PurchaseOrderLines.purchaseOrderItemPrice, PurchaseOrderLines.purchaseOrderLineSubtotal, PurchaseOrders.purchaseOrderID FROM ((PurchaseOrders INNER JOIN PurchaseOrderLines ON PurchaseOrders.purchaseOrderID = PurchaseOrderLines.purchaseOrderID) INNER JOIN RawMaterials ON PurchaseOrderLines.rawMaterialsID = RawMaterials.rawMaterialsID) WHERE PurchaseOrders.purchaseOrderID = @orderID";
            string strConnection = ConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString;

            using (OleDbConnection connection = new OleDbConnection(strConnection))
            {
                OleDbCommand command = new OleDbCommand(strSelectQuery, connection);
                command.Parameters.Add("orderID", OleDbType.Integer).Value = strOrderID;
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();               
                GridView1.DataSource = reader;
                GridView1.DataBind();                
            }

        }

        protected void ListView1_SelectedIndexChanging(object sender, EventArgs e)
        {
            string orderID = ListView1.SelectedDataKey[0].ToString();
            string selectQuery = "SELECT PurchaseOrders.purchaseOrderID, PurchaseOrders.purchaseOrderNo, PurchaseOrders.purchaseOrderDate, Suppliers.supplierName, Suppliers.contactName, Suppliers.supplierPhone, Suppliers.supplierEmail, PurchaseOrders.deliveryAddress FROM (PurchaseOrders INNER JOIN Suppliers ON PurchaseOrders.supplierID = Suppliers.supplierID) WHERE purchaseOrderID = @purchaseOrderID";
            string strConnection = ConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString;

            using (OleDbConnection connection = new OleDbConnection(strConnection))
            {
                OleDbCommand command = new OleDbCommand(selectQuery, connection);
                command.Parameters.Add("purchaseOrderID", OleDbType.Integer).Value = orderID;
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();
                DetailsView1.DataSource = reader;
                DetailsView1.DataBind();
            }
        }
    }
}