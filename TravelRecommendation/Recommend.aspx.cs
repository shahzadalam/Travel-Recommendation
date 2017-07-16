using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace TravelRecommendation
{
    public partial class Recommend : System.Web.UI.Page
    {
       public  SqlConnection conn = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = Request.QueryString["user"];
                if (email == null)
                {
                    Response.Redirect("UserPanel.aspx");

                }
                else
                {
                    CityImage ci = new CityImage();
                    ArrayList al = new ArrayList();
                    al = getname(email);
                    Label1.Text = "Hello " + al[0];
                    String loc = ConvertDatatoString("select title=neighbourhood,lat=latitude,lng=longitude,country from PhotoMeta where photoID in (select photoID from FaceAttribute where race='" + al[2] + "' and gender='" + al[1] + "')");
                    ArrayList place = getcity();
                    Label5.Text = place[0].ToString();
                    Image1.ImageUrl = ci.getimage(place[0].ToString());
                    Label7.Text = place[1].ToString();
                    Image2.ImageUrl = ci.getimage(place[1].ToString());
                    Label8.Text = place[2].ToString();
                    Image3.ImageUrl = ci.getimage(place[2].ToString());
                    Label9.Text = place[3].ToString();
                    Image4.ImageUrl = ci.getimage(place[3].ToString());
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "callCluster(" + loc + ")", true);
                }
            }

        }
        public ArrayList getcity()
        {

            string query = "select top 4  county,COUNT(county) count from PhotoMeta group by county  ORDER BY count DESC  ";
            SqlCommand cmd1 = new SqlCommand(query, conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ArrayList al = new ArrayList();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                al.Add(dt.Rows[i][0].ToString());
            }
            conn.Close();
            return al;
        }
        public ArrayList getstreetplaces(String city)
        {

            string query = "select top 4  neighbourhood,COUNT(neighbourhood) count from PhotoMeta where county='"+city+"' group by neighbourhood  ORDER BY count DESC ";
            SqlCommand cmd1 = new SqlCommand(query, conn);
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ArrayList al = new ArrayList();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                al.Add(dt.Rows[i][0].ToString());
            }
            conn.Close();
            return al;
        }
        public ArrayList getname(String name)
        {
            
            conn.Open();
            SqlCommand cmd = new SqlCommand("select name,gender,race from userInfo where email=@email ", conn);
            cmd.Parameters.AddWithValue("@email", name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ArrayList al = new ArrayList();
            al.Add(dt.Rows[0][0].ToString());
            al.Add(dt.Rows[0][1].ToString());
            al.Add(dt.Rows[0][2].ToString());
            conn.Close();
            return al;
        }
        public string ConvertDatatoString(string query)
        {

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CityImage ci = new CityImage();

            String loc = ConvertDatatoString("select title=neighbourhood,lat=latitude,lng=longitude,country from PhotoMeta where county='" + DropDownList4.SelectedItem + "' and photoID in (select photoID from FaceAttribute where race='" + DropDownList1.SelectedItem + "' and gender='" + RadioButtonList1.SelectedItem + "')");
            ArrayList place = getstreetplaces(DropDownList4.SelectedItem.ToString());
            Label5.Text = place[0].ToString();
            Image1.ImageUrl = ci.getimage(place[0].ToString());
            Label7.Text = place[1].ToString();
            Image2.ImageUrl = ci.getimage(place[1].ToString());
            Label8.Text = place[2].ToString();
            Image3.ImageUrl = ci.getimage(place[2].ToString());
            Label9.Text = place[3].ToString();
            Image4.ImageUrl = ci.getimage(place[3].ToString());
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "callCluster(" + loc + ")", true);

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction2", "dowiki('" + Label7.Text + "')", true);


        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction3", "dowiki('" + Label5.Text + "')", true);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction4", "dowiki('" + Label8.Text + "')", true);
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction5", "dowiki('" + Label9.Text + "')", true);
        }

       
    }
}