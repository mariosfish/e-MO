using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.pdf.parser;
using System.Globalization;
using iTextSharp.text.pdf;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BLayer myBlayer = new BLayer();
                Pliromi otherPliromi = new Pliromi();
                otherPliromi.PliromiId = Convert.ToInt32(Request.QueryString["id"]);
                Pliromi myPliromi = new Pliromi();
                myPliromi = myBlayer.get_Pliromi_By_Id(otherPliromi);
                Oplitis myOplitis = new Oplitis();
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

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("./pliromi_opliti.aspx");
        }

        protected void ButtonApodeixi_Click(object sender, EventArgs e)
        {
            Document pdf = new Document(PageSize.A4, 36, 72, 108, 180);
            PdfWriter writer = PdfWriter.GetInstance(pdf, new FileStream("C:\\Users\\DeusExMachina\\Documents\\Visual Studio 2013\\Projects\\Web_Misthodosia_Opliton\\Web_Misthodosia_Opliton\\" + rank.Text + lname.Text + "_" + fname.Text + "_" + "AA_" + aaPliromis.Text + ".pdf", FileMode.Create));
            pdf.Open();
            Paragraph p = new Paragraph("Απόδειξη Πληρωμής Οπλίτη/n");
            pdf.Add(p);          
            Paragraph p1 = new Paragraph("A/A Πληρωμής:"+aaPliromis.Text);
            pdf.Add(p1);
            Paragraph p2 = new Paragraph("/nΟ κάτωθι υπογεγραμμένος οπλίτης "+ rank.Text +" "+lname.Text + " " + fname.Text +"/n με ΑΣΜ: "+asm.Text+" μισθοδοτήθηκε με "+payType.Text+ "/n την "+ payDate+".");
            pdf.Add(p2);
            PdfPTable t = new PdfPTable(3);
            t.AddCell("-O-");
            t.AddCell("      ");
            t.AddCell("-O-");
            t.AddCell("Αξκός Μισθοδοσίας");
            t.AddCell("      ");
            t.AddCell("Μισθοδοτούμενος");
            pdf.Add(t);
            pdf.Close();
        }
    }
}