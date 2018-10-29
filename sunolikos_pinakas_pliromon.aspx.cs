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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BLayer myBlayer = new BLayer();
                SqlDataReader mydtr = myBlayer.get_Biblio_Pliromon();
                TotalPliromes.DataSource = mydtr;
                TotalPliromes.DataBind();

                SqlDataReader mydtr1 = myBlayer.get_Xrimatikos_Logismos();
                xrimatikos_logismos.DataSource = mydtr1;
                xrimatikos_logismos.DataBind();
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            BLayer myBlayer = new BLayer();
            SqlDataReader mydtr = myBlayer.get_Biblio_Pliromon();
            TotalPliromes.DataSource = mydtr;
            TotalPliromes.DataBind();
        }

        protected void TotalPliromes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Text = Regex.Replace(e.Row.Cells[1].Text, lname.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
                e.Row.Cells[3].Text = Regex.Replace(e.Row.Cells[3].Text, asma.Text.Trim(), delegate(Match match)
                {
                    return string.Format("<span style = 'background-color:yellow'>{0}</span>", match.Value);
                }, RegexOptions.IgnoreCase);
            }
        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }
    }
}