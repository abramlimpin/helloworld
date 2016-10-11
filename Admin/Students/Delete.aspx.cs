using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Students_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] == null)
            Response.Redirect("Default.aspx");
        else
        {
            int studentID = 0;
            bool validStudent = int.TryParse(Request.QueryString["ID"].ToString(), out studentID);

            if (validStudent)
            {
                DeleteRecord(studentID);
            }
            else
                Response.Redirect("Default.aspx");
        }
    }

    void DeleteRecord(int ID)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string query = @"DELETE FROM Students WHERE StudentID=@StudentID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@StudentID", ID);
                cmd.ExecuteNonQuery();
                Response.Redirect("Default.aspx");
            }
        }
    }
}