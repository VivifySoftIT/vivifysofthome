using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections.Generic;

namespace Vivify
{
    public partial class Employeecreation : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindBranch();
                LoadView();
                LoadFilterRegions();
                LoadFilterBranches();
                LoadFilterEmployees();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btnEdit = (LinkButton)e.Row.FindControl("btnEdit");
                if (btnEdit != null)
                {
                    ScriptManager sm = ScriptManager.GetCurrent(this.Page);
                    if (sm != null)
                    {
                        sm.RegisterPostBackControl(btnEdit);
                    }
                }
            }
        }

        private void bindBranch()
        {
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                string qry = "SELECT BranchId, BranchName FROM Branch";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DataRow defaultRow = dt.NewRow();
                defaultRow["BranchId"] = "0";
                defaultRow["BranchName"] = "Select Branch";
                dt.Rows.InsertAt(defaultRow, 0);

                ddlBranch.DataSource = dt;
                ddlBranch.DataTextField = "BranchName";
                ddlBranch.DataValueField = "BranchId";
                ddlBranch.DataBind();
            }
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

            if (ddlBranch.SelectedValue == "0" || ddlRole.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Please select a valid branch and role.');", true);
                return;
            }

            using (SqlConnection connection = new SqlConnection(constr))
            {
                connection.Open();

                if (btn.Text == "Update") // Update existing employee
                {
                    string employeeId = btn.CommandArgument;

                    HttpCookie firstNameCookie = Request.Cookies["FirstName"];
                    string modifiedBy = firstNameCookie != null ? firstNameCookie.Value : "Unknown";

                    string updateQuery = @"
                UPDATE Employees 
                SET EmployeeCode = @EmployeeCode,
                    FirstName = @FirstName,
                    LastName = @LastName,
                    MobileNumber = @MobileNumber,
                    OfficialMail = @OfficialMail,
                    BranchId = @BranchId,
                    BranchName = @BranchName,
                    ModifiedDate = GETDATE(),
                    ModifiedBy = @ModifiedBy,
                    Password = @Password,
                    Roles = @Roles,
                    AltMobileNumber = @AltMobileNumber
                WHERE EmployeeId = @EmployeeId";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                        cmd.Parameters.AddWithValue("@EmployeeCode", txtcode.Text);
                        cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                        cmd.Parameters.AddWithValue("@LastName", txtLname.Text);
                        cmd.Parameters.AddWithValue("@MobileNumber", txtMobno.Text);
                        cmd.Parameters.AddWithValue("@OfficialMail", txtOfcemail.Text);
                        cmd.Parameters.AddWithValue("@BranchId", ddlBranch.SelectedValue);
                        cmd.Parameters.AddWithValue("@BranchName", ddlBranch.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@ModifiedBy", modifiedBy);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@Roles", ddlRole.SelectedValue);
                        cmd.Parameters.AddWithValue("@AltMobileNumber", string.IsNullOrEmpty(txtAltMobno.Text) ? (object)DBNull.Value : txtAltMobno.Text);
                        cmd.ExecuteNonQuery();
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Employee updated successfully.');", true);
                }
                else // Insert new employee
                {
                    // Check for duplicate EmployeeCode
                    string checkQuery = "SELECT COUNT(*) FROM Employees WHERE EmployeeCode = @EmployeeCode";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, connection))
                    {
                        checkCmd.Parameters.AddWithValue("@EmployeeCode", txtcode.Text);
                        if ((int)checkCmd.ExecuteScalar() > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Employee code already exists.');", true);
                            return;
                        }
                    }

                    HttpCookie firstNameCookie = Request.Cookies["FirstName"];
                    string createdBy = firstNameCookie != null ? firstNameCookie.Value : "Unknown";

                    string insertQuery = @"
                INSERT INTO Employees (Active, EmployeeCode, FirstName, LastName, MobileNumber, OfficialMail, BranchId, BranchName, CreatedDate, CreatedBy, Password, Roles, AltMobileNumber)
                VALUES (1, @EmployeeCode, @FirstName, @LastName, @MobileNumber, @OfficialMail, @BranchId, @BranchName, GETDATE(), @CreatedBy, @Password, @Roles, @AltMobileNumber)";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, connection))
                    {
                        insertCmd.Parameters.AddWithValue("@EmployeeCode", txtcode.Text);
                        insertCmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                        insertCmd.Parameters.AddWithValue("@LastName", txtLname.Text);
                        insertCmd.Parameters.AddWithValue("@MobileNumber", txtMobno.Text);
                        insertCmd.Parameters.AddWithValue("@OfficialMail", txtOfcemail.Text);
                        insertCmd.Parameters.AddWithValue("@BranchId", ddlBranch.SelectedValue);
                        insertCmd.Parameters.AddWithValue("@BranchName", ddlBranch.SelectedItem.Text);
                        insertCmd.Parameters.AddWithValue("@CreatedBy", createdBy);
                        insertCmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                        insertCmd.Parameters.AddWithValue("@Roles", ddlRole.SelectedValue);
                        insertCmd.Parameters.AddWithValue("@AltMobileNumber", string.IsNullOrEmpty(txtAltMobno.Text) ? (object)DBNull.Value : txtAltMobno.Text);
                        insertCmd.ExecuteNonQuery();
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "Alert", "alert('Employee created successfully.');", true);
                }
            }

            formClear();
            LoadView();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string employeeId = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string empCode = ((TextBox)row.FindControl("txtEmployeeCode")).Text;
            string firstName = ((TextBox)row.FindControl("txtFirstName")).Text;
            string mobile = ((TextBox)row.FindControl("txtMobileNumber")).Text;
            string mail = ((TextBox)row.FindControl("txtOfficialMail")).Text;
            string password = ((TextBox)row.FindControl("txtPassword")).Text;
            string branch = ((TextBox)row.FindControl("txtBranchName")).Text.Trim();

            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

            // Fetch the BranchId from BranchTable based on BranchName
            int branchId = GetBranchIdByName(branch, constr);

            if (branchId == 0)
            {
                // If no matching branch is found, show an alert and return
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid Branch Name!');", true);
                return;
            }

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                string query = "UPDATE Employees SET EmployeeCode=@EmployeeCode, FirstName=@FirstName, MobileNumber=@Mobile, " +
                               "OfficialMail=@Mail, Password=@Password, BranchName=@Branch, BranchId=@Branchid WHERE EmployeeId=@EmployeeId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                    cmd.Parameters.AddWithValue("@EmployeeCode", empCode);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@Mobile", mobile);
                    cmd.Parameters.AddWithValue("@Mail", mail);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Branch", branch);
                    cmd.Parameters.AddWithValue("@Branchid", branchId);
                    cmd.ExecuteNonQuery();
                }
            }

            GridView1.EditIndex = -1;
            LoadView(); // Refresh GridView with updated values
            ScriptManager.RegisterStartupScript(this, this.GetType(), "updateSuccess", "alert('Employee details updated successfully!');", true);
        }

        private int GetBranchIdByName(string branchName, string constr)
        {
            string query = "SELECT BranchId FROM Branch WHERE BranchName = @BranchName";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BranchName", branchName);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    con.Close();

                    return result != null ? Convert.ToInt32(result) : 0; // Return BranchId if found, otherwise 0
                }
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string employeeId = btn.CommandArgument;

            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                string query = "SELECT * FROM Employees WHERE EmployeeId = @EmployeeId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // 🔍 DIAGNOSTIC: Log all column names and values
                            for (int i = 0; i < reader.FieldCount; i++)
                            {
                                string colName = reader.GetName(i);
                                object value = reader.GetValue(i);
                                System.Diagnostics.Debug.WriteLine($"Column: '{colName}' = '{value}'");
                            }

                            // Clear fields
                            txtcode.Text = "";
                            txtName.Text = "";
                            txtLname.Text = "";
                            txtMobno.Text = "";
                            txtAltMobno.Text = "";
                            txtOfcemail.Text = ""; // ✅ Ensure it's cleared
                            txtPassword.Text = "";

                            // Try multiple possible column names
                            string officialEmail = "";
                            if (reader.GetOrdinal("OfficialMail") >= 0)
                                officialEmail = reader["OfficialMail"]?.ToString() ?? "";
                            else if (reader.GetOrdinal("OfficialEmail") >= 0)
                                officialEmail = reader["OfficialEmail"]?.ToString() ?? "";
                            else if (reader.GetOrdinal("Official_Mail") >= 0)
                                officialEmail = reader["Official_Mail"]?.ToString() ?? "";

                            // Populate fields
                            txtcode.Text = reader["EmployeeCode"].ToString();
                            txtName.Text = reader["FirstName"].ToString();
                            txtLname.Text = reader["LastName"].ToString();
                            txtMobno.Text = reader["MobileNumber"].ToString();
                            txtAltMobno.Text = reader["AltMobileNumber"]?.ToString() ?? "";
                            txtOfcemail.Text = officialEmail; // ✅ Use the found value
                            txtPassword.Text = reader["Password"].ToString();

                            // Set dropdowns
                            string branchName = reader["BranchName"].ToString();
                            ddlBranch.ClearSelection();
                            var branchItem = ddlBranch.Items.FindByText(branchName);
                            if (branchItem != null) branchItem.Selected = true;

                            string role = reader["Roles"].ToString();
                            ddlRole.ClearSelection();
                            var roleItem = ddlRole.Items.FindByValue(role);
                            if (roleItem != null) roleItem.Selected = true;

                            btn1.Text = "Update";
                            btn1.CommandArgument = employeeId;
                        }
                    }
                }
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string employeeId = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                con.Open();
                // Optional: Check if employee has dependent records (e.g., services, expenses) before deleting
                string deleteQuery = "DELETE FROM Employees WHERE EmployeeId = @EmployeeId";
                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteSuccess", "alert('Employee deleted successfully!');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "deleteFail", "alert('Failed to delete employee.');", true);
                    }
                }
            }

            // Refresh the GridView
            LoadView();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadView();
        }
        void formClear()
        {
            txtcode.Text = "";
            txtName.Text = "";
            txtLname.Text = "";
            txtMobno.Text = "";
            txtOfcemail.Text = "";
            txtPassword.Text = "";
            txtAltMobno.Text = "";
            ddlRole.SelectedIndex = 0;
            ddlBranch.SelectedIndex = 0;
            btn1.Text = "Submit"; // Reset to Submit
        }

        private void LoadView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Employees";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtcode.Text = "";
            txtName.Text = "";
            txtLname.Text = "";
            txtMobno.Text = "";
            txtOfcemail.Text = "";
            txtPassword.Text = "";
            txtAltMobno.Text = "";
            ddlRole.SelectedIndex = 0;
            ddlBranch.SelectedIndex = 0;
        }

        // Filter Methods
        private void LoadFilterRegions()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT DISTINCT Region FROM Region ORDER BY Region";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlFilterRegion.DataSource = dt;
                ddlFilterRegion.DataTextField = "Region";
                ddlFilterRegion.DataValueField = "Region";
                ddlFilterRegion.DataBind();
                ddlFilterRegion.Items.Insert(0, new ListItem("All Regions", "All"));
            }
        }

        private void LoadFilterBranches(string regionName = "All")
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT DISTINCT b.BranchName 
                                 FROM Branch b
                                 INNER JOIN Region r ON b.RegionId = r.RegionId
                                 WHERE (@Region = 'All' OR r.Region = @Region)
                                 ORDER BY b.BranchName";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Region", regionName);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlFilterBranch.DataSource = dt;
                ddlFilterBranch.DataTextField = "BranchName";
                ddlFilterBranch.DataValueField = "BranchName";
                ddlFilterBranch.DataBind();
                ddlFilterBranch.Items.Insert(0, new ListItem("All Branches", "All"));
            }
        }

        private void LoadFilterEmployees(string branchName = "All", string regionName = "All")
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT DISTINCT e.FirstName, e.EmployeeId 
                                 FROM Employees e 
                                 INNER JOIN Branch b ON e.BranchId = b.BranchId 
                                 INNER JOIN Region r ON b.RegionId = r.RegionId
                                 WHERE (@Branch = 'All' OR b.BranchName = @Branch)
                                 AND (@Region = 'All' OR r.Region = @Region)
                                 ORDER BY e.FirstName";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Branch", branchName);
                cmd.Parameters.AddWithValue("@Region", regionName);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlFilterEmployee.DataSource = dt;
                ddlFilterEmployee.DataTextField = "FirstName";
                ddlFilterEmployee.DataValueField = "EmployeeId";
                ddlFilterEmployee.DataBind();
                ddlFilterEmployee.Items.Insert(0, new ListItem("All Employees", "All"));
            }
        }

        [WebMethod]
        public static List<DropdownItem> GetFilterBranches(string regionName)
        {
            List<DropdownItem> branches = new List<DropdownItem>();
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT DISTINCT b.BranchName 
                                 FROM Branch b
                                 INNER JOIN Region r ON b.RegionId = r.RegionId
                                 WHERE (@Region = 'All' OR r.Region = @Region)
                                 ORDER BY b.BranchName";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Region", regionName);
                
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                branches.Add(new DropdownItem { value = "All", text = "All Branches" });
                
                while (reader.Read())
                {
                    branches.Add(new DropdownItem
                    {
                        value = reader["BranchName"].ToString(),
                        text = reader["BranchName"].ToString()
                    });
                }
            }

            return branches;
        }

        [WebMethod]
        public static List<DropdownItem> GetFilterEmployees(string branchName, string regionName)
        {
            List<DropdownItem> employees = new List<DropdownItem>();
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT DISTINCT e.FirstName, e.EmployeeId 
                                 FROM Employees e 
                                 INNER JOIN Branch b ON e.BranchId = b.BranchId 
                                 INNER JOIN Region r ON b.RegionId = r.RegionId
                                 WHERE (@Branch = 'All' OR b.BranchName = @Branch)
                                 AND (@Region = 'All' OR r.Region = @Region)
                                 ORDER BY e.FirstName";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Branch", branchName);
                cmd.Parameters.AddWithValue("@Region", regionName);
                
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                employees.Add(new DropdownItem { value = "All", text = "All Employees" });
                
                while (reader.Read())
                {
                    employees.Add(new DropdownItem
                    {
                        value = reader["EmployeeId"].ToString(),
                        text = reader["FirstName"].ToString()
                    });
                }
            }

            return employees;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FilterEmployees();
        }

        private void FilterEmployees()
        {
            string regionFilter = ddlFilterRegion.SelectedValue;
            string branchFilter = ddlFilterBranch.SelectedValue;
            string employeeFilter = ddlFilterEmployee.SelectedValue;

            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT e.* 
                                 FROM Employees e 
                                 INNER JOIN Branch b ON e.BranchId = b.BranchId 
                                 INNER JOIN Region r ON b.RegionId = r.RegionId
                                 WHERE (@Region = 'All' OR r.Region = @Region)
                                 AND (@Branch = 'All' OR b.BranchName = @Branch)
                                 AND (@Employee = 'All' OR CAST(e.EmployeeId AS VARCHAR) = @Employee)";
                
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Region", regionFilter);
                cmd.Parameters.AddWithValue("@Branch", branchFilter);
                cmd.Parameters.AddWithValue("@Employee", employeeFilter);
                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}