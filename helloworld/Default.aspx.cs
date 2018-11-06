using System;

namespace helloworld
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Write("<script>alert('用户未登录');location.href='login.aspx'</script>");
            }
            Label1.Text = "当前学生在线人数："+Application["student_count"]+"人 ， 当前教师在线人数："
                +Application["teacher_count"]+"人 ， 管理员在线人数"+Application["admin_count"]+"人";
        }
    }
}