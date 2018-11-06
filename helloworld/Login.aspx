<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="helloworld.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Style/login.css" rel="stylesheet" />
    <title>登陆</title>
</head>
<body>
    <div class="login">
        <div class="title">
            <asp:Label ID="Label1" runat="server" CssClass="title" Text="用户登录" Font-Bold="True" Font-Size="15pt"></asp:Label>
        </div>
        <form id="form1" runat="server">
            <asp:Label ID="Label2" runat="server" Text="用户名" CssClass="label" Width="80px"></asp:Label>
            <asp:TextBox ID="username" AutoCompleteType="Disabled" Text="imhsc" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="密码" CssClass="label" Width="79px"></asp:Label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" Text="imhsc"></asp:TextBox>
            <br />
            <br />
            <div>
                <asp:Label ID="Label4" runat="server" Text="级别" CssClass="label" Width="97px"></asp:Label>
                <asp:RadioButtonList ID="user_type" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" Style="">
                    <asp:ListItem>管理员</asp:ListItem>
                    <asp:ListItem>教师</asp:ListItem>
                    <asp:ListItem Selected="True">学生</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <br />
            <br />
            <div class="btn-div">
                <asp:Button ID="btn_login" runat="server" CssClass="button" Text="登陆" OnClick="btn_login_Click" />
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="清空" />
                <asp:Button ID="btn_register" runat="server" CssClass="button" Text="注册"
                    OnClick="btn_register_Click" />
            </div>
        </form>
    </div>
</body>
</html>
