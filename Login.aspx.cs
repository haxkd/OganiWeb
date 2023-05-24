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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            connection.Open();
            string checkEmail = $"SELECT * FROM Users WHERE uemail='{uemail.Text}'";
            SqlDataReader rd = new SqlCommand(checkEmail, connection).ExecuteReader();
            if (rd.Read())
            {
                if (rd["upassword"].ToString() == upassword.Text)
                {
                    Session["uid"] = rd["uid"].ToString();
                    Response.Redirect("Profile.aspx");
                }
                else
                {
                    Response.Write("<script>alert('invalid password')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('invalid email')</script>");
            }

        }
    }
}