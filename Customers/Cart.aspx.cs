using Projet_AppTrans.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Projet_AppTrans.Customers
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayCart();
            }
        }

        public void DisplayCart()
        {
            List<Products> cart = (List<Products>)Session["Cart"];

            decimal total = 0;

            if (cart != null)
            {
                foreach (var item in cart)
                {
                    decimal price = Decimal.Parse(item.price); 
                    int quantity = int.Parse(item.quantity); 
                    total += price * quantity;
                }

                total_id.Text = "Total: " + total.ToString() + "$";
                rptCart.DataSource = cart;
                rptCart.DataBind();
            }
            else
            {
                total_id.Text = "No items in cart";
                total_id.Font.Bold = true;
                total_id.Font.Size = FontUnit.Point(20);
                total_id.ForeColor = System.Drawing.Color.Wheat;
            }

        }

        protected void RemoveFromCart_click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            if (int.TryParse(btn.CommandArgument, out int productId))
            {
                RemoveFromCart(productId);
            }
        }


        public void RemoveFromCart(int productId)
        {
            List<Products> cart = (List<Products>)Session["Cart"];

            if (cart != null)
            {
                int index = cart.FindIndex(item => item.id == productId); 

                if (index != -1)
                {
                    cart.RemoveAt(index);

                    Session["Cart"] = cart;

                    DisplayCart();
                }
            }
        }

        protected void purchase_click(object sender, EventArgs e)
        {
            Response.Redirect("/Customers/purchase.html");
        }
    }
}
