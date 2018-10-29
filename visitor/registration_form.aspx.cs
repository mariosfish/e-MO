using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void backButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("../login.aspx");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string encrypted = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "SHA1");
                    BLayer myBlayer = new BLayer();
                    User myUser = new User();
                    myUser.username = username.Text;
                    myUser.password = encrypted;
                    myUser.userOnoma = fname.Text;
                    myUser.userRank = rank.Text;
                    myUser.userEponymo = lname.Text;
                    myUser.userMonada = monada.Text;
                    int value = myBlayer.register(myUser);
                    if (value == -1)
                    {
                        error.Text = "Το όνομα χρήστη που εισάγατε χρησιμοποιείται ήδη. Παρακαλώ εισάγετε ένα διαφορετικό.";
                    }
                    else
                    {
                        Response.Redirect("../login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    error.Text = ex.Message.ToString();
                }
            }
        }
    }
}