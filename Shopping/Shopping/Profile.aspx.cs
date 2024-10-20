using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class Profile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = Convert.ToInt32(Session["userId"]);
            DisplayUserProfileImage(userid);
        }

        private void DisplayUserProfileImage(int userid)
        {
            UserServices service = new UserServices();

            byte[] imageData = service.getUserProfileImage(userid);

            if (imageData != null)
            {
                string baseString = Convert.ToBase64String(imageData);
                userprofile.ImageUrl = "data:image/jpeg;base64," + baseString;
            }
        }
    }
}