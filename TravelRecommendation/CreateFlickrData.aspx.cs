using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelRecommendation
{
    public partial class CreateFlickrData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String img = TextBox5.Text;
            img.Replace("_o","_s");
            Console.Write(img);
            Image1.ImageUrl = img;

        }
      

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            TextBox2.Text = "data change";
        }
       
    }
}