using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projet_AppTrans.Models;

namespace Projet_AppTrans.Customers
{
    public partial class Desserts : System.Web.UI.Page
    {
        public static decimal total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductData();
            }
        }

        private void BindProductData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT id, name, description, price, image_path, quantity FROM products WHERE category_id = 6;", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    repeater.DataSource = dt;
                    repeater.DataBind();
                }
            }
        }

        protected void AddToCart(object sender, EventArgs e)
        {
            message_id.Text = "";
            Button btnAddToCart = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)btnAddToCart.NamingContainer;

            Image image = (Image)repeaterItem.FindControl("image_id");
            Label lblProductId = (Label)repeaterItem.FindControl("product_id");
            Label lblProductName = (Label)repeaterItem.FindControl("product_name_id");
            Label lblProductQty = (Label)repeaterItem.FindControl("quantity_id");
            Label lblProductPrice = (Label)repeaterItem.FindControl("product_price_id");
            Label lblCartConf = (Label)repeaterItem.FindControl("cart_conf");

            int productId = Convert.ToInt32(lblProductId.Text);
            string productName = lblProductName.Text;
            int productQty = Convert.ToInt32(lblProductQty.Text);
            decimal price = Convert.ToDecimal(lblProductPrice.Text);
            string image1 = image.ImageUrl;
            total += price;

            List<Products> cart;

            if (Session["Cart"] == null)
            {
                cart = new List<Products>();
            }
            else
            {
                cart = (List<Products>)Session["Cart"];
            }

            if (productQty > 0 && !cart.Any(p => p.id == productId))
            {
                Products product = new Products { id = productId, name = productName, quantity = productQty.ToString(), image_path = image1, price = price.ToString() };
                cart.Add(product);
                message_id.Text = "Added successfully";
                message_id.Font.Size = FontUnit.Point(20);
                message_id.Font.Bold = true;
                message_id.ForeColor = System.Drawing.Color.Wheat;
            }
            // Check if the product is already in the cart
            else if (cart.Any(p => p.id == productId))
            {
                message_id.Text = "Product already in cart";
                message_id.Font.Size = FontUnit.Point(20);
                message_id.Font.Bold = true;
                message_id.ForeColor = System.Drawing.Color.Wheat;
            }
            else
            {
                message_id.Text = "Please add at least 1 item.";
                message_id.Font.Size = FontUnit.Point(20);
                message_id.Font.Bold = true;
                message_id.ForeColor = System.Drawing.Color.Wheat;
            }

            // Update the session
            Session["Cart"] = cart;
        }
        protected void Find(object sender, EventArgs e)
        {
            string searchKey = search_id.Text.Trim();
            string connectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();

            string query = "SELECT id, name, description, price, image_path, quantity FROM products WHERE name = @searchKey;";

            SqlConnection con = new SqlConnection(connectionString);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            sda.SelectCommand.Parameters.AddWithValue("@searchKey", searchKey);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (searchKey == "")
            {
                BindProductData();
                search_error.Text = "";
            }
            else if (dt.Rows.Count == 0)
            {
                search_error.Text = "No results found";
                search_error.ForeColor = System.Drawing.Color.Wheat;
            }
            else
            {
                search_error.Text = "";
                repeater.DataSource = dt;
                repeater.DataBind();
            }
        }


        protected void LowerArticles(object sender, EventArgs e)
        {
            Button lower = (Button)sender;
            RepeaterItem repItem = (RepeaterItem)lower.NamingContainer;

            Label id = (Label)repItem.FindControl("product_id");
            Label quantity = (Label)repItem.FindControl("quantity_id");

            int product_id = Convert.ToInt32(id.Text);
            int current_quantity = Convert.ToInt32(quantity.Text);

            if (current_quantity <= 0)
            {
                quantity.Text = "0";
            }
            else
            {
                int new_quantity = current_quantity - 1;
                string connectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string query = "UPDATE products SET quantity = @new_quantity WHERE id = @product_id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@product_id", product_id);
                cmd.Parameters.AddWithValue("@new_quantity", new_quantity);
                cmd.ExecuteNonQuery();
                BindProductData();
            }
        }

        protected void IncrementArticles(object sender, EventArgs e)
        {
            Button increment = (Button)sender;
            RepeaterItem repItem = (RepeaterItem)increment.NamingContainer;

            Label id = (Label)repItem.FindControl("product_id");
            Label quantity = (Label)repItem.FindControl("quantity_id");

            int product_id = Convert.ToInt32(id.Text);
            int current_quantity = Convert.ToInt32(quantity.Text);
            int new_quantity = current_quantity + 1;

            string connectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "UPDATE products SET quantity = @new_quantity WHERE id = @product_id";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@product_id", product_id);
            cmd.Parameters.AddWithValue("@new_quantity", new_quantity);
            cmd.ExecuteNonQuery();
            BindProductData();
        }
    }
}