using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Oplitis otherOplitis = new Oplitis();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BLayer myBlayer = new BLayer();
                SqlDataReader myDtr = myBlayer.get_Oplitis();
                TotalOplitis.DataSource = myDtr;
                TotalOplitis.DataBind();

                SqlDataReader myDtr1 = myBlayer.get_Misthodosia();
                RadioButtonListMisthodType.DataSource = myDtr1;
                RadioButtonListMisthodType.DataBind();
                error.Visible = false;
                anaforaPliromis.Visible = false;

                //DateTime mydatetime = new DateTime();
                //mydatetime = DateTime.Now;
                //priromiDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
            }
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            try
            {
                BLayer myBlayer = new BLayer();
                Pliromi myPliromi = new Pliromi();
                myPliromi.PayDay = Convert.ToDateTime(priromiDate.Text);
                myPliromi.pmid = Convert.ToInt32(RadioButtonListMisthodType.SelectedValue);// na val0 an o allos den epilexei bathmo na epilegei automata ton bathmo strti
                myPliromi.Poso = Convert.ToDecimal(posoPliromis.Text);
                myPliromi.Paid = Convert.ToBoolean(1);
                myPliromi.Pliromi_opid = Convert.ToInt32(aa.Text);
                myBlayer.add_Pliromi(myPliromi);
                Response.Redirect("anafora_pliromis.aspx");
            }
            catch (Exception ex)
            {
                error.Visible = true;
                error.Text = ex.Message.ToString();
            }
        }
        protected void TotalOplitis_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                BLayer myBlayer = new BLayer();
                int row = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(TotalOplitis.DataKeys[row].Values["op_id"].ToString());
                otherOplitis.id = id;
                aa.Text = id.ToString();
                lastPaymentsPanel.Visible = true;

                SqlDataReader myDtr = myBlayer.get_last_payment(otherOplitis);
                LastPayments.DataSource = myDtr;
                LastPayments.DataBind();

                SqlDataReader myDtr1 = myBlayer.get_last_updated_oplitis_dik(otherOplitis);
                BulletedListDik.DataSource = myDtr1;
                BulletedListDik.DataBind();

                Katigoria myKatigoria = new Katigoria();
                myKatigoria = myBlayer.get_Katigoria_By_Id(otherOplitis);
                katigoria.Text = myKatigoria.katPerigrafi.ToString();
                katalogisteo.Text = myKatigoria.katKatalogisteo.ToString();
                kratiseis.Text = myKatigoria.katKratiseis.ToString();
                pliroteo.Text = myKatigoria.katPliroteo.ToString();
                dp.Text = myKatigoria.katDPasxa.ToString();
                dx.Text = myKatigoria.katDXmas.ToString();

                RadioButtonListMisthodType.Enabled = true;
                posoPliromis.Enabled = true;
                RadioButtonListMisthodType.SelectedIndex = -1;
                posoPliromis.Text = string.Empty;
                currentKatigoria.Text = string.Empty;
                oldKatigoria.Text = string.Empty;
                isxysKatigorias.Text = string.Empty;
                metaboliDate.Text = string.Empty;
                anadromika.Text = string.Empty;
                PanelAnadromika.Visible = false;
                anaforaPliromis.Visible=false;


                panelApousias.Visible = false;
                panelAllagiKatigorias.Visible = false;
                logosAnadromikon.SelectedIndex = -1;
                lastPliromiDate.Text = string.Empty;
                currentDate.Text = string.Empty;
            }
        }
        protected void RadioButtonListMisthodType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            PanelAnadromika.Visible = false;
            if (RadioButtonListMisthodType.SelectedValue == "1")
            {
                if (!string.IsNullOrEmpty(katigoria.Text))
                {
                    Oplitis anotherOplitis = new Oplitis();
                    anotherOplitis.id = Convert.ToInt32(aa.Text);
                    Katigoria myKatigoria = new Katigoria();
                    myKatigoria = myBlayer.get_Katigoria_By_Id(anotherOplitis);
                    posoPliromis.Text = myKatigoria.katPliroteo.ToString();
                    DateTime mydatetime = new DateTime();
                    mydatetime = DateTime.Now;
                    priromiDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
                    priromiDate.ReadOnly = true;
                }
            }
            else if (RadioButtonListMisthodType.SelectedValue == "2")
            {
                if (!string.IsNullOrEmpty(katigoria.Text))
                {
                    int year;
                    Oplitis anotherOplitis = new Oplitis();
                    anotherOplitis.id = Convert.ToInt32(aa.Text);
                    Katigoria myKatigoria = new Katigoria();
                    myKatigoria = myBlayer.get_Katigoria_By_Id(anotherOplitis); ;
                    posoPliromis.Text = myKatigoria.katDXmas.ToString();
                    year = DateTime.Now.Year;
                    DateTime mydatetime = new DateTime(year, 12, 16);
                    priromiDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
                    priromiDate.ReadOnly = false;
                }
            }
            else if (RadioButtonListMisthodType.SelectedValue == "3")
            {
                if (!string.IsNullOrEmpty(katigoria.Text))
                {
                    Oplitis anotherOplitis = new Oplitis();
                    anotherOplitis.id = Convert.ToInt32(aa.Text);
                    Katigoria myKatigoria = new Katigoria();
                    myKatigoria = myBlayer.get_Katigoria_By_Id(anotherOplitis); ;
                    posoPliromis.Text = myKatigoria.katDPasxa.ToString();
                    priromiDate.ReadOnly = false;
                }
            }
            else if (RadioButtonListMisthodType.SelectedValue == "4")
            {
                PanelAnadromika.Visible = true;
                error2.Visible = false;
                priromiDate.ReadOnly = true;
                try
                {
                    if (!string.IsNullOrEmpty(katigoria.Text))
                    {
                        Oplitis myOplitis = new Oplitis();
                        myOplitis.id = Convert.ToInt32(aa.Text);
                        Katigoria category = myBlayer.get_diafora_posou(myOplitis);
                        currentKatigoria.Text = category.newKatName;
                        oldKatigoria.Text = category.oldKatName;
                        Change myChange = myBlayer.getChangeById(myOplitis);
                        if (myChange.changeId == 0)
                        {
                            isxysKatigorias.Text = string.Empty;
                            metaboliDate.Text = string.Empty;
                            error2.Visible = true;
                            error2.Text = "Ο επιλεγμένος οπλίτης δεν έχει καμία μεταβολή!";
                            anadromikaCalculate.Visible = false;
                        }
                        else if (currentKatigoria.Text == oldKatigoria.Text)
                        {
                            isxysKatigorias.Text = string.Empty;
                            metaboliDate.Text = string.Empty;
                            error2.Visible = true;
                            error2.Text = "Ο επιλεγμένος οπλίτης δεν δικαιούται αναδρομικά!";
                            anadromikaCalculate.Visible = false;
                        }
                        else
                        {
                            isxysKatigorias.Text = myChange.changeIsxysDate.ToString();
                            metaboliDate.Text = myChange.changeDate.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    error.Visible = true;
                    error.Text = ex.Message.ToString();
                }
            }
        }
        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }
        protected void anadromikaCalculate_Click(object sender, EventArgs e)
        {
            if (logosAnadromikon.SelectedIndex == 0)
            {
                BLayer myBlayer = new BLayer();
                Oplitis myOplitis = new Oplitis();
                myOplitis.id = Convert.ToInt32(aa.Text);
                anadromika.Text = myBlayer.anadromikaCalcLogoKatigorias(myOplitis).ToString();
                posoPliromis.Text = anadromika.Text;
                DateTime mydatetime = new DateTime();
                mydatetime = DateTime.Now;
                priromiDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
            }
            else if (logosAnadromikon.SelectedIndex == 1)
            {
                BLayer myBlayer = new BLayer();
                Oplitis myOplitis = new Oplitis();
                myOplitis.id = Convert.ToInt32(aa.Text);
                decimal poso = myBlayer.anadromikaCalcLogoApousias(myOplitis);
                anadromika.Text = poso.ToString();
                posoPliromis.Text = anadromika.Text;
                DateTime mydatetime = new DateTime();
                mydatetime = DateTime.Now;
                priromiDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
            }
        }
        protected void TotalOplitis_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Text = Regex.Replace(e.Row.Cells[2].Text, lname.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
                e.Row.Cells[4].Text = Regex.Replace(e.Row.Cells[4].Text, asma.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }
        protected void search_Click(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            SqlDataReader myDtr = myBlayer.get_Oplitis();
            TotalOplitis.DataSource = myDtr;
            TotalOplitis.DataBind();
        }
        protected void logosAnadromikon_SelectedIndexChanged(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            error3.Visible = false;
            anadromika.Text = string.Empty;
            posoPliromis.Text = string.Empty;
            if (logosAnadromikon.SelectedIndex == 0)
            {
                panelAllagiKatigorias.Visible = true;
                panelApousias.Visible = false;
                anadromikaCalculate.Visible = true;
            }
            else if (logosAnadromikon.SelectedIndex == 1)
            {
                panelApousias.Visible = true;
                anadromikaCalculate.Visible = true;
                panelAllagiKatigorias.Visible = false;
                DateTime mydatetime = new DateTime();
                mydatetime = DateTime.Now;
                currentDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
                Pliromi otherPliromi = new Pliromi();
                otherOplitis.id = Convert.ToInt32(aa.Text);
                otherPliromi = myBlayer.get_Last_Pliromi_By_Opid(otherOplitis);
                lastPliromiDate.Text = otherPliromi.PayDay.ToString();
                if (Convert.ToDateTime(currentDate.Text) == Convert.ToDateTime(lastPliromiDate.Text))
                {
                    anadromikaCalculate.Visible = false;
                    error3.Visible = true;
                    error3.Text = "Ο επιλεγμένος οπλίτης δεν δικαιούται αναδρομικά λόγω απουσίας!";
                }
                else
                {
                    anadromikaCalculate.Visible = true;
                    error3.Visible = false;
                }
            }
        }
        protected void anaforaPliromis_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(aaPliromis.Text);
            string url = "./anafora_pliromis_by_id.aspx?id=" + id;
            Response.Redirect(ResolveUrl(url));
        }
        protected void LastPayments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int row = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(LastPayments.DataKeys[row].Values["p_id"].ToString());
                aaPliromis.Text = id.ToString();
                anaforaPliromis.Visible = true;
            }
        }
    }
}