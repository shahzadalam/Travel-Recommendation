using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelRecommendation
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
           string pass = TextBox2.Text.ToString();
            if (username == "admin" && pass == "admin")
            {
                Response.Redirect("~/AdminPanel.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid username/password please try again!!!');</script>");
            }
        }
    }
}