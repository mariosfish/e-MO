using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            SqlDataReader myDtr = myBlayer.get_dikaiologitika_pou_exei_proskomisei();
            BulletedList1.DataSource = myDtr;
            BulletedList1.DataBind();
            Oplitis myOplitis = myBlayer.get_Last_Inserted_Oplitis();
            insertDate.Text = myOplitis.eggrafi.ToString();
            asm.Text = myOplitis.asm.ToString();
            rank.Text = myOplitis.bathmos.ToString();
            fname.Text = myOplitis.onoma.ToString();
            lname.Text = myOplitis.eponymo.ToString();
            loxos.Text = myOplitis.loxos.ToString();
            LabelKatigoria.Text = myOplitis.katigoria.ToString();
            paratiriseis.Text = myOplitis.paratiriseis.ToString();
            katalogisteo.Text = myOplitis.katalogisteo.ToString();
            kratiseis.Text = myOplitis.kratiseis.ToString();
            pliroteo.Text = myOplitis.pliroteo.ToString();
            dx.Text = myOplitis.dXmas.ToString();
            dp.Text = myOplitis.dPasxa.ToString();
            fdm.Text = myOplitis.fdmDate.ToString();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("prosthiki_opliti.aspx");
        }
    }
}