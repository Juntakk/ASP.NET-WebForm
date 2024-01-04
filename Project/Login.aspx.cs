using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Objects;

namespace Projet_AppTrans.Models
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected const string CartSessionKey = "Orders_DetalsId";

        protected void Connection_Click(object sender, EventArgs e)
        {
            //Verify if customer exists
            string email = email_id.Text;
            string password = password_id.Text;

            ProjetEntities project_context = new ProjetEntities();
            Customer customer =
            project_context.Customer.Where(person => person.email.Equals(email) && person.password.Equals(password)).FirstOrDefault();
            if (customer != null)
            {
                if(customer.is_Admin != 0)
                {
                    Response.Redirect("AddProduct.aspx");

                    //loginResult_id.Text = "Welcome, admin.";
                }
                else
                {
                    //Response.Redirect("Default");
                    //loginResult_id.Text = "Welcome, user.";
                    //if(HttpContext.Current.Session == null)
                    //{
                    //HttpContext.Current.Session["Order_DetailsId"] = customer.email;
                    Response.Redirect("Customers/MainPage.aspx");

                    //}
                }
            }
            else
            {
                loginResult_id.Text = "Invalid info";
                loginResult_id.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GoToRegisterPage(object sender, EventArgs e)
        {
            Response.Redirect("Inscription.aspx");
        }
    }
}