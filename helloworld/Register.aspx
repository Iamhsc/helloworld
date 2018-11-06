<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="helloworld.Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Style/register.css" rel="stylesheet" />
    <title>注册</title>
    <script>
        var isShow = false;
        function showCalendar() {
            console.log('show方法', isShow);
            var calender = document.getElementById('bor_cale');
            if (!isShow) {
                calender.style.display = 'block';
                isShow = true;
            } else {
                calender.style.display = 'none';
                isShow = false;
            }
        }
        function hiddenCalendar() {
            console.log('hindden方法', isShow);
            if (isShow) {
                document.getElementById('bor_cale').style.display = 'none';
                isShow = false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="register" onclick="hiddenCalendar()">
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Text="* 用户名" CssClass="label" Width="100px"></asp:Label>
                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                    <asp:Button ID="Button3" runat="server" Text="检测" OnClick="Button3_Click" CausesValidation="False" />
                    <asp:Label ID="checkuser" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不能为空" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <asp:Label ID="Label2" runat="server" Text="电话" CssClass="label" Width="100px"></asp:Label>
            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="phone" ValidationExpression="^1[3|4|5|7|8][0-9]{9}$" ForeColor="Red" ErrorMessage="手机号格式错误"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="E-mail" CssClass="label" Width="100px"></asp:Label>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" ErrorMessage="邮箱格式错误" ForeColor="Red" ValidationExpression="^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="联系地址" CssClass="label" Width="100px"></asp:Label>
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="城市" CssClass="label" Width="100px"></asp:Label>
            <asp:DropDownList ID="city" runat="server">
                <asp:ListItem>请选择城市</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label6" runat="server" Text="生日" CssClass="label" Width="100px"></asp:Label>
                    <asp:TextBox ID="birthday" onclick="showCalendar();event.cancelBubble = true" runat="server"></asp:TextBox>
                    <div id="bor_cale">
                        <asp:Calendar ID="calendar" runat="server" CssClass="bor-calendar" OnSelectionChanged="calendar_SelectionChanged"></asp:Calendar>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <asp:Label ID="Label7" runat="server" Text="性别" CssClass="label" Width="100px"></asp:Label>
            <asp:RadioButtonList ID="sex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem>保密</asp:ListItem>
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="* 密码" CssClass="label" Width="100px"></asp:Label>
            <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码不能为空" ControlToValidate="pwd" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="*确认密码" CssClass="label" Width="100px"></asp:Label>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致" ControlToValidate="pwd" ControlToCompare="password" ForeColor="Red"></asp:CompareValidator>
            <br />
            <br />
            <div class="btn">
                <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click1" />
                <asp:Button ID="Button2" runat="server" Text="重填" OnClick="Button2_Click" CausesValidation="False" />
            </div>
        </div>
    </form>
</body>
</html>