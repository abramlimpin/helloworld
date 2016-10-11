<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Suppliers_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Suppliers</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">View Suppliers</h1>
        <div class="col-lg-12">
            <div class="well">
                <form runat="server" class="form-horizontal">
                    <asp:Panel ID="pnlSuppliers" runat="server"
                        DefaultButton="btnSearch">
                         <div class="col-lg-4 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="txtKeyword" runat="server"
                                class="form-control" placeholder="Keyword..." />
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btnSearch" runat="server"
                                    class="btn btn-info" OnClick="btnSearch_Click">
                                    <i class="fa fa-search"></i>
                                </asp:LinkButton>
                            </span>
                        </div>
                    </div>
                    <div class="row"></div>
                    <br />
                    <table class="table table-hover">
                        <thead>
                            <th>#</th>
                            <th>Company Name</th>
                            <th>Contact Person</th>
                            <th>Address</th>
                            <th>Contact Numbers</th>
                            <th>Status</th>
                            <th>Date Added</th>
                            <th>Date Modified</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvSuppliers" runat="server"
                                 OnPagePropertiesChanging="lvSuppliers_PagePropertiesChanging">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("SupplierID") %></td>
                                        <td><%# Eval("CompanyName") %></td>
                                        <td><%# Eval("ContactPerson") %></td>
                                        <td><%# Eval("Address") %></td>
                                        <td><%# Eval("Phone") %> / <%# Eval("Mobile") %></td>
                                        <td><%# Eval("Status") %></td>
                                        <td><%# Eval("DateAdded", "{0: MMMM dd, yyyy}") %></td>
                                        <td><%# Eval("DateModified", "{0: MMMM dd, yyyy}") %></td>
                                        <td>
                                            <a href='Details.aspx?ID=<%# Eval("SupplierID") %>'
                                                class="btn btn-xs btn-success">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href='Delete.aspx?ID=<%# Eval("SupplierID") %>'
                                                class="btn btn-xs btn-danger"
                                                onclick='return confirm("Are you sure?");'>
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <tr>
                                        <td colspan="8">
                                            <h2 class="text-center">
                                                No records found!
                                            </h2>
                                        </td>
                                    </tr>
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                    <hr/>
                    <asp:DataPager ID="dpSuppliers" runat="server" PageSize="5"
                        PagedControlID="lvSuppliers">
                        <Fields>
                            <asp:NumericPagerField ButtonType="Button"
                                CurrentPageLabelCssClass="btn btn-info"
                                NumericButtonCssClass="btn"
                                NextPreviousButtonCssClass="btn" />
                        </Fields>
                    </asp:DataPager>
                    </asp:Panel>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
