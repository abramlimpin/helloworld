using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports_Suppliers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        ReportDocument report = new ReportDocument();
        report.Load(Server.MapPath("~/admin/reports/rptSuppliers.rpt"));
        report.SetDatabaseLogon("sa", "benilde", "(local)", "limpinaj");
        report.SetParameterValue("User", "Abram John Limpin");

        report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, 
            Response, true, "Supplier Report");

    }
}