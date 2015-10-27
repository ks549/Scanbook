using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using Google.API.Search;

namespace WebAppScanBook
{
    public partial class ScanBookHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            MySqlDataReader reader = null;
            MySqlDataReader reader1 = null;
            MySqlCommand cmd = null;
            MySqlCommand cmd2 = null;
            try
            {
                string sql = "SELECT * FROM scanbook.books WHERE isbn=" + TextBox1.Text + " ";
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    con.Open();
                    cmd = new MySqlCommand(sql, con);
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Label1.Text = "BOOK DETAILS";
                            Label2.Text = "<b>ISBN:</b>" + reader.GetString("isbn");
                            Label3.Text = "<b>Title:</b>" + reader.GetString("title");
                            Label4.Text = "<b>Author:</b>" + reader.GetString("author");
                            Label5.Text = "<b>Page count:</b>" + reader.GetString("pno");
                            Label6.Text = "You Already read this book.";
                         }
                        con.Close();
                    }
                    else
                    {
                        GbookSearchClient client = new GbookSearchClient("www.c-sharpcorner.com");
                        int flag = 1;
                        IList<IBookResult> results = client.Search(TextBox1.Text, 30);
                        foreach (IBookResult result in results)
                        {
                            if (flag == 1)
                            {
                                Label1.Text = "BOOK DETAILS";
                                Label2.Text = "<b>ISBN:</b>" + TextBox1.Text;
                                Label3.Text = "<b>Title:</b>" + result.Title.ToString();
                                Label4.Text = "<b>Author:</b>" + result.Authors.ToString();
                                Label5.Text = "<b>Page count:</b>" + result.PageCount.ToString();
                                Label6.Text = "You haven't read the book(NEW).<br/><table>";
                                using (MySqlConnection con1 = new MySqlConnection(constr))
                                {
                                    MySqlCommand cmd1 = con1.CreateCommand();
                                    cmd1.CommandText = "INSERT INTO scanbook.books(isbn,title,author,pno) VALUES (?isbn,?title,?author,?pno)";
                                    cmd1.Parameters.AddWithValue("?isbn", TextBox1.Text);
                                    cmd1.Parameters.AddWithValue("?title", result.Title.ToString());
                                    cmd1.Parameters.AddWithValue("?author", result.Authors.ToString());
                                    cmd1.Parameters.AddWithValue("?pno", result.PageCount);
                                    con1.Open();
                                    cmd1.ExecuteNonQuery();
                                    con1.Close();
                                 }
                                flag = 0;

                            }
                        }

                    }

                }
            }
            catch (Exception ex) { }
            Label7.Text = "<b>NOTES:</b>Enter your comment about the book...";
            TextBox2.Visible = true;
            Button2.Visible = true;
            string sql1 = "SELECT * FROM scanbook.notes WHERE isbn=" + TextBox1.Text + " ";
            String str=" ";
            using (MySqlConnection con2 = new MySqlConnection(constr))
            {
                con2.Open();
                cmd2 = new MySqlCommand(sql1, con2);
                reader1 = cmd2.ExecuteReader();
                if (reader1.HasRows)
                {
                    while (reader1.Read())
                    {
                        str = str + "<br/>" + reader1.GetString("dnt") + ":" + reader1.GetString("notes");
                    }
                    Label8.Text = str;
                }
                else { }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            MySqlDataReader reader1 = null;
            MySqlCommand cmd2 = null;
            DateTime theDate = DateTime.Now;
            theDate.ToString("yyyy-MM-dd H:mm:ss");
            using (MySqlConnection con3 = new MySqlConnection(constr))
            {
                MySqlCommand cmd3 = con3.CreateCommand();
                cmd3.CommandText = "INSERT INTO scanbook.notes(dnt,isbn,notes) VALUES (?date,?isbn,?notes)";
                cmd3.Parameters.AddWithValue("?date",theDate);
                cmd3.Parameters.AddWithValue("?isbn", TextBox1.Text);
                cmd3.Parameters.AddWithValue("?notes", TextBox2.Text);
                con3.Open();
                cmd3.ExecuteNonQuery();
                con3.Close();
            }
            string sql = "SELECT * FROM scanbook.notes WHERE isbn=" + TextBox1.Text + " ";
            String str = " ";
            using (MySqlConnection con4 = new MySqlConnection(constr))
            {
                con4.Open();
                cmd2 = new MySqlCommand(sql, con4);
                reader1 = cmd2.ExecuteReader();
                if (reader1.HasRows)
                {
                    while (reader1.Read())
                    {
                        str = str + "<br/>" + reader1.GetString("dnt") + ":" + reader1.GetString("notes");
                    }
                    Label8.Text = str;
                }
                else { }
                con4.Close();
            }
            TextBox2.Text = "";
        }
    }
}