using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {

        ProductService service;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            /*service = new ProductService();
            foreach(string val in service.filldropdown())
            {
                ddtxtcategory.Items.Add(val);
            }*/
            fillGrid();
        }


        protected void AddMain_Click(object sender, EventArgs e)
        {
            string imageData = "";
            string extension = Path.GetExtension(txtimage.FileName);
            if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
            {
                imageData = "../assets/img/category_img/" + txtimage.FileName;
                string imagepath = "assets/img/category_img/" + txtimage.FileName;
                txtimage.SaveAs(Server.MapPath(imageData));

                /*ddtxtcategory.Items.Clear();*/
                service = new ProductService();
                //byte[] imageData = txtimage.FileBytes;
                //string imageName = Path.GetFileName(txtimage.FileName);
                string category_name = txtcategory.Text;
                service.addCategory(category_name, imagepath);
                Response.Redirect("AddCategory.aspx");
            }
        }

        public void fillGrid() {
            service = new ProductService();
            GridView1.DataSource = service.setCategoryData();
            GridView1.DataBind();
        }

/*        protected void AddSub_Click(object sender, EventArgs e)
        {

        }*/
    }
}