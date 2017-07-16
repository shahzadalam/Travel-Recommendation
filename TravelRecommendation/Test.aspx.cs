using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;

namespace TravelRecommendation
{
  
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String loc = ConvertDatatoString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "initialize(" + loc + ")", true);
            
            
        }

       
        public string ConvertDatatoString()
        {

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("select title=neighbourhood,lat=latitude,lng=longitude,country from PhotoMeta", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }
                    Console.Write(serializer.Serialize(rows));
                    return serializer.Serialize(rows);
                }
            }
            
        }

      
    }
}