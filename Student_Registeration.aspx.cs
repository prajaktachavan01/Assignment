using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Inductotherm_Assignment
{
    public partial class Student_Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindStudentGrid();
            }
        }

        private void BindStudentGrid()
        {
            try
            {
                DataTable dt = new DataTable();
                SQLDataAccessHelper obj = new SQLDataAccessHelper();
                dt = obj.ExecuteQuery("SELECT * FROM Student_Info_tbl");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void Cleartxt()
        {
            Txt_FirstName.Text = "";
            Txt_LastName.Text = "";
            ////Txt_nationality.Text = "";
            Txt_Course.Text = "";
        }

        protected void btn_Insert_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string Gender;
            SQLDataAccessHelper obj = new SQLDataAccessHelper();
            if(RD_Male.Checked == true)
            {
                Gender = "Male";
            }
            else
            {
                Gender = "Femlale";
            }
            int result = obj.ExecuteNonQuery("INSERT INTO Student_Info_tbl(First_Name,Last_Name,Gender,Nationality,Date_Of_Birth,Course) VALUES('"+ Txt_FirstName.Text +"','"+ Txt_LastName.Text +"','"+ Gender +"','"+ DDL_Nationality.Text +"','"+ Txt_DOB.Text +"','"+ Txt_Course.Text +"')");
            if(result >= 1)
            {
                Response.Write("<script>alert('Student Registered')</script>");
                BindStudentGrid();
                Cleartxt();
            }
            else
            {
                Response.Write("<script>alert('Something went wrong')</script>");
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindStudentGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SQLDataAccessHelper obj = new SQLDataAccessHelper();
            int index = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            TextBox txtFirstName = GridView1.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox;
            TextBox txtLastName = GridView1.Rows[e.RowIndex].FindControl("txtLastName") as TextBox;
            TextBox txtGender = GridView1.Rows[e.RowIndex].FindControl("txtGender") as TextBox;
            DropDownList txtNationality = GridView1.Rows[e.RowIndex].FindControl("DDL_Nationality") as DropDownList;
            TextBox txtDOB = GridView1.Rows[e.RowIndex].FindControl("txtDOB") as TextBox;
            TextBox txtCourse = GridView1.Rows[e.RowIndex].FindControl("txtCourse") as TextBox;

            int result = obj.ExecuteNonQuery("UPDATE Student_Info_tbl SET First_Name = '" + txtFirstName.Text +"', Last_Name = '" + txtLastName.Text +"', Gender = '" + txtGender.Text +"', Nationality = '" + txtNationality.Text +"', Date_Of_Birth = '" + txtDOB.Text +"', Course = '"+ txtCourse.Text +"' WHERE Student_ID = '" + index + "'");
            if (result >= 1)
            {
                Response.Write("<script>alert('Student Updated');</script>");
                GridView1.EditIndex = -1;
                BindStudentGrid();
            }
            else
            {
                Response.Write("<script>alert('Something went wrong');</script>");
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindStudentGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
                SQLDataAccessHelper obj = new SQLDataAccessHelper();
                int index = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                int result = obj.ExecuteNonQuery("DELETE FROM Student_Info_tbl WHERE Student_ID = '" + index + "'");
                if (result == 1)
                {
                    Response.Write("<script>alert('Student Deleted');</script>");
                    BindStudentGrid();
                }
                else
                {
                    Response.Write("<script>alert('Something went wrong');</script>");
                }
        }

    }
}