using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelRecommendation
{
    public partial class Imagesize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Net.WebClient client = new System.Net.WebClient();
                     client.OpenRead("https://farm8.staticflickr.com/7419/13641723423_5844b8b056_o.jpg");
                     Int64 bytes_total = Convert.ToInt64(client.ResponseHeaders["Content-Length"]);
                Response.Write("alert('"+bytes_total.ToString() +" Bytes')" );
        }
    }
}