using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;
using Newtonsoft.Json;
using System.Data.SqlClient;
using FlickrNet;
using unirest_net.http;
using unirest_net.request;



namespace TravelRecommendation
{
    
    public partial class StoreData : System.Web.UI.Page
    {
        string link = null;

        protected void Page_Load(object sender, EventArgs e)
        {
          
           
        }
        

        public PhotoInfo callFlickr(string photoid) {
            string ApiKey = "b4e9dfa823d28e1ff46c2b6500f81f21";
            //string SharedSecret = "";
            Flickr f = new Flickr();
            f.ApiKey = ApiKey;
            PhotoInfo photos = f.PhotosGetInfo(photoid);
            return photos;
             
        }

        public void getphotoinfo1()
        {
            string s = null;
            string chk = FileUpload1.FileName;
            if (FileUpload1.HasFile)
            {
                s = Server.MapPath(FileUpload1.FileName).ToString();
             
            }
            else
            {
                Response.Write("<script>alert('Please upload dataset first');</script>"); 
            }


            using (StreamReader r = new StreamReader(s))
            {
                string json = r.ReadToEnd();
                dynamic array = JsonConvert.DeserializeObject(json);
                for (int i = 0; i <1 ; i++)
                {
                    //array.photos.photo.Count
                   string photoid= array.photos.photo[i].id;
                    string view=array.photos.photo[i].views;
                    string url_o=array.photos.photo[i].url_o;
                    link = array.photos.photo[i].url_m;
                    dynamic data = callFace(link);
                    PhotoInfo photo = callFlickr(photoid);
                    //data.face[0].attribute.race.value
                   
                    if (data.face.Count > 0)
                    {

                        SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True");
                        con.Open();
                        for (int j = 0; j < data.face.Count; j++)
                        {
                            SqlCommand cmd2 = new SqlCommand("INSERT INTO AutoFaceAttribute (photoID,race,gender,age) VALUES('" + photoid + "','" + data.face[j].attribute.race.value + "','" + data.face[j].attribute.gender.value + "','" + data.face[j].attribute.age.value + "')", con);
                            cmd2.ExecuteNonQuery();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO AutoPhotoMeta (photoID,views,url_o,latitude,longitude,neighbourhood,locality,county,region,country,dataTaken,url_m,faceNum) VALUES('" + photoid + "','" + view + "','" + url_o + "','" + photo.Location.Latitude.ToString() + "','" + photo.Location.Longitude.ToString() + "','" + photo.Location.Neighbourhood.Description.ToString().Replace("'", "") + "','" + photo.Location.Locality.Description.ToString() + "','" + photo.Location.County.Description.ToString() + "','" + photo.Location.Region.Description.ToString() + "','" + photo.Location.Country.Description.ToString() + "','" + photo.DateTaken.ToString() + "','" + link + "','" + data.face.Count + "')", con);
                        cmd.ExecuteNonQuery();

                    }
                    //Response.Write("<script>alert('" + data.face[0].attribute.gender.value + "');</script>");
                    // array.photos.photo[i].datetaken;
                    //PhotoInfo photo = callFlickr(photoid);
                    //photo.Location.Country.ToString();

                   // Response.Write("<script>alert('" + photo.Location.Region.Description.ToString() + "');</script>");
                }

            }
            Response.Write("<script>alert('Data has been successfully save');</script>");

        }

        protected dynamic callFace(string url)
        {
            HttpResponse<string> jsonResponse = Unirest.get("https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=gender%2Cage%2Crace%2Csmiling&url=" + url + "")
              .header("X-Mashape-Authorization", "5NSgiCYKJjONm2HkNr34YeY8YjpqPmGb")
            .asJson<string>();
            string facejson = jsonResponse.Body;
            dynamic face = JsonConvert.DeserializeObject(facejson);
            return face;
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

            Button1.Visible = false;
            
            getphotoinfo1();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
        }

       
       
    }
}