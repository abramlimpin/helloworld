<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Users_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Users</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">View Users</h1>
        <div class="col-lg-12">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-12">
                        <hr />
                        <table class="table table-hover">
                            <thead>
                                <th>#</th>
                                <th>User Type</th>
                                <th>Email Address</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Contact</th>
                                <th>Status</th>
                                <th>Date Added</th>
                                <th>Date Modified</th>
                                <th>Actions</th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvUsers" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("UserID") %></td>
                                            <td><%# Eval("UserType") %></td>
                                            <td><%# Eval("Email") %></td>
                                            <td><%# Eval("FullName") %></td>
                                            <td><%# Eval("Address") %></td>
                                            <td><%# Eval("ContactNo") %></td>
                                            <td><%# Eval("Status") %></td>
                                            <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                            <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}") %></td>
                                            <td>
                                                <a href='Details.aspx?ID=<%# Eval("UserID") %>'
                                                    class="btn btn-xs btn-info">
                                                    <i class="fa fa-search"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="9">
                                                <h2 class="text-center">No records found!
                                                </h2>
                                            </td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
