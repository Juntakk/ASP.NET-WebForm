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

namespace Projet_AppTrans.Admin
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_user_Click(object sender, EventArgs e)
        {
            ProjetEntities context = new ProjetEntities();

            int already_exists = context.Customer.Where(c => c.email == user_email.Text).Count();
            if (already_exists > 0)
            {
                user_confirmation.Text = "Email already being used.";
                user_confirmation.CssClass = "confirmation";
            }

            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into [Customer](name, email, password, is_Admin)" + "values(@name, @email, @password, 0)";

                string name = user_name.Text;
                string email = user_email.Text;
                string password = user_password.Text;

                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue ("@email", email);
                cmd.Parameters.AddWithValue("@password", password);

                cmd.ExecuteNonQuery();

     
                user_confirmation.Text = "User added successfully";
                user_confirmation.CssClass = "confirmation";
                con.Close();

                user_email.Text = "";
                user_name.Text = "";
                user_password.Text = "";
            }

        }
    }
}