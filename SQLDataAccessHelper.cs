using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Inductotherm_Assignment
{
    public class SQLDataAccessHelper
    {

        public static SqlConnection GetSqlConnection()
        {
            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            var conn = new SqlConnection(connStr);
            conn.Open();
            return conn;
        }

        public DataTable ExecuteQuery(string commandText)
        {
            using (var conn = SQLDataAccessHelper.GetSqlConnection())
            {
                using(SqlCommand cmd = new SqlCommand(commandText,conn))
                {
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    conn.Close();
                    return dt;
                }
            }
        }

        public int ExecuteNonQuery(string commandText)
        {
            using(var conn = SQLDataAccessHelper.GetSqlConnection())
            {
                using(SqlCommand cmd = new SqlCommand(commandText,conn))
                {
                    int affectedRows = cmd.ExecuteNonQuery();
                    conn.Close();
                    return affectedRows;
                }
            }
        }

    }
}