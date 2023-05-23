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
    public partial class Show : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (id == null)
            {
                Response.Redirect("Default.aspx");
            }

            string query = $"SELECT * FROM Product WHERE ProductId='{id}'";
            connection.Open();
            SqlCommand cmd = new SqlCommand(query, connection);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                string name = rd["ProductName"].ToString();
                string price = rd["ProductPrice"].ToString();
                string desc = rd["ProductDesc"].ToString();
                pname.InnerText = name;
                pprice.InnerText = price;
                pdesc.InnerText = desc;
                pimg.Src = "/img/products/"+ rd["ProductImage"].ToString();

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}