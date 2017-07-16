using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace TravelRecommendation
{
    public partial class JsonReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        [WebMethod]
        public static string done1(string[] ids)
        {
            String[] a = ids;
            Console.Write(a[0]);
          JsonReader obj = new JsonReader();
          obj.print(a);
            return "Hello";
        }
        public  void print(string[] a)
        {
            TextBox1.Text = a[0];
        }
    }
}