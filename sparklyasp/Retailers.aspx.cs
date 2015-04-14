using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Collections;

namespace sparklyasp
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string strSelectQuery = "SELECT suburbID FROM Suburb WHERE suburb = @suburb AND zip = @zip";
            string strInsertQuery = "INSERT INTO Suburb (suburb, state,zip) VALUES (@suburb, @state, @zip)";
            string strConnection = ConfigurationManager.ConnectionStrings["AccessDB"].ConnectionString;
            int index = GridView1.EditIndex;
            GridViewRow row = GridView1.Rows[index];
            string strNewSuburb = (((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text);
            string strNewState = (((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text);
            string strNewZip = (((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Text);
            
            using (OleDbConnection connection = new OleDbConnection(strConnection))
            {
                OleDbCommand command = new OleDbCommand(strSelectQuery, connection);
                command.Parameters.Add("suburb", OleDbType.VarChar, 50).Value = strNewSuburb;
                command.Parameters.Add("zip", OleDbType.VarChar, 5).Value = strNewZip;
                connection.Open();
                OleDbDataReader reader;
                reader = command.ExecuteReader();

                if (!reader.Read())
                {
                        //if the suburb isnt in the database already, add it
                        using (OleDbConnection insConnection = new OleDbConnection(strConnection))
                        {
                            OleDbCommand insertCommand = new OleDbCommand(strInsertQuery, insConnection);
                            insertCommand.Parameters.Add("suburb", OleDbType.VarChar, 50).Value = strNewSuburb;
                            insertCommand.Parameters.Add("state", OleDbType.VarChar, 3).Value = strNewState;
                            insertCommand.Parameters.Add("zip", OleDbType.VarChar, 5).Value = strNewZip;
                            insConnection.Open();
                            insertCommand.ExecuteNonQuery();
                        }

                 }

                //re run the command to ensure a new suburb we may have added is included
                OleDbDataReader reader2 = command.Clone().ExecuteReader();                

                while (reader2.Read()) {
                        //get the suburb id
                        int suburbID = int.Parse(reader["suburbID"].ToString());

                        //add all the values to be updated to the update parameters
                        foreach (DictionaryEntry entry in e.NewValues)
                        {
                            if (entry.Value != null && RetailersDataSource.UpdateParameters[entry.Key.ToString()] != null)
                            {
                                RetailersDataSource.UpdateParameters[entry.Key.ToString()].DefaultValue = entry.Value.ToString();
                            }
                        }
                        RetailersDataSource.UpdateParameters["suburbID"].DefaultValue = suburbID.ToString();
                        RetailersDataSource.UpdateParameters["retailerID"].DefaultValue = GridView1.DataKeys[e.RowIndex]["retailerID"].ToString();
                        RetailersDataSource.Update();
                }
            }
        }
    }
}