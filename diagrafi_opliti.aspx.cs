using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm6 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DateTime mydatetime = new DateTime();
                mydatetime = DateTime.Now;
                deleteDate.Text = mydatetime.Day.ToString() + "/" + mydatetime.Month.ToString() + "/" + mydatetime.Year.ToString();
                BLayer myBlayer = new BLayer();
                TotalOplitis.DataSource = myBlayer.get_Oplitis();
                TotalOplitis.DataBind();
            }
        }

        protected void TotalOplitis_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            { 
                int row = Convert.ToInt32(e.CommandArgument);
                id.Text = TotalOplitis.DataKeys[row].Values["op_id"].ToString();
                asm.Text = TotalOplitis.DataKeys[row].Values["op_asm"].ToString(); //TotalOplitis.Rows[row].Cells[4].Text;
                rank.Text = TotalOplitis.Rows[row].Cells[1].Text;
                lname.Text = TotalOplitis.DataKeys[row].Values["op_eponymo"].ToString();//TotalOplitis.Rows[row].Cells[2].Text;
                fname.Text = TotalOplitis.Rows[row].Cells[3].Text;
                category.Text = TotalOplitis.Rows[row].Cells[6].Text;
                loxos.Text = TotalOplitis.Rows[row].Cells[5].Text;
                deletionPanel.Visible = true;
            }

        }

        protected void ConfirmCheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (ConfirmCheckBox.Checked == true)
            {
                Submit.Visible = true;
            }
            else { Submit.Visible = false; }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Oplitis myOplitis = new Oplitis();
                BLayer myBlayer = new BLayer();
                myOplitis.id = Convert.ToInt32(id.Text);
                myOplitis.diagrafi = Convert.ToDateTime(deleteDate.Text);
                myBlayer.deleteOplitis(myOplitis);
                Response.Redirect("anafora_diagrafis.aspx");
            }
            catch (Exception ex)
            {
                error.Text = ex.Message.ToString();
            }
        }

        protected void TotalOplitis_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[2].Text = Regex.Replace(e.Row.Cells[2].Text, eponymoSearch.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);

                e.Row.Cells[4].Text = Regex.Replace(e.Row.Cells[4].Text, asmSearch.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            TotalOplitis.DataSource = myBlayer.get_Oplitis();
            TotalOplitis.DataBind();
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}