using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace OganiWeb.Admin
{
    public partial class EditProduct : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string PId = Request.QueryString["PId"];
                if (PId == null)
                {
                    Response.Redirect("ShowProduct.aspx");
                }
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(new SqlCommand("SELECT * FROM Category", connection));
                DataSet data = new DataSet();
                adapter.Fill(data);
                CategoryList.DataSource = data;
                CategoryList.DataValueField = "CatId";
                CategoryList.DataTextField = "CatName";
                CategoryList.DataBind();
                connection.Close();


                string query = $"SELECT * FROM Product WHERE ProductId='{PId}'";
                connection.Open();
                SqlCommand cmd = new SqlCommand(query, connection);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    ProductName.Text = rd["ProductName"].ToString();
                    ProductPrice.Text = rd["ProductPrice"].ToString();
                    ProductDesc.Text = rd["ProductDesc"].ToString();
                }
                else
                {
                    Response.Redirect("ShowProduct.aspx");
                }
            }
        }

        protected void UpdateProduct_Click(object sender, EventArgs e)
        {
            string productName = ProductName.Text;
            string productPrice = ProductPrice.Text;
            string productDesc = ProductDesc.Text;
            string categoryId = CategoryList.SelectedValue;
            string PId = Request.QueryString["PId"];

            string query = $"UPDATE Product SET ProductName='{productName}',ProductDesc='{productDesc}',ProductPrice='{productPrice}',CatId='{categoryId}' WHERE ProductId='{PId}'";

            if (ProductImage.HasFile)
            {
                ProductImage.SaveAs(Server.MapPath("~/img/products/" + ProductImage.FileName));
                string productImage = ProductImage.FileName;
                query = $"UPDATE Product SET ProductName='{productName}',ProductDesc='{productDesc}',ProductPrice='{productPrice}',CatId='{categoryId}',ProductImage='{productImage}' WHERE ProductId='{PId}'";
            }
            connection.Open();
            new SqlCommand(query,connection).ExecuteNonQuery();

        }
    }
}