using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        List<Katigoria> category = new List<Katigoria>();
        List<Dikaiologitika> fd = new List<Dikaiologitika>();
        protected void Page_Load(object sender, EventArgs e)
        {
            errorMessage.Visible = false;

            if (!Page.IsPostBack)
            {
                BLayer myBlayer = new BLayer();
                DateTime mydatetime = new DateTime();
                mydatetime = DateTime.Now;
                metaboliDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
                isxysKatigorias.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();

                SqlDataReader myDtr = myBlayer.get_Rank();
                DropDownListRank.DataSource = myDtr;
                DropDownListRank.DataBind();

                SqlDataReader myDtr2 = myBlayer.get_Dikaiologitika();
                Dik_Dropdownlist.DataSource = myDtr2;
                Dik_Dropdownlist.DataBind();

                SqlDataReader myDtr4 = myBlayer.get_Oplitis();
                GridViewOplitis.DataSource = myDtr4;
                GridViewOplitis.DataBind();
            }
        }

        protected void GridViewOplitis_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "Select")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                string rankVal = GridViewOplitis.Rows[row].Cells[1].Text;
                oplitisid.Text = GridViewOplitis.DataKeys[row].Values["op_id"].ToString();
                asm.Text = GridViewOplitis.DataKeys[row].Values["op_asm"].ToString();//GridViewOplitis.Rows[row].Cells[4].Text;
                fname.Text = GridViewOplitis.Rows[row].Cells[3].Text;
                lname.Text = GridViewOplitis.DataKeys[row].Values["op_eponymo"].ToString();//GridViewOplitis.Rows[row].Cells[2].Text;
                loxos.Text = GridViewOplitis.Rows[row].Cells[5].Text;
                currentKatigoria.Text = GridViewOplitis.Rows[row].Cells[6].Text;
                if (GridViewOplitis.Rows[row].Cells[8].Text == "&nbsp;")
                {
                    paratiriseis.Text = string.Empty;
                }
                else
                {
                    paratiriseis.Text = GridViewOplitis.Rows[row].Cells[8].Text;
                }
                DropDownListRank.ClearSelection(); //thelo otan epilego ton opliti na pairnei ton bathmo pou exei to dropdownlist 
                DropDownListRank.Items.FindByText(rankVal).Selected = true;
            }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Oplitis myOplitis = new Oplitis();
                BLayer myBlayer = new BLayer();
                myOplitis.id = Convert.ToInt32(oplitisid.Text);
                myOplitis.metaboli = Convert.ToDateTime(metaboliDate.Text);
                myOplitis.asm = Int32.Parse(asm.Text);
                myOplitis.onoma = fname.Text;
                myOplitis.eponymo = lname.Text;
                myOplitis.loxos = loxos.Text;
                myOplitis.bathmos = DropDownListRank.SelectedItem.ToString();
                myOplitis.paratiriseis = paratiriseis.Text;
                myOplitis.isxysDate = Convert.ToDateTime(isxysKatigorias.Text);
                if (string.IsNullOrEmpty(newKatigoria.Text))
                {
                    myOplitis.katigoria = currentKatigoria.Text;
                }
                else
                {
                    myOplitis.katigoria = newKatigoria.Text;

                }
                myBlayer.updateOplitis(myOplitis);
                Response.Redirect("anafora_metabolis.aspx");
            }
            catch (Exception ex)
            {
                errorMessage.Visible = true;
                errorMessage.Text = ex.Message.ToString();
            }
        }

        protected void addDik_Click(object sender, EventArgs e)
        {
            string dikaiologitiko = Dik_Dropdownlist.SelectedItem.Text;
            string dik_value = Dik_Dropdownlist.SelectedValue;
            DikaiologitikaListBox.Items.Add(new ListItem(dikaiologitiko, dik_value));
        }

        protected void removeDik_Click(object sender, EventArgs e)
        {
            DikaiologitikaListBox.Items.Remove(DikaiologitikaListBox.SelectedItem);
            newKatigoria.Text = string.Empty;
            katalogisteo.Text = string.Empty;
            kratiseis.Text = string.Empty;
            pliroteo.Text = string.Empty;
            dx.Text = string.Empty;
            dp.Text = string.Empty;
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
                newKatigoria.Text = myKatigoria.katPerigrafi.ToString();
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

        protected void search_Click(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            SqlDataReader myDtr4 = myBlayer.get_Oplitis();
            GridViewOplitis.DataSource = myDtr4;
            GridViewOplitis.DataBind();
        }

        protected void GridViewOplitis_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Text = Regex.Replace(e.Row.Cells[2].Text, lnameSearch.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);

                e.Row.Cells[4].Text = Regex.Replace(e.Row.Cells[4].Text, asma.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}