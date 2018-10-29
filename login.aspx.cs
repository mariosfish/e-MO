using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Session.RemoveAll();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("visitor/registration_form.aspx");
        }

        protected void login_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string encrypted = FormsAuthentication.HashPasswordForStoringInConfigFile(inputPassword.Text, "SHA1");
                BLayer myBlayer = new BLayer();
                int value = myBlayer.login(inputUsername.Text, encrypted);
                if (value == -1)
                {
                    error.Text = "Το όνομα χρήστη ή/και ο κωδικός είναι λάθος. Παρακαλώ δοκιμάστε ξανά.";
                }
                else if (value == 1) 
                {
                    FormsAuthentication.RedirectFromLoginPage(inputUsername.Text, false);//to true na to kano false gia na zita kodiko kathe fora pou anoigo browser
                    Response.Redirect("~/index.aspx");
                }
            }
        }
    }
}