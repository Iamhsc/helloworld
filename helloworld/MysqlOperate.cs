using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace helloworld
{
    public class MysqlOperate
    {
        public static string strconn = "Charset=utf8;server=112.74.32.136;user id='imhsc';password='imhsc';database=helloworld";
        public static MySqlCommand cmd;
        public static MySqlDataReader dr;
        /// <summary>
        ///  读取数据
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>返回dr</returns>
        public static MySqlDataReader select(String sql)
        {
            MySqlConnection conn = new MySqlConnection(strconn);
            conn.Open();
            cmd = new MySqlCommand(sql, conn);
            dr = cmd.ExecuteReader();
            return dr;
        }
        /// <summary>
        /// 读写数据，
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns></returns>
        public static DataSet getDate(string sql)
        {
            MySqlConnection conn = new MySqlConnection(strconn);
            conn.Open();
            MySqlDataAdapter adp = new MySqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        /// <summary>
        /// 写入、更新数据
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>count>0插入数据成功</returns>
        public static int ExecuteSQL(String sql)
        {
            MySqlConnection conn = new MySqlConnection(strconn);
            conn.Open();
            cmd = new MySqlCommand(sql, conn);
            int count = cmd.ExecuteNonQuery();
            return count;
        }
    }
}