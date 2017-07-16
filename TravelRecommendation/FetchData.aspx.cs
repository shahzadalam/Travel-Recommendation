using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TravelRecommendation
{
    public partial class FetchData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrDataset;Integrated Security=True");

            SqlCommand cmd = new SqlCommand("INSERT INTO Flickrdata (photoID,serverID,farm,secret,longitude,latitude) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

      
    }
}