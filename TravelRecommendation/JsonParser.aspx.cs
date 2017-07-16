using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;

namespace TravelRecommendation
{
    public partial class JsonParser : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int i = Int32.Parse(Label1.Text);
            i++;
            Label1.Text = i.ToString();
           

        }
        public void  photoid(int i){
        using (StreamReader r = new StreamReader("c:\\Users\\SHAHZAD\\Documents\\Visual Studio 2012\\Projects\\TravelRecommendation\\TravelRecommendation\\sf1.json"))
            {
                string json = r.ReadToEnd();
                dynamic array = JsonConvert.DeserializeObject(json);
                TextBox1.Text = array.photos.photo[i].id;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "doSearch(" + array.photos.photo[i].id + ")", true);
               
                
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i = Int32.Parse(Label1.Text);
            photoid(i);
            

        }
    

       
    }
}