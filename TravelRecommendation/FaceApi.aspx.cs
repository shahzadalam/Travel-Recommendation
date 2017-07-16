using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ProjectOxford.Face;
using Newtonsoft.Json;
using System.IO;

namespace TravelRecommendation
{
    public partial class FaceApi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           // Label1.Text =this.Table1.Rows[1].Cells[1].InnerText;
            string data = this.jsonDataHolder.Value;
            dynamic array = JsonConvert.DeserializeObject(data);
            Label1.Text = array.face[0].attribute.race.value;
        }
       
        
    }
}