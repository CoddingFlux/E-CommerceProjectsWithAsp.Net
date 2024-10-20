using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class Register : System.Web.UI.Page
    {
        UserServices service;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                service = new UserServices();
                
                if (txtimage.HasFile)
                {
                    byte[] imageData = txtimage.FileBytes;
                    string imageName = Path.GetFileName(txtimage.FileName);
                    string md5pass = service.GetMD5Hash(txtpassword.Text.Trim());

                    cmd = new SqlCommand("insert into User_Info_tbl(User_Image_Data,User_Image_Name,User_Name,User_Email,User_Password)values(@imgdata,@imgname,@uname,@email,@password)", service.sqlConnect());
                    cmd.Parameters.Add("imgdata",imageData);
                    cmd.Parameters.Add("imgname",imageName);
                    cmd.Parameters.Add("uname", txtname.Text);
                    cmd.Parameters.Add("email", txtemail.Text);

                    cmd.Parameters.Add("password",md5pass);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("home.aspx");
                }
            }
            catch (Exception exe)
            {
                Response.Write(exe);
            }
         
        }
    }
}