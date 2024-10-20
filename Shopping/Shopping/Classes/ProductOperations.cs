using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Shopping.Classes
{
    public class ProductOperations
    {
        UserServices obj;
        SqlConnection con;

        string image;
        public ProductOperations()
        {
            obj = new UserServices();
            con =obj.sqlConnect();
        }

        public DataSet getProductDataSet()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM  Product_Detail",con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet getCategoryDataSet()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM  Main_Category", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}