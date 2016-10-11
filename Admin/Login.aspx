<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admnistrator Login</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">Administrator Login Sample</h1>
        <div class="col-lg-offset-3 col-lg-6">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div id="error" runat="server" class="alert alert-danger" visible="false">
                        Invalid email or password.
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
                        <div class="col-lg-offset-4 col-lg-8">
                            <asp:Button ID="btnLogin" runat="server" Text="Login"
                                class="btn btn-success pull-right" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
