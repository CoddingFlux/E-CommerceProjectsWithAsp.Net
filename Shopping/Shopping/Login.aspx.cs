using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
   
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        UserServices service;
        SqlCommand cmd;
        protected void Button1_Click(object sender, EventArgs e)
        {
            service = new UserServices();
            string emailid = txtemail.Text.Trim();
            string md5pass = service.GetMD5Hash(txtpassword.Text.Trim());
            if (service.validateUser(emailid, md5pass))
            {
                string userroll = "0";
                string usname = service.userName(emailid, md5pass, userroll);
                Session["userid"] = service.userId(emailid, md5pass, userroll);
                Session["username"] = usname;
                Session["useremail"] = txtemail.Text;
                Response.Write("<script>alert('Login Success!');</script>");
                Response.Redirect("Home.aspx");
            }
            else if (service.validateAdmin(emailid, md5pass))
            {
                string userroll = "1";
                string usname = service.userName(emailid, md5pass, userroll);
                Session["adminid"] = service.userId(emailid, md5pass, userroll);
                Session["adminname"] = usname;
                Session["adminemail"] = txtemail.Text;

                Response.Redirect("Admin/index.aspx");
            }
            else {
                Response.Redirect("Login.aspx");
            }
        }
    }
}