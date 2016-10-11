<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Users_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add a User</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add a User</h1>
        <div class="col-lg-12">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">User Type</label>
                            <div class="col-lg-8">
                                <asp:DropDownList ID="ddlUserTypes" runat="server"
                                    CssClass="form-control" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Email Address</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtEmail" runat="server"
                                    class="form-control" type="email" autocomplete="off"
                                    MaxLength="100" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Password</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtPassword" runat="server"
                                    class="form-control" type="password" autocomplete="off"
                                    MaxLength="20" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">First Name</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtFN" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="80" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Last Name</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtLN" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="80" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label col-lg-4">Street</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtStreet" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="50" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Municipality</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMuni" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="80" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">City</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtCity" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="50" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Phone</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtPhone" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="12" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-4">Mobile</label>
                            <div class="col-lg-8">
                                <asp:TextBox ID="txtMobile" runat="server"
                                    class="form-control" autocomplete="off"
                                    MaxLength="12" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-4 col-lg-8">
                                <asp:Button ID="btnAdd" runat="server"
                                    class="btn btn-success pull-right" 
                                    Text="Add" OnClick="btnAdd_Click" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
