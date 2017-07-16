using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;
using System.Data.SqlClient;

namespace TravelRecommendation
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                int i = Int32.Parse(Label1.Text);
                i++;
                Label1.Text = i.ToString();
            
                string s = Label2.Text;
                //TextBox13.Text = s;
     
               
            
        }
        public void getphotoinfo(int i)
        {
            string s = null;
            string chk = FileUpload1.FileName;
            if (FileUpload1.HasFile)
            {
                i = 0;
                Label1.Text = "0";
                s = Server.MapPath(FileUpload1.FileName).ToString();
                Label2.Text = s;
            }
            else
            {
                s = Label2.Text;
            }
           
            
            //string s = "c:\\Users\\SHAHZAD\\Documents\\Visual Studio 2012\\Projects\\TravelRecommendation\\TravelRecommendation\\sf1.json";
            using (StreamReader r = new StreamReader(s))
            {
                string json = r.ReadToEnd();
                dynamic array = JsonConvert.DeserializeObject(json);
                TextBox1.Text = array.photos.photo[i].id;
                TextBox2.Text = array.photos.photo[i].views;
                TextBox3.Text = array.photos.photo[i].url_o;
                HiddenField1.Value = array.photos.photo[i].url_m;
                TextBox12.Text = array.photos.photo[i].datetaken;
                Label3.Text = array.photos.photo[i].url_m;
                Image1.ImageUrl = TextBox3.Text;
                //Image1.ImageUrl = Label3.Text;
                
                //TextBox1.Text = array.photos.perpage;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "doSearch(" + array.photos.photo[i].id + ")", true);
                


            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i = Int32.Parse(Label1.Text);
            Button1.Text = "NEXT";
            //Response.Write("<script>document.getElementById('file').style.display = 'none';</script>");
            getphotoinfo(i);
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string url = HiddenField1.Value;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction2", "getFace('" + url+ "')", true);
          
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            dynamic data = JsonConvert.DeserializeObject(jsonDataHolder.Value);
            if (TextBox1.Text != "" && TextBox3.Text != "" && TextBox5.Text != "")
            {
                
                SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True");
                 con.Open();
                for (int i = 0; i < data.face.Count;i++ )
                {
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO FaceAttribute (photoID,race,gender,age) VALUES('" + TextBox1.Text + "','" + data.face[i].attribute.race.value + "','" + data.face[i].attribute.gender.value + "','" + data.face[i].attribute.age.value + "')", con);
                    cmd2.ExecuteNonQuery();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO PhotoMeta (photoID,views,url_o,latitude,longitude,neighbourhood,locality,county,region,country,dataTaken,url_m,faceNum) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox7.Text.Replace("'","") + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + TextBox12.Text + "','" + Label3.Text + "','" + data.face.Count + "')", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Sucessfully Saved');</script>");
                
                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Please fill all the data first');</script>");
            }
        }

    
    }
}