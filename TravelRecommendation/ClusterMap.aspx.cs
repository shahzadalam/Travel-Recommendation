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
    public partial class ClusterMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string place = DropDownList1.SelectedItem.Text;
            String loc = ConvertDatatoString(place);
            
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "callCluster("+loc+",10)", true);
            SqlConnection conn = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True");
            string query = "select top 5  neighbourhood,COUNT(neighbourhood) count from PhotoMeta where country='" + DropDownList2.SelectedItem + "' and county='" + DropDownList1.SelectedItem + "' group by neighbourhood  ORDER BY count DESC ";
            SqlCommand cmd1 = new SqlCommand(query, conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ListBox1.Items.Clear();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListBox1.Items.Add((i+1)+". :"+dt.Rows[i][0].ToString());
            }            
          
             
        }
        public string ConvertDatatoString(string place)
        {

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("select title=neighbourhood,lat=latitude,lng=longitude,country from PhotoMeta where county='"+place+"'", con))
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