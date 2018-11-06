<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="helloworld.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>首页</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <div style="float: right">
            <%if (Session["user_id"] == null) { Response.Write("<a href='Login.aspx'>登录</a>"); } %>
            <a href="Register.aspx">注册</a>
        </div>
        <asp:ListBox ID="userlist" runat="server" Height="150px" Width="120px"></asp:ListBox>
        <asp:ListBox ID="msglist" runat="server" Height="150px" Width="350px"></asp:ListBox>
        <br />
        <br />
        <div style="margin-left:230px;">
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>所有人</asp:ListItem>
            </asp:DropDownList>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="发送" OnClick="Button1_Click" /></div>
    </form>
</body>
</html>
