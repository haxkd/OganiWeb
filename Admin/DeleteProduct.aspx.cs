using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OganiWeb.Admin
{
    public partial class DeleteProduct : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string PId = Request.QueryString["PId"];
            if (PId == null)
            {
                Response.Redirect("ShowProduct.aspx");
            }
            string query = $"DELETE FROM Product WHERE ProductId='{PId}'";
            connection.Open();
            new SqlCommand(query,connection).ExecuteNonQuery();
            
           Response.Redirect("ShowProduct.aspx");
            
        }
    }
}