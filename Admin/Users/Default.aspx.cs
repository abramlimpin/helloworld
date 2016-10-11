using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Users_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUsers();
        }
    }

    void GetUsers()
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string query = @"SELECT u.UserID, t.UserType, u.Email,
                u.LastName + ', ' + u.FirstName AS FullName,
                u.Street + ', ' + u.Municipality + ', ' + u.City AS Address,
                u.Phone + ' / ' + u.Mobile AS ContactNo, 
                u.Status, u.DateAdded, u.DateModified FROM Users u
                INNER JOIN Types t ON u.TypeID = t.TypeID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Users");
                    lvUsers.DataSource = ds;
                    lvUsers.DataBind();
                    // con.Close()
                }
            }
        }
    }
}