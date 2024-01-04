using Projet_AppTrans;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_AppTrans.Models
{
    public partial class Inscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            //Verify is email not 409
            ProjetEntities project_context = new ProjetEntities();
            int already_exists = project_context.Customer.Where(person => person.email == email_id.Text).Count();
            if(already_exists > 0)
            {
                confirmation.Text = "Email already exists";
                confirmation.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into [Customer](email, password, is_Admin, name)" + "values(@email, @password, @is_Admin, @name)";


                cmd.Parameters.AddWithValue("@email", email_id.Text);
                cmd.Parameters.AddWithValue("@password", password_id.Text);
                cmd.Parameters.AddWithValue("@is_Admin", false);
                cmd.Parameters.AddWithValue("@name", name_id.Text);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Response.Redirect("Login");
                    confirmation.Text = "Registered successfully";
                    confirmation.ForeColor = System.Drawing.Color.Green;
                }
                con.Close();
            }
        }
    }
}