using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ADO.NET
using System.Data;
using System.Data.SqlClient;

// EF, ORM

public partial class Admin_Users_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUserTypes();
        }
    }
    /// <summary>
    /// Allows the user to display list of user types
    /// from the table Types to the dropdownlist control
    /// </summary>
    void GetUserTypes()
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT TypeID, UserType FROM Types";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    ddlUserTypes.DataSource = dr;
                    ddlUserTypes.DataTextField = "UserType";
                    ddlUserTypes.DataValueField = "TypeID";
                    ddlUserTypes.DataBind();

                    ddlUserTypes.Items.Insert(0, new ListItem("Select one...", ""));
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"INSERT INTO Users VALUES (@TypeID, @Email,
                @Password, @FirstName, @LastName, @Street, @Municipality,
                @City, @Phone, @Mobile, @Status, @DateAdded, @DateModified)";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@TypeID", ddlUserTypes.SelectedValue);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", Util.CreateSHAHash(txtPassword.Text));
                cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
                cmd.Parameters.AddWithValue("@Street", txtStreet.Text);
                cmd.Parameters.AddWithValue("@Municipality", txtMuni.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Status", "Active");
                cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                cmd.Parameters.AddWithValue("@DateModified", DBNull.Value);
                cmd.ExecuteNonQuery();
                Response.Redirect("Default.aspx");
            }
        }
    }
}