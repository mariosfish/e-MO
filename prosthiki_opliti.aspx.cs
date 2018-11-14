using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Misthodosia_Opliton;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        List<Dikaiologitika> fd = new List<Dikaiologitika>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BLayer myBlayer = new BLayer();
                DateTime mydatetime = new DateTime();
                mydatetime = DateTime.Now;
                insertDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();

                SqlDataReader myDtr = myBlayer.get_Rank();
                DropDownListRank.DataSource = myDtr;
                DropDownListRank.DataBind();

                SqlDataReader myDtr1 = myBlayer.get_Dikaiologitika();
                DikaiologitikaDropdownlist.DataSource = myDtr1;
                DikaiologitikaDropdownlist.DataBind();

                SqlDataReader mydtr2 = myBlayer.get_Katigoria();
                katigoriaFDM.DataSource = mydtr2;
                katigoriaFDM.DataBind();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                BLayer myBlayer = new BLayer();
                Oplitis myOplitis = new Oplitis();
                myOplitis.eggrafi = Convert.ToDateTime(insertDate.Text);
                myOplitis.asm = Int32.Parse(asm.Text);
                myOplitis.onoma = fname.Text;
                myOplitis.eponymo = lname.Text;
                myOplitis.loxos = loxos.Text;
                myOplitis.paratiriseis = paratiriseis.Text;
                myOplitis.bathmos = DropDownListRank.SelectedItem.ToString();
                myOplitis.katigoria = TextboxKatigoria.Text;
                myOplitis.katigoriaFDM = Convert.ToInt32(katigoriaFDM.SelectedValue);
                if (string.IsNullOrEmpty(lastPayDate.Text))
                {
                    DateTime myDT = new DateTime(1 / 1 / 1753);
                    myOplitis.lastPayDay = Convert.ToDateTime(myDT.Day.ToString() + "/" + myDT.Month.ToString() + "/" + myDT.Year.ToString());

                }
                else
                {
                    myOplitis.lastPayDay = Convert.ToDateTime(lastPayDate.Text);
                }
                myBlayer.addOplitis(myOplitis);
                Page.Response.Redirect("anafora_prosthikis.aspx");
            }

            catch (Exception ex)
            {
                errorMessage.Visible = true;
                errorMessage.Text = ex.Message.ToString();
            }
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            asm.Text = String.Empty;
            DropDownListRank.SelectedIndex = 0;
            katigoriaFDM.SelectedIndex = 0;
            DikaiologitikaListBox.Items.Clear();
            fname.Text = String.Empty;
            lname.Text = String.Empty;
            loxos.Text = String.Empty;
            TextboxKatigoria.Text = String.Empty;
            katalogisteo.Text = String.Empty;
            kratiseis.Text = String.Empty;
            pliroteo.Text = String.Empty;
            lastPayDate.Text = String.Empty;
            paratiriseis.Text = String.Empty;
            dx.Text = String.Empty;
            dp.Text = String.Empty;
            foreach (ListItem li in DikaiologitikaDropdownlist.Items)
            {
                li.Selected = false;
            }
        }

        protected void CalculateKatigoria_Click(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            Dikaiologitika fermenaDik = new Dikaiologitika();
            try
            {
                foreach (ListItem li in DikaiologitikaListBox.Items)
                {
                    fermenaDik.id = Convert.ToInt32(li.Value);
                    fd.Add(fermenaDik);
                }

                for (int i = 0; i < fd.Count; i++)
                {
                    fermenaDik = fd[i];
                    myBlayer.add_Fermena_Dikaiologitika(fermenaDik);
                }

                Katigoria myKatigoria = myBlayer.get_Katigoria_From_Dikaiologitika();
                TextboxKatigoria.Text = myKatigoria.katPerigrafi.ToString();
                katalogisteo.Text = myKatigoria.katKatalogisteo.ToString();
                kratiseis.Text = myKatigoria.katKratiseis.ToString();
                pliroteo.Text = myKatigoria.katPliroteo.ToString();
                dx.Text = myKatigoria.katDXmas.ToString();
                dp.Text = myKatigoria.katDPasxa.ToString();
            }
            catch (Exception ex)
            {
                errorMessage.Visible = true;
                errorMessage.Text = ex.Message.ToString();
            }
        }

        protected void addDik_Click(object sender, EventArgs e)
        {
            string dikaiologitiko = DikaiologitikaDropdownlist.SelectedItem.Text;
            string dik_value = DikaiologitikaDropdownlist.SelectedValue;
            DikaiologitikaListBox.Items.Add(new ListItem(dikaiologitiko, dik_value));
        }

        protected void removeDik_Click(object sender, EventArgs e)
        {
            DikaiologitikaListBox.Items.Remove(DikaiologitikaListBox.SelectedItem);
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }
    }
}