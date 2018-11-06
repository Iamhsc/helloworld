using MySql.Data.MySqlClient;
using System;

namespace helloworld
{
    public partial class Register : System.Web.UI.Page
    {
        private string[] c = { "北京", "上海", "广州", "深圳" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foreach (string item in c)
                {
                    city.Items.Add(item);
                }
            }
        }

        /// <summary>
        /// 提交
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (checkUser())
            {
                checkuser.Text = "用户名已存在";
                checkuser.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string uname = username.Text;
            long nowTime = common.GetTimeStamp();//当前时间戳
            string rand = Sha1.random_string();//随机字符串
            string pwd = Sha1.sha1_pwd(password.Text, rand);//加密密码
            string sql = "INSERT INTO `s_user` (user_type,sex,birthday,create_time,username,password,salt,email,mobile) VALUES (3," + sex.SelectedIndex + ",'" + birthday.Text + "'," + nowTime + ",'" + uname + "','" + pwd + "','" + rand + "','" + email.Text + "','" + phone.Text + "');";
            int count = MysqlOperate.ExecuteSQL(sql);
            if (count > 0)
            {
                Response.Write("<script>alert('注册成功');location.href='login.aspx';</script>");
            }
            else
            {
                Response.Write("注册失败");
            }
        }

        /// <summary>
        /// 检测用户是否存在
        /// </summary>
        /// <returns>boot true或false</returns>
        public bool checkUser()
        {
            string usr = username.Text;
            string sql = "select * from s_user where username='" + usr + "'";
            MySqlDataReader dr = MysqlOperate.select(sql);
            return dr.Read();
        }



        /// <summary>
        /// 重填
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            username.Text = "";
            phone.Text = "";
            email.Text = "";
            address.Text = "";
            city.SelectedIndex = 0;
            birthday.Text = "";
            sex.SelectedIndex = 0;
            pwd.Text = "";
            password.Text = "";
        }

        /// <summary>
        /// 检测是否可用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            checkuser.ForeColor = System.Drawing.Color.Red;
            if (username.Text == "")
            {
                checkuser.Text = "不能为空";
                return;
            }
            if (checkUser())
            {
                checkuser.Text = "不可用";
            }
            else
            {
                checkuser.Text = "可用";
                checkuser.ForeColor = System.Drawing.Color.Green;
            }
        }

        /// <summary>
        /// 选择日期
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            birthday.Text = calendar.SelectedDate.ToString("d");
        }
    }
}