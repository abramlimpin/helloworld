using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string query = @"SELECT UserID, TypeID FROM Users
                WHERE Email=@Email AND Password=@Password AND Status=@Status";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", Util.CreateSHAHash(txtPassword.Text));
                cmd.Parameters.AddWithValue("@Status", "Active");
                using (SqlDataReader data = cmd.ExecuteReader())
                {
                    if (data.HasRows) // credentials are correct
                    {
                        while (data.Read())
                        {
                            Session["userid"] = data["UserID"].ToString();
                            Session["typeid"] = data["TypeID"].ToString();
                        }
                        Response.Redirect("Default.aspx");
                    }
                    else // did not match </3
                    {
                        error.Visible = true;
                    }
                }
            }
        }
    }
}