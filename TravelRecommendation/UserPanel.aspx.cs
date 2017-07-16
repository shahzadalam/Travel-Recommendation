using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TravelRecommendation
{
    public partial class UserPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for(int i=15;i<97;i++)
            DropDownList2.Items.Add(i.ToString());
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String user = TextBox5.Text;
            String pass = TextBox6.Text;
            SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from userInfo where email =@username and password=@password", con);
            cmd.Parameters.AddWithValue("@username", user);
            cmd.Parameters.AddWithValue("@password", pass);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("Recommend.aspx?user="+user);
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password') </script>");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
            {

                SqlConnection con = new SqlConnection("Data Source=LENOVO-PC;Initial Catalog=FlickrData;Integrated Security=True");
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO UserInfo(name,email,password,address,age,gender,country) VALUES('" + TextBox4.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + Int64.Parse(DropDownList2.SelectedItem.Text) + "','" + RadioButtonList1.SelectedValue + "','" + DropDownList1.SelectedItem.Text + "')", con);
                cmd.ExecuteNonQuery();
                string message = "Your details have been saved successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                con.Close();
            }
            else
            {
                Response.Write("<script>alert('Please fill all the data first');</script>");
            }

            
            
            //Response.Write("<script>alert('Please load all the data first');</script>");
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
            string script = "window.onload = function(){";
            
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            //Response.Write("<script>alert('Please load all the data first');</script>");

        }
    }
}