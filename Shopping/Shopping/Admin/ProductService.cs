using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;
using System.Collections;

namespace Shopping.Admin
{

    public class ProductService
    {
        string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter ada;
        SqlConnection con;
        SqlDataReader reader;
        DataSet ds;

        public ProductService()
        {
            con = new SqlConnection(conString);
            con.Open();
        }
        public ArrayList filldropdown()
        {
            string query = "select Category_Name from Main_Category";
            cmd = new SqlCommand(query,con);
            reader = cmd.ExecuteReader();
            ArrayList list = new ArrayList();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    string categoryname = reader["Category_Name"].ToString();
                    list.Add(categoryname);
                }
                }

            return list;
            
        }

        public void addProduct(string imageData, string pname, string pcategory, string pprice, string pdetail, string pdescription, string pstock)
        {

            string query = "insert into Product_Detail(Product_Image,Product_Name,Product_Category,Product_Price,Product_Detail,Product_Description,Product_Stock)values(@pimg,@pname,@pcategory,@pprice,@pdetail,@pdescription,@pstock)";
            cmd = new SqlCommand(query,con);



            cmd.Parameters.AddWithValue("pimg", imageData);
            cmd.Parameters.AddWithValue("pname", pname);
            cmd.Parameters.AddWithValue("pcategory", pcategory);
            cmd.Parameters.AddWithValue("pprice", pprice);
            cmd.Parameters.AddWithValue("pdetail", pdetail);
            cmd.Parameters.AddWithValue("pdescription", pdescription);
            cmd.Parameters.AddWithValue("pstock", pstock);
            cmd.ExecuteNonQuery();
        }



        //public SqlConnection getCon()
        //{
        //    con = new SqlConnection(conString);
        //    con.Open();
        //    return con;
        //}

        public void addCategory(string category_name,string imageName)
        {

            //string query = "insert into Main_Category(Category_Name,Category_Image)values(@cname,@cimage)";

            string query2 = $"insert into Main_Category(Category_Name,Category_Image)values('{category_name}','{imageName}')";

            cmd = new SqlCommand(query2,con);
            cmd.ExecuteNonQuery();
        }

        public DataSet setCategoryData()
        {
            ada = new SqlDataAdapter("select * from Main_Category", con);
            ds = new DataSet();
            ada.Fill(ds);
            return ds;
        }


          
    }
}