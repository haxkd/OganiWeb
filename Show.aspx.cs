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
                pimg.Src = "/img/products/" + rd["ProductImage"].ToString();
                connection.Close();

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void addcart_Click(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            string pid = Request.QueryString["id"];
            string uid = Session["uid"].ToString();
            string quant = quantity.Value;



            string check = $"SELECT * FROM Cart WHERE uid='{uid}' and pid='{pid}'";
            connection.Open();

            if (new SqlCommand(check, connection).ExecuteReader().Read())
            {
                Response.Write("<script>alert('product already in cart')</script>");

            }
            else
            {
                connection.Close();
                connection.Open();
                string query = $"INSERT INTO Cart(pid,uid,quantity) VALUES('{pid}','{uid}','{quant}')";
                new SqlCommand(query, connection).ExecuteNonQuery();
                Response.Write("<script>alert('product added to cart')</script>");
            }
            connection.Close();
        }
    }
}