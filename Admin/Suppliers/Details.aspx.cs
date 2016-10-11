using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// namespaces
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Suppliers_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null) // query string is existing
        {
            int supplierID = 0; // initial value
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(),
                            out supplierID);

            if (validID)
            {
                if (!IsPostBack)
                {
                    GetData(supplierID);
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else // query string is not existing
        {
            Response.Redirect("Default.aspx");
        }
    }

    void GetData(int ID)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT CompanyName, ContactPerson, Address,
                Phone, Mobile FROM Suppliers WHERE SupplierID=@SupplierID";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@SupplierID", ID);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows) // record is existing
                    {
                        while (dr.Read())
                        {
                            ltID.Text = ID.ToString();
                            ltID2.Text = ID.ToString();
                            txtCompany.Text = dr["CompanyName"].ToString();
                            txtContact.Text = dr["ContactPerson"].ToString();
                            txtAddress.Text = dr["Address"].ToString();
                            txtPhone.Text = dr["Phone"].ToString();
                            txtMobile.Text = dr["Mobile"].ToString();
                        }
                    }
                    else // record is not existing
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }

        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"UPDATE Suppliers SET CompanyName=@CompanyName,
                ContactPerson=@ContactPerson, Address=@Address, 
                Phone=@Phone, Mobile=@Mobile, Status=@Status,
                DateModified=@DateModified WHERE SupplierID=@SupplierID";
            // parameterized query

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text);
                cmd.Parameters.AddWithValue("@ContactPerson", txtContact.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Status", "Active");
                cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
                cmd.Parameters.AddWithValue("@SupplierID",
                    Request.QueryString["ID"].ToString());
                
                cmd.ExecuteNonQuery();
                Response.Redirect("Default.aspx");
            }

        }
    }
}