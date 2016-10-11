<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Suppliers_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Supplier #<asp:Literal ID="ltID" runat="server" /> Details</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">View Supplier #<asp:Literal ID="ltID2" runat="server" /> Details</h1>
        <div class="col-lg-offset-3 col-lg-6">
            <div class="well">
                <form runat="server" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-lg-4">Company Name</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"
                                MaxLength="200" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Contact Person</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"
                                MaxLength="100" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Address</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"
                                MaxLength="300" TextMode="MultiLine" Rows="5" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Phone</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"
                                MaxLength="12" type="number" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-4">Mobile</label>
                        <div class="col-lg-8">
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"
                                MaxLength="12" type="number" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnUpdate" runat="server" 
                                CssClass="btn btn-success btn-lg pull-right"
                                Text="Update" OnClick="btnUpdate_Click" />
                            <a href="Default.aspx" class="btn btn-default btn-lg">
                                Back
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
