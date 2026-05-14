using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web.Services;
using System.Collections.Generic;

namespace LTG
{
    public partial class RefreshmentVerify : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRegions();
                LoadBranches();
                LoadEmployeeNames();
                GridView1.Visible = false;
            }
        }

        private void LoadRegions()
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = "SELECT DISTINCT Region FROM Region ORDER BY Region";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlRegion.DataSource = dt;
                ddlRegion.DataTextField = "Region";
                ddlRegion.DataValueField = "Region";
                ddlRegion.DataBind();
                ddlRegion.Items.Insert(0, new ListItem("All Regions", "All"));
            }
        }

        private void LoadBranches(string regionName = "All")
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
                ddlBranch.DataSource = dt;
                ddlBranch.DataTextField = "BranchName";
                ddlBranch.DataValueField = "BranchName";
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new ListItem("All Branches", "All"));
            }
        }

        private void LoadEmployeeNames(string branchName = "All", string regionName = "All")
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
                ddlEmployee.DataSource = dt;
                ddlEmployee.DataTextField = "FirstName";
                ddlEmployee.DataValueField = "EmployeeId";
                ddlEmployee.DataBind();
                ddlEmployee.Items.Insert(0, new ListItem("All Employees ", "All"));
            }
        }

        [WebMethod]
        public static List<DropdownItem> GetBranches(string regionName)
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
        public static List<DropdownItem> GetEmployees(string branchName, string regionName)
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

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            DateTime fromDate, toDate;
            lblError.Visible = false;

            if (!DateTime.TryParse(txtFromDate.Text, out fromDate) ||
                !DateTime.TryParse(txtToDate.Text, out toDate))
            {
                lblError.Text = "Enter valid From/To Date.";
                lblError.Visible = true;
                return;
            }

            if (fromDate > toDate)
            {
                lblError.Text = "From Date should not be after To Date.";
                lblError.Visible = true;
                return;
            }

            LoadGridData(ddlBranch.SelectedValue, ddlEmployee.SelectedValue, fromDate, toDate);
        }

        private void LoadGridData(string branch, string employeeId, DateTime fromDate, DateTime toDate)
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"SELECT r.Id, r.FromDate, r.ToDate, e.FirstName, r.RefreshAmount, b.BranchName, r.IsVerified
                         FROM Refreshment r
                         INNER JOIN Employees e ON r.EmployeeId = e.EmployeeId
                         INNER JOIN Branch b ON e.BranchId = b.BranchId
                         WHERE r.FromDate BETWEEN @From AND @To";

                if (branch != "All") query += " AND b.BranchName = @BranchName";
                if (employeeId != "All") query += " AND e.EmployeeId = @EmployeeId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@From", fromDate);
                cmd.Parameters.AddWithValue("@To", toDate);
                if (branch != "All") cmd.Parameters.AddWithValue("@BranchName", branch);
                if (employeeId != "All") cmd.Parameters.AddWithValue("@EmployeeId", employeeId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Visible = true;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "VerifyRow")
            {
                string id = e.CommandArgument.ToString();
                Session["SelectedId"] = id;

                // Always redirect to RefreshClaim.aspx, even if verified
                Response.Redirect("RefreshClaim.aspx");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btn = (Button)e.Row.FindControl("btnVerify");
                object isVerifiedObj = DataBinder.Eval(e.Row.DataItem, "IsVerified");
                bool isVerified = isVerifiedObj != DBNull.Value && Convert.ToBoolean(isVerifiedObj);

                btn.Text = isVerified ? "Verified" : "Verify";

                // ✅ Keep the button enabled so it can redirect in all cases
                // ❌ Removed: btn.Enabled = !isVerified;

                btn.CssClass = isVerified ? "btn btn-success" : "btn btn-primary";
            }
        }
    }

    public class DropdownItem
    {
        public string value { get; set; }
        public string text { get; set; }
    }
}
