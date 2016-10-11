using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_Students_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string query = @"INSERT INTO Students VALUES (@StudentNo, @LastName,
                @FirstName, @Course, @Email, @DateAdded)";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@StudentNo", txtStudentNo.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
                cmd.Parameters.AddWithValue("@Course", txtCourse.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                cmd.ExecuteNonQuery();
                Response.Redirect("Default.aspx");
            }
        }
    }
}