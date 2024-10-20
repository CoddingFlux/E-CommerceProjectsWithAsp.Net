using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace Shopping
{

    public class UserServices
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;

        public  SqlConnection sqlConnect()
        {
            con = new SqlConnection(conString);
            con.Open();
            return con;
        }

        public bool validateUser(string username, string password)
        {
            try
            {
                string select = "select count(*) from User_Info_tbl where User_Email=@email and User_Password=@password and User_Roll=@uroll";
                string rollId = "0";
                cmd = new SqlCommand(select, sqlConnect());
                cmd.Parameters.Add("email", username);
                cmd.Parameters.Add("password", password);
                cmd.Parameters.Add("uroll", rollId);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            catch (Exception exe)
            {
                Console.WriteLine(exe);
                return false;
            }
        }

        public bool validateAdmin(string username, string password)
        {
            try
            {
                string select = "select count(*) from User_Info_tbl where User_Email=@email and User_Password=@password and User_Roll=@uroll";
                string rollId = "1";
                cmd = new SqlCommand(select, sqlConnect());
                cmd.Parameters.Add("email", username);
                cmd.Parameters.Add("password", password);
                cmd.Parameters.Add("uroll", rollId);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            catch (Exception exe)
            {
                Console.WriteLine(exe);
                return false;
            }
        }

        public string userName(string emailid, string password,string userroll)
        {
            try
            {
                string selectId = "select User_Name from User_Info_tbl where User_Email=@email and User_Password=@password and User_Roll=@uroll";
                cmd = new SqlCommand(selectId, sqlConnect());
                cmd.Parameters.Add("email", emailid);
                cmd.Parameters.Add("password", password);
                cmd.Parameters.Add("uroll",userroll);
                return (string)cmd.ExecuteScalar();
            }
            catch (Exception exe)
            {
                Console.WriteLine(exe);
                return "";
            }
        }

        public int userId(string username, string password,string userroll)
        {
            try
            {
                string selectId = "select User_Id from User_Info_tbl where User_Email=@email and User_Password=@password  and User_Roll=@uroll";
                cmd = new SqlCommand(selectId, sqlConnect());
                cmd.Parameters.Add("email", username);
                cmd.Parameters.Add("password", password);
                cmd.Parameters.Add("uroll", userroll);
                Console.WriteLine((int)cmd.ExecuteScalar());
                return (int)cmd.ExecuteScalar();
            }
            catch (Exception exe)
            {
                Console.WriteLine(exe);
                return 0;
            }
        }

        //public string userRollId(string username, string password)
        //{
        //    try
        //    {
        //        string selectId = "select User_Roll from User_Info_tbl where User_Email=@email and User_Password=@password";
        //        cmd = new SqlCommand(selectId, sqlConnect());
        //        cmd.Parameters.Add("email", username);
        //        cmd.Parameters.Add("password", password);
        //        Console.WriteLine((string)cmd.ExecuteScalar());
        //        return (string)cmd.ExecuteScalar();
        //    }
        //    catch (Exception exe)
        //    {
        //        Console.WriteLine(exe);
        //        return "";
        //    }
        //}

        public byte[] getUserProfileImage(int userid)
        {

            byte[] imageData = null;
            try
            {
                string query = "select User_Image_Data from User_Info_tbl where User_Id=@uid";
                cmd = new SqlCommand(query, sqlConnect());
                cmd.Parameters.Add("uid", userid);
                imageData = (byte[])cmd.ExecuteScalar(); ;
            }
            catch (Exception exe)
            {
                Console.WriteLine(exe);
            }
            return imageData;
        }

     
            public  string GetMD5Hash(string input)
            {
                using (MD5 md5Hash = MD5.Create())
                {
                    byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

                    StringBuilder builder = new StringBuilder();
                    for (int i = 0; i < data.Length; i++)
                    {
                        builder.Append(data[i].ToString("x2")); // Convert byte to hexadecimal string
                    }
                    return builder.ToString();
                }
            }

        }
    }