<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Suppliers.aspx.cs" Inherits="Admin_Reports_Suppliers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="btnGenerate" runat="server"
        text="Generate Report" 
        OnClientClick='return confirm("Are you sure?")'
        OnClick="btnGenerate_Click" />
    </div>
    </form>
</body>
</html>
