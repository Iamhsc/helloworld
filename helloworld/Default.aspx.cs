using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace helloworld
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_id"] == null)
                {
                    Response.Write("<script>alert('用户未登录');location.href='login.aspx'</script>");
                    return;
                }
                Label1.Text = "当前在线" + Application["all_count"] + "人:<br>";
                //学生在线人数：" + Application["student_count"] + "人<br>教师在线人数："+ Application["teacher_count"] + "人<br>管理在线人数：" + Application["admin_count"] + "人";
                if (Application["user_list"] != null)
                {
                    string[] ls = Application["user_list"].ToString().Split(',');
                    for (int i = 1; i < ls.Length; i++)
                    {
                        userlist.Items.Add(ls[i]);
                        DropDownList1.Items.Add(ls[i]);
                    }
                }
                if (Application["msg"] != null)
                {
                    string[] msg = Application["msg"].ToString().Split('\t');
                    foreach (var item in msg)
                    {
                         msglist.Items.Add(item);
                    }
                    msglist.Items.Remove("");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string uname = Session["user_name"].ToString();
            string msg = uname + "对" + DropDownList1.SelectedValue + "说" + TextBox1.Text + "\t";
            Application.Lock();
            Application["msg"] += msg;
            Application.UnLock();
            msglist.Items.Add(msg);
        }
    }
}