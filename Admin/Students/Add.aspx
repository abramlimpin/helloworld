<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Admin_Students_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add a Student</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add a Student</h1>
        <div class="col-lg-offset-3 col-lg-6">
            <form runat="server" class="form-horizontal">
                <div class="well">
                    <div class="form-group">
                        <label class="control-label col-lg-3">Student #</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtStudentNo" runat="server" CssClass="form-control" required />
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-lg-3">Last Name</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtLN" runat="server" CssClass="form-control" required />
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-lg-3">First Name</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtFN" runat="server" CssClass="form-control" required />
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-lg-3">Course</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control" required />
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="control-label col-lg-3">Email Address</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" type="email" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-3 col-lg-9">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
