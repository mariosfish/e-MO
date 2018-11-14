using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace Web_Misthodosia_Opliton
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            SqlDataReader myDtr1 = myBlayer.get_Diagrammenos_Oplitis();
            deletedOplitis.DataSource = myDtr1;
            deletedOplitis.DataBind();
        }

        protected void deletedOplitis_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                BLayer myBlayer = new BLayer();
                Oplitis myOplitis = new Oplitis();
                int row = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(deletedOplitis.DataKeys[row].Values["do_id"].ToString());
                lastDeletedPaymentsPanel.Visible = true;
                myOplitis.id=id;

                SqlDataReader myDtr = myBlayer.get_pliromi_diagrammenou_opliti_by_id_opliti(myOplitis);
                LastPayments.DataSource = myDtr;
                LastPayments.DataBind();

            }
        }

        protected void deletedOplitis_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void search_Click(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            SqlDataReader myDtr1 = myBlayer.get_Diagrammenos_Oplitis();
            deletedOplitis.DataSource = myDtr1;
            deletedOplitis.DataBind();
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }
    }
}