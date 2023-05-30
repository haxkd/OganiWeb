using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace OganiWeb
{
    public partial class removeCart : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            string cid = Request.QueryString["cid"];
            connection.Open();
            string query = $"DELETE FROM Cart WHERE cid='{cid}' and uid='{Session["uid"]}'";
            new SqlCommand(query,connection).ExecuteNonQuery();
            Response.Redirect("Cart.aspx");
        }
    }
}