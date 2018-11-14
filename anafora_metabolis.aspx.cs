using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            Oplitis myOplitis = myBlayer.get_last_updated_oplitis();
            aa.Text = myOplitis.id.ToString();
            metaboliDate.Text = myOplitis.metaboli.ToString();
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
            isxysMetabolis.Text = myOplitis.isxysDate.ToString();
            Oplitis otherOplitis = new Oplitis();
            otherOplitis.id = Convert.ToInt32(aa.Text);
            SqlDataReader myDtr = myBlayer.get_last_updated_oplitis_dik(otherOplitis);
            BulletedListDikaiologitika.DataSource = myDtr;
            BulletedListDikaiologitika.DataBind();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("metaboli_opliti.aspx");
        }
    }
}