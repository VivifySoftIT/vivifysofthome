using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace Vivify
{
    public partial class TravelExpensePage : System.Web.UI.Page
    {
        // Helper class for dropdown items
        public class DropdownItem
        {
            public string value { get; set; }
            public string text { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hide label and grid initially
                Label1.Visible = false;
                GridView1.Visible = false;

                LoadRegions();
                LoadBranches();
                LoadEmployeeNames();

                // Set default dates if not set
                if (string.IsNullOrEmpty(txtFromDate.Text))
                {
                    txtFromDate.Text = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
                }
                if (string.IsNullOrEmpty(txtToDate.Text))
                {
                    txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                }

                // Set default dropdown values
                ddlRegion.SelectedValue = "";
                ddlBranch.SelectedValue = "";
                ddlEmployee.SelectedValue = "All";

                // Check if Session contains filter values
                if (Session["FromDate"] != null && Session["ToDate"] != null)
                {
                    string selectedRegion = Session["Region"]?.ToString() ?? "";
                    string selectedBranch = Session["Branch"]?.ToString() ?? "";
                    string selectedEmployee = Session["Employee"]?.ToString() ?? "All";
                    DateTime fromDate = (DateTime)Session["FromDate"];
                    DateTime toDate = (DateTime)Session["ToDate"];

                    ddlRegion.SelectedValue = selectedRegion;
                    ddlBranch.SelectedValue = selectedBranch;
                    ddlEmployee.SelectedValue = selectedEmployee;
                    txtFromDate.Text = fromDate.ToString("yyyy-MM-dd");
                    txtToDate.Text = toDate.ToString("yyyy-MM-dd");

                    BindGridView(selectedRegion, selectedBranch, selectedEmployee, fromDate, toDate);
                }
                else
                {
                    // Initial load - hide the label and grid until user clicks search
                    Label1.Visible = false;
                    GridView1.Visible = false;
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnVerify = (Button)e.Row.FindControl("btnVerify");
                if (btnVerify != null)
                {
                    DataRowView rowView = (DataRowView)e.Row.DataItem;
                    int maxStatus = Convert.ToInt32(rowView["MaxStatus"]);

                    if (maxStatus == 3)
                    {
                        btnVerify.Text = "Verified";
                        btnVerify.Enabled = true;
                        btnVerify.CssClass = "btn btn-primary custom-button center-button verified-btn";
                    }
                    else
                    {
                        btnVerify.Text = "Click to Verify";
                        btnVerify.Enabled = true;
                        btnVerify.CssClass = "btn btn-primary custom-button center-button";
                    }
                }
            }
        }

        private void LoadRegions()
        {
            ddlRegion.Items.Clear();
            ddlRegion.Items.Insert(0, new ListItem("All Regions", "All"));

            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = "SELECT RegionId, Region FROM Region ORDER BY Region";

            DataTable regionTable = new DataTable();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(regionTable);
                    }
                }
            }

            if (regionTable.Rows.Count > 0)
            {
                foreach (DataRow row in regionTable.Rows)
                {
                    ddlRegion.Items.Add(new ListItem(row["Region"].ToString(), row["RegionId"].ToString()));
                }
            }
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBranches(ddlRegion.SelectedValue);
            LoadEmployeeNames(); // Reset employees when region changes
            // Do NOT auto-filter here — wait for user to click "Search"
        }

        // AJAX WebMethod for getting branches based on region
        [WebMethod]
        public static List<DropdownItem> GetBranches(string regionName)
        {
            List<DropdownItem> branches = new List<DropdownItem>();
            branches.Add(new DropdownItem { value = "", text = "All Branches" });

            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = @"SELECT DISTINCT b.BranchId, b.BranchName 
                           FROM Branch b
                           INNER JOIN Region r ON b.RegionId = r.RegionId
                           WHERE 1=1";

            if (!string.IsNullOrEmpty(regionName) && regionName != "")
            {
                query += " AND r.RegionId = @RegionId";
            }

            query += " ORDER BY b.BranchName";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(regionName) && regionName != "")
                    {
                        cmd.Parameters.AddWithValue("@RegionId", regionName);
                    }
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            branches.Add(new DropdownItem
                            {
                                value = reader["BranchId"].ToString(),
                                text = reader["BranchName"].ToString()
                            });
                        }
                    }
                }
            }

            return branches;
        }

        private void LoadBranches(string regionId = null)
        {
            ddlBranch.Items.Clear();
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;

            string query = @"SELECT BranchId, BranchName 
                           FROM Branch 
                           WHERE (@RegionId IS NULL OR @RegionId = '' OR RegionId = @RegionId)
                           ORDER BY BranchName";

            DataTable branchTable = new DataTable();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (string.IsNullOrEmpty(regionId))
                        cmd.Parameters.AddWithValue("@RegionId", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@RegionId", regionId);

                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(branchTable);
                    }
                }
            }

            ddlBranch.DataSource = branchTable;
            ddlBranch.DataTextField = "BranchName";
            ddlBranch.DataValueField = "BranchId";
            ddlBranch.DataBind();

            ddlBranch.Items.Insert(0, new ListItem("All Branches", "All"));
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedBranch = ddlBranch.SelectedValue;
            LoadEmployeeNames(selectedBranch);
            // Do NOT auto-filter here — wait for user to click "Search"
        }

        // AJAX WebMethod for getting employees based on branch and region
        [WebMethod]
        public static List<DropdownItem> GetEmployees(string branchName, string regionName)
        {
            List<DropdownItem> employees = new List<DropdownItem>();
            employees.Add(new DropdownItem { value = "All", text = "All Employees" });

            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = @"SELECT DISTINCT e.FirstName + ' ' + e.LastName AS FullName 
                           FROM Employees e
                           INNER JOIN Branch b ON e.BranchId = b.BranchId
                           INNER JOIN Region r ON b.RegionId = r.RegionId
                           WHERE e.FirstName IS NOT NULL 
                           AND LEN(e.FirstName) > 0";

            if (!string.IsNullOrEmpty(branchName) && branchName != "")
            {
                query += " AND b.BranchId = @BranchId";
            }

            if (!string.IsNullOrEmpty(regionName) && regionName != "")
            {
                query += " AND r.RegionId = @RegionId";
            }

            query += " ORDER BY FullName";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(branchName) && branchName != "")
                    {
                        cmd.Parameters.AddWithValue("@BranchId", branchName);
                    }
                    if (!string.IsNullOrEmpty(regionName) && regionName != "")
                    {
                        cmd.Parameters.AddWithValue("@RegionId", regionName);
                    }

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string fullName = reader["FullName"].ToString().Trim();
                            if (!string.IsNullOrEmpty(fullName))
                            {
                                employees.Add(new DropdownItem
                                {
                                    value = fullName,
                                    text = fullName
                                });
                            }
                        }
                    }
                }
            }

            return employees;
        }

        private void LoadEmployeeNames(string branchId = null)
        {
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = @"SELECT DISTINCT FirstName + ' ' + LastName AS FullName, EmployeeId 
                           FROM Employees 
                           WHERE (@BranchId IS NULL OR @BranchId = '' OR BranchId = @BranchId) 
                           AND FirstName IS NOT NULL 
                           ORDER BY FullName";

            DataTable employeeTable = new DataTable();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (string.IsNullOrEmpty(branchId))
                        cmd.Parameters.AddWithValue("@BranchId", DBNull.Value);
                    else
                        cmd.Parameters.AddWithValue("@BranchId", branchId);

                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(employeeTable);
                    }
                }
            }

            ddlEmployee.DataSource = employeeTable;
            ddlEmployee.DataTextField = "FullName";
            ddlEmployee.DataValueField = "FullName";
            ddlEmployee.DataBind();

            ddlEmployee.Items.Insert(0, new ListItem("All Employees", "All"));
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Do NOT auto-filter here — wait for user to click "Search"
        }

        private void ApplyFilters()
        {
            if (DateTime.TryParse(txtFromDate.Text, out DateTime fromDate) &&
                DateTime.TryParse(txtToDate.Text, out DateTime toDate))
            {
                string region = ddlRegion.SelectedValue;
                string branch = ddlBranch.SelectedValue;
                string employee = ddlEmployee.SelectedValue;

                BindGridView(region, branch, employee, fromDate, toDate);
            }
        }

        private void BindGridView(string regionId, string branchId, string employeeName, DateTime fromDate, DateTime toDate)
        {
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string qry = @"
SELECT 
    MIN(te.Id) as Id,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    b.BranchName,
    FORMAT(te.Date, 'dd-MMM-yyyy') AS TravelDate,
    MAX(te.Status) as MaxStatus
FROM 
    TravelExpenses te
INNER JOIN Employees e ON te.EmployeeId = e.EmployeeId
INNER JOIN Branch b ON te.BranchId = b.BranchId
INNER JOIN Region r ON b.RegionId = r.RegionId
WHERE 
    te.Status IN (1, 3)
    AND (@RegionId IS NULL OR r.RegionId = @RegionId)
    AND (@BranchId IS NULL OR b.BranchId = @BranchId)
    AND (@EmployeeName = 'All' OR (e.FirstName + ' ' + e.LastName) = @EmployeeName)
    AND (te.Date BETWEEN @FromDate AND @ToDate)
GROUP BY 
    e.FirstName + ' ' + e.LastName, 
    b.BranchName, 
    te.Date
ORDER BY 
    te.Date DESC, EmployeeName";

                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    // Handle region parameter - convert empty string to NULL
                    if (string.IsNullOrEmpty(regionId))
                    {
                        cmd.Parameters.AddWithValue("@RegionId", DBNull.Value);
                    }
                    else
                    {
                        // Try to parse as integer, if fails use NULL
                        if (int.TryParse(regionId, out int regionIdInt))
                        {
                            cmd.Parameters.AddWithValue("@RegionId", regionIdInt);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@RegionId", DBNull.Value);
                        }
                    }

                    // Handle branch parameter - convert empty string to NULL
                    if (string.IsNullOrEmpty(branchId))
                    {
                        cmd.Parameters.AddWithValue("@BranchId", DBNull.Value);
                    }
                    else
                    {
                        // Try to parse as integer, if fails use NULL
                        if (int.TryParse(branchId, out int branchIdInt))
                        {
                            cmd.Parameters.AddWithValue("@BranchId", branchIdInt);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@BranchId", DBNull.Value);
                        }
                    }

                    // Handle employee parameter
                    if (string.IsNullOrEmpty(employeeName) || employeeName == "All")
                    {
                        cmd.Parameters.AddWithValue("@EmployeeName", "All");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@EmployeeName", employeeName);
                    }

                    cmd.Parameters.AddWithValue("@FromDate", fromDate);
                    cmd.Parameters.AddWithValue("@ToDate", toDate);

                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }

            GridView1.Visible = GridView1.Rows.Count > 0;
            Label1.Visible = GridView1.Rows.Count == 0;
            if (GridView1.Rows.Count == 0)
                Label1.Text = "No records found for the selected criteria.";
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            if (DateTime.TryParse(txtFromDate.Text, out DateTime fromDate) &&
                DateTime.TryParse(txtToDate.Text, out DateTime toDate))
            {
                Session["Region"] = ddlRegion.SelectedValue;
                Session["Branch"] = ddlBranch.SelectedValue;
                Session["Employee"] = ddlEmployee.SelectedValue;
                Session["FromDate"] = fromDate;
                Session["ToDate"] = toDate;

                BindGridView(
                    ddlRegion.SelectedValue,
                    ddlBranch.SelectedValue,
                    ddlEmployee.SelectedValue,
                    fromDate,
                    toDate
                );
            }
            else
            {
                Label1.Text = "Please enter valid dates.";
                Label1.Visible = true;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Verify")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split('|');
                int travelExpenseId = Convert.ToInt32(commandArgs[0]);
                string employeeName = commandArgs[1];
                string travelDate = commandArgs[2];

                Session["TravelExpenseId"] = travelExpenseId;
                Session["EmployeeName"] = employeeName;
                Session["TravelDate"] = travelDate;

                Response.Redirect("AdminTravelVerify.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // This method is kept for compatibility
            Response.Redirect("AdminTravelVerify.aspx");
        }

        private void FetchFromDate(int serviceIds)
        {
            // Not needed for travel expenses
        }

        private void FetchExpenseTotals(int serviceId)
        {
            // Not needed for travel expenses
        }
    }
}