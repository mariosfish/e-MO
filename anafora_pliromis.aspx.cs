using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BLayer myBlayer = new BLayer();
                Pliromi myPliromi = new Pliromi();
                Oplitis myOplitis = new Oplitis();
                myPliromi = myBlayer.get_Last_Pliromi();
                aaPliromis.Text = myPliromi.PliromiId.ToString();
                priromiDate.Text = myPliromi.PayDay.ToString();
                payDate.Text = myPliromi.PayDay.ToString();
                asm.Text = myPliromi.p_opasm.ToString();
                rank.Text = myPliromi.bathmos.ToString();
                fname.Text = myPliromi.onoma.ToString();
                lname.Text = myPliromi.eponymo.ToString();
                loxos.Text = myPliromi.loxos.ToString();
                katigoria.Text = myPliromi.katName.ToString();
                katalogisteo.Text = myPliromi.katalogisteo.ToString();
                kratiseis.Text = myPliromi.kratiseis.ToString();
                pliroteo.Text = myPliromi.pliroteo.ToString();
                payType.Text = myPliromi.mPerigrafi.ToString();
                opid.Text = myPliromi.Pliromi_opid.ToString();
                posoPliromis.Text = myPliromi.Poso.ToString();
                myOplitis.id = Convert.ToInt32(opid.Text);
                SqlDataReader myDtr = myBlayer.get_dikaiologitika_pou_exei_proskomisei_by_id(myOplitis);
                dikaiologitika.DataSource = myDtr;
                dikaiologitika.DataBind();
            }

        }

        protected void ButtonApodeixi_Click(object sender, EventArgs e)
        {
            Document pdf = new Document(iTextSharp.text.PageSize.A4, 10, 10, 10, 10);
            PdfWriter wri = PdfWriter.GetInstance(pdf, new FileStream(rank.Text + "_" + lname.Text + "_" + fname.Text + "_" + aaPliromis.Text+".pdf", FileMode.Create));
            pdf.Open();
            Paragraph p = new Paragraph("testing");
            pdf.Add(p);
            pdf.Close();
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("pliromi_opliti.aspx");
        }
    }
}