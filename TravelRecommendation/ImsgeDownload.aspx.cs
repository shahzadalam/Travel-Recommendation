using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

namespace TravelRecommendation
{
    public partial class ImsgeDownload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WebClient webClient = new WebClient();

            webClient.DownloadFile("https://c2.staticflickr.com/8/7286/16911797912_8829348e29_b.jpg", "\\Images\\image3.jpg");
            
        }
    }
}