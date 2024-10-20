using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Shopping.Classes;


namespace Shopping
{
    public partial class Shop1 : System.Web.UI.Page
    {
        UserServices obj1;
        SqlConnection con;
        ProductOperations obj;

        protected void Page_Load(object sender, EventArgs e)
        {
            obj = new ProductOperations();
            obj1 = new UserServices ();
            con = obj1.sqlConnect();
            if (!IsPostBack)
                fillData();
        }
        public void fillData()
        {

            DataList1.DataSource = obj.getProductDataSet();
            DataList1.DataBind();
        }
    }
}