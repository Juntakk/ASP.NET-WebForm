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

        protected void Connection_Click(object sender, EventArgs e)
        {

            string email = email_id.Text;
            string password = password_id.Text;

            ProjetEntities project_context = new ProjetEntities();
            Customer customer =
            project_context.Customer.Where(person => person.email.Equals(email) && person.password.Equals(password)).FirstOrDefault();
            if (customer != null)
            {
                if(customer.is_Admin != 0)
                {
                    Response.Redirect("~/Admin/AddProduct.aspx");
                }
                else
                {
                    Response.Redirect("~/Customers/MainPage.aspx");
                }
            }
            
        }

        protected void GoToRegisterPage(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Register.aspx");
        }
    }
}