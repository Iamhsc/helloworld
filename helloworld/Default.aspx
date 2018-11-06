<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="helloworld.Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
</head>
<body>
    <form id="form1" runat="server">
    <%if (Session["user_id"] == null) { Response.Write("<a href='Login.aspx'>登录</a>");} %>
    <a href="Register.aspx">注册</a>&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
