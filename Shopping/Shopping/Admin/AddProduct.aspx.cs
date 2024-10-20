using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        ProductService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtprocategory.Items.Clear();
                service = new ProductService();
                DataTable dt = service.setCategoryData().Tables[0];

                HashSet<string> addedCategories = new HashSet<string>(); // To store added categories

                foreach (DataRow row in dt.Rows)
                {
                    string category = row[1].ToString(); // Assuming category name is in column index 1

                    // Add category to dropdown only if it's not already added
                    if (!addedCategories.Contains(category))
                    {
                        txtprocategory.Items.Add(category);
                        addedCategories.Add(category); // Add category to the HashSet
                    }
                }
            }
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            string imageData="";
            string extension = Path.GetExtension(txtproimage.FileName);
            if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
            {
                imageData = "../assets/img/product/" + txtproimage.FileName;
                txtproimage.SaveAs(Server.MapPath(imageData));

                service = new ProductService();
                string pname, pcategory, pprice, pdetail, pdescription, pstock;

                pname = txtproname.Text;
                pcategory = txtprocategory.SelectedValue;
                pprice = txtproprice.Text;
                pdetail = txtprodetail.Text;
                pdescription = txtprodescription.Text;
                pstock = txtprostock.Text;
                service.addProduct(imageData, pname, pcategory, pprice, pdetail, pdescription, pstock);
            }
        }
    }
}