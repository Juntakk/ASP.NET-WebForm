using Projet_AppTrans.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projet_AppTrans
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddCategory_click(object sender, EventArgs e)
        {
            ProjetEntities project_context = new ProjetEntities();  
            int already_exists = project_context.Category.Where(c => c.name == categoryName.Text).Count();

            if (already_exists > 0)
            {
                Label1.Text = categoryName.Text + " already exists";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ProjetSQL"].ToString();
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "Insert into [Category](name)" + "values(@name)";

                string name = categoryName.Text;

                cmd.Parameters.AddWithValue("@name", name);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    Label1.Text = "Category added successfully";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "Mistake";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
                Response.Redirect(Request.Url.ToString());

            }
        }
    }
}