using MySql.Data.MySqlClient;
using System;

namespace helloworld
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string usr = username.Text;//用户名
            string sql = "select * from s_user where username='" + usr + "'";
            MySqlDataReader dr = MysqlOperate.select(sql);
            if (dr.Read())//判断用户是否存在
            {
                //比较密码
                bool compare = Sha1.sha1ComparePassword(password.Text, dr["salt"].ToString(), dr["password"].ToString());
                if (!compare)
                {
                    Response.Write("<script>alert('用户名或密码错误');</script>");
                    return;
                }
                //判断权限
                if (dr["user_type"].ToString() != user_type.SelectedIndex + 1 + "")
                {
                    Response.Write("<script>alert('该账户不是" + user_type.SelectedValue + "账户');</script>");
                    return;
                }
                Session["user_id"] = dr["id"].ToString();
                Session["user_name"] = dr["username"].ToString();
                Application.Lock();
                switch (user_type.SelectedIndex)
                {
                    case 0: Application["admin_count"] = Convert.ToInt32(Application["admin_count"]) + 1; break;
                    case 1: Application["teacher_count"] = Convert.ToInt32(Application["teacher_count"]) + 1; break;
                    case 2: Application["student_count"] = Convert.ToInt32(Application["student_count"]) + 1; break;
                }
                Application.UnLock();
                Response.Write("<script>alert('登陆成功');location.href='/';</script>");
            }
            else
            {
                Response.Write("<script>alert('用户不存在');</script>");
            }
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}