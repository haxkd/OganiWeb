using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OganiWeb.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(new SqlCommand("SELECT * FROM Category", connection));
                DataSet data = new DataSet();
                adapter.Fill(data);
                CategoryList.DataSource = data;
                CategoryList.DataValueField = "CatId";
                CategoryList.DataTextField = "CatName";
                CategoryList.DataBind();
            }
        }

        protected void saveProduct_Click(object sender, EventArgs e)
        {
            ProductImage.SaveAs(Server.MapPath("~/img/products/" + ProductImage.FileName));
            string productName = ProductName.Text;
            string productPrice = ProductPrice.Text ;
            string productDesc = ProductDesc.Text;
            string productImage = ProductImage.FileName;
            string categoryId = CategoryList.SelectedValue;
            string query = $"INSERT INTO Product VALUES('{productName}','{productPrice}','{productDesc}','{productImage}','{categoryId}')";
            connection.Open();
            new SqlCommand(query,connection).ExecuteNonQuery();
        }
    }
}