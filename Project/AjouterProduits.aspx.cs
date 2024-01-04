 using Projet_AppTrans.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_AppTrans
{
    public partial class AjouterProduits : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
                        
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            ProjetEntities project_context = new ProjetEntities();
            int already_exists = project_context.Products.Where(p => p.name == product_name_id.Text).Count();
            if (already_exists > 0)
            {
                productsConfirmation.Text = "Product already exists";
                productsConfirmation.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into [Products](name, quantity, price, category_id, image_path)" + "values(@name, @quantity, @price, @category_id, @image_path)";

                int quantity = int.Parse(product_quantity_id.Text);
                float price = float.Parse(product_price_id.Text);
                int category = int.Parse(product_category_id.Text);
                string name = product_name_id.Text;

                string filename = Path.GetFileName(image_path.PostedFile.FileName);
                image_path.SaveAs(Server.MapPath("~/Images/" + filename));


                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@category_id", category);
                cmd.Parameters.AddWithValue("@image_path", "Images/" + filename);


                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    productsConfirmation.Text = "Product added successfully";
                    productsConfirmation.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    productsConfirmation.Text = "Mistake";
                    productsConfirmation.ForeColor= System.Drawing.Color.Red;
                }
                con.Close();
                Response.Redirect(Request.Url.ToString());
            }
        
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowEditing(object sender, EventArgs e)
        {

        }
        protected void SqlDataSource1_Selecting(object sender, EventArgs e)
        {

        }
    }
}