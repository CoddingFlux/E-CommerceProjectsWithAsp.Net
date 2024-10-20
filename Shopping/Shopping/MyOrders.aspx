<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="Shopping.MyOrders1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <%@ Register Src="~/Include/header.ascx" TagName="Header" TagPrefix="uc" %>
     <uc:Header runat="server" />


             <%@ Register Src="~/Include/footer.ascx" TagName="Footer" TagPrefix="uc" %>
     <uc:Footer runat="server" />

        </div>
    </form>
</body>
</html>
