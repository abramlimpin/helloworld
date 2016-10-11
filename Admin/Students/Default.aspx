<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Students_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Students</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">View Students</h1>
        <div class="col-lg-12">
            <form runat="server" class="form-horizontal">
                <table class="table table-hover">
                    <thead>
                        <th>#</th>
                        <th>Student No.</th>
                        <th>Name</th>
                        <th>Course</th>
                        <th>Email</th>
                        <th>Date Added</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <asp:ListView ID="lvStudents" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("StudentID") %></td>
                                    <td><%# Eval("StudentNo") %></td>
                                    <td><%# Eval("Name") %></td>
                                    <td><%# Eval("Course") %></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                    <td>
                                        <a href='Delete.aspx?ID=<%# Eval("StudentID") %>'
                                            class="btn btn-xs btn-danger" onclick='return confirm("Are you sure?");'>
                                            <i class="fa fa-remove"></i>
                                        </a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="7">
                                        <h2 class="text-center">
                                            No records found!
                                        </h2>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
