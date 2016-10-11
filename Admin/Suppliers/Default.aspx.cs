using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Admin_Suppliers_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSuppliers();
        }
    }

    /// <summary>
    /// Allows the user to display list of suppliers from
    /// a listview control.
    /// 
    /// Write something here.
    /// </summary>
    void GetSuppliers()
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT SupplierID, CompanyName, ContactPerson,
                Address, Phone, Mobile, Status, DateAdded, DateModified
                FROM Suppliers";
            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Suppliers");

                    lvSuppliers.DataSource = ds;
                    lvSuppliers.DataBind();
                }
            }
        }
    }

    /// <summary>
    /// Allows the user to display list of suppliers
    /// to a listview based from a keyword
    /// </summary>
    /// <param name="keyword">Any keyword</param>
    void GetSuppliers(string keyword)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT SupplierID, CompanyName, ContactPerson,
                Address, Phone, Mobile, Status, DateAdded, DateModified
                FROM Suppliers WHERE 
                SupplierID LIKE @keyword OR
                CompanyName LIKE @keyword OR
                ContactPerson LIKE @keyword OR
                Address LIKE @keyword OR
                Phone LIKE @keyword OR
                Mobile LIKE @keyword";
            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Suppliers");

                    lvSuppliers.DataSource = ds;
                    lvSuppliers.DataBind();
                }
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtKeyword.Text == "")
        {
            GetSuppliers();
        }
        else
        {
            GetSuppliers(txtKeyword.Text);
        }
    }

    protected void lvSuppliers_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpSuppliers.SetPageProperties(e.StartRowIndex,
            e.MaximumRows, false);
        if (txtKeyword.Text == "")
        {
            GetSuppliers();
        }
        else
        {
            GetSuppliers(txtKeyword.Text);
        }
    }
}