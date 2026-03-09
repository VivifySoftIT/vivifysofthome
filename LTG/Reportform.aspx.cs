using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Vivify
{
    public partial class Reportform : Page
    {
        private string previousEmployeeName = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRegions();
                LoadBranches();
                LoadEmployeeNames();
            }
        }

        private void LoadRegions()
        {
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = "SELECT RegionId, Region FROM Region ORDER BY Region";  // Updated query for your Region table

            DataTable regionsTable = new DataTable();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(regionsTable);
                    }
                }
            }

            ddlRegion.DataSource = regionsTable;
            ddlRegion.DataTextField = "Region";  // Display the Region name
            ddlRegion.DataValueField = "RegionId";  // Use RegionId as value
            ddlRegion.DataBind();

            ddlRegion.Items.Insert(0, new ListItem("All Regions", ""));
        }

        private void LoadBranches(string regionId = null)
        {
            ddlBranch.Items.Clear();
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = @"
        SELECT BranchId, BranchName 
        FROM Branch 
        WHERE (@RegionId IS NULL OR @RegionId = '' OR RegionId = @RegionId) 
        ORDER BY BranchName";

            using (SqlConnection con = new SqlConnection(constr))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                if (string.IsNullOrEmpty(regionId))
                    cmd.Parameters.AddWithValue("@RegionId", DBNull.Value);
                else
                    cmd.Parameters.AddWithValue("@RegionId", regionId);

                con.Open();
                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    da.Fill(dt);

                ddlBranch.DataSource = dt;
                ddlBranch.DataTextField = "BranchName";
                ddlBranch.DataValueField = "BranchId";
                ddlBranch.DataBind();
            }

            ddlBranch.Items.Insert(0, new ListItem("All Branches", ""));
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedRegionId = ddlRegion.SelectedValue;
            LoadBranches(selectedRegionId);  // Load branches for the selected region
            LoadEmployeeNames();  // Refresh employees based on new branch filter
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedBranch = ddlBranch.SelectedValue;
            int branchId;
            if (!string.IsNullOrEmpty(selectedBranch) && int.TryParse(selectedBranch, out branchId))
            {
                LoadEmployeeNames(branchId);
            }
            else
            {
                LoadEmployeeNames(null);
            }
        }

        private void LoadEmployeeNames(int? branchId = null)
        {
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            string query = @"
        SELECT DISTINCT FirstName 
        FROM Employees 
        WHERE (@BranchId IS NULL OR BranchId = @BranchId)
          AND FirstName IS NOT NULL 
          AND LTRIM(RTRIM(FirstName)) != ''
        ORDER BY FirstName";

            using (SqlConnection con = new SqlConnection(constr))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                if (branchId.HasValue)
                    cmd.Parameters.AddWithValue("@BranchId", branchId.Value);
                else
                    cmd.Parameters.AddWithValue("@BranchId", DBNull.Value);

                con.Open();
                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    da.Fill(dt);

                ddlEmployee.DataSource = dt;
                ddlEmployee.DataTextField = "FirstName";
                ddlEmployee.DataValueField = "FirstName";
                ddlEmployee.DataBind();
            }

            ddlEmployee.Items.Insert(0, new ListItem("All Employees", ""));
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string selectedRegionId = ddlRegion.SelectedValue;
            string selectedBranchId = ddlBranch.SelectedValue;
            string selectedEmployeeName = ddlEmployee.SelectedValue;
            DateTime fromDate, toDate;

            lblError.Visible = false;

            if (DateTime.TryParse(txtFromDate.Text, out fromDate) &&
                DateTime.TryParse(txtToDate.Text, out toDate))
            {
                if (fromDate <= toDate)
                {
                    LoadData(selectedRegionId, selectedBranchId, selectedEmployeeName, fromDate, toDate);
                }
                else
                {
                    lblError.Text = "From Date cannot be later than To Date.";
                    lblError.Visible = true;
                }
            }
            else
            {
                lblError.Text = "Please enter valid dates.";
                lblError.Visible = true;
            }
        }

        private void LoadData(string regionId, string branchId, string employeeName, DateTime fromDate, DateTime toDate)
        {
            string constr = ConfigurationManager.ConnectionStrings["vivify"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query = @"
SELECT 
    emp.FirstName AS Eng_Name,
    expDetails.ExpenseType AS Tour_Local,
    expDetails.Date AS Date,
    expDetails.FromTime AS From_Time,
    expDetails.ToTime AS To_Time,
    expDetails.Particulars AS Particulars,
    expDetails.Distance AS Distance,
    expDetails.TransportType AS Transport,
    expDetails.Conveyance,
    expDetails.Lodging,
    expDetails.Food,
    expDetails.Others,
    expDetails.Miscellaneous,
    expDetails.Refreshment,
    expDetails.SoNo AS SO_Number,
    expDetails.Department AS Department,
    expDetails.NatureOfWork AS Nature_of_Work,
    expDetails.SmoNo AS SMO,
    expDetails.RefNo AS Document_Reference,
    expDetails.Remarks AS Remarks
FROM 
(
    -- Regular Expenses (Conveyance, Food, Lodging, Others, Miscellaneous)
    SELECT 
        s.ServiceId,
        exp.ExpenseType,
        exp.Date,
        exp.FromTime,
        exp.ToTime,
        exp.Particulars,
        exp.Distance,
        exp.TransportType,
        exp.Conveyance,
        exp.Lodging,
        exp.Food,
        exp.Others,
        exp.Miscellaneous,
        NULL AS Refreshment,
        exp.SoNo,
        exp.SmoNo,
        exp.RefNo,
        exp.Remarks,
        s.Department,
        s.ServiceType AS NatureOfWork,
        s.EmployeeId
    FROM 
    (
        -- Conveyance
        SELECT 
            ServiceId, 
            ExpenseType, 
            Date, 
            FromTime, 
            ToTime, 
            Particulars, 
            Distance, 
            TransportType,
            ClaimedAmount AS Conveyance, 
            NULL AS Lodging, 
            NULL AS Food, 
            NULL AS Others, 
            NULL AS Miscellaneous,
            SoNo, 
            SmoNo, 
            RefNo, 
            Remarks
        FROM Conveyance
        WHERE Date BETWEEN @FromDate AND @ToDate
          AND isclaimable = 1
        
        UNION ALL
        
        -- Food
        SELECT 
            ServiceId, 
            ExpenseType, 
            Date, 
            FromTime, 
            ToTime, 
            Particulars, 
            NULL AS Distance, 
            NULL AS TransportType,
            NULL AS Conveyance, 
            NULL AS Lodging, 
            ClaimedAmount AS Food, 
            NULL AS Others, 
            NULL AS Miscellaneous,
            SoNo, 
            SmoNo, 
            RefNo, 
            Remarks
        FROM Food
        WHERE Date BETWEEN @FromDate AND @ToDate
          AND isclaimable = 1
        
        UNION ALL
        
        -- Lodging
        SELECT 
            ServiceId, 
            ExpenseType, 
            Date, 
            FromTime, 
            ToTime, 
            Particulars, 
            NULL AS Distance, 
            NULL AS TransportType,
            NULL AS Conveyance, 
            ClaimedAmount AS Lodging, 
            NULL AS Food, 
            NULL AS Others, 
            NULL AS Miscellaneous,
            SoNo, 
            SmoNo, 
            RefNo, 
            Remarks
        FROM Lodging
        WHERE Date BETWEEN @FromDate AND @ToDate
          AND isclaimable = 1
        
        UNION ALL
        
        -- Others
        SELECT 
            ServiceId, 
            ExpenseType, 
            Date, 
            FromTime, 
            ToTime, 
            Particulars, 
            NULL AS Distance, 
            NULL AS TransportType,
            NULL AS Conveyance, 
            NULL AS Lodging, 
            NULL AS Food, 
            ClaimedAmount AS Others, 
            NULL AS Miscellaneous,
            SoNo, 
            SmoNo, 
            RefNo, 
            Remarks
        FROM Others
        WHERE Date BETWEEN @FromDate AND @ToDate
          AND isclaimable = 1
        
        UNION ALL
        
        -- Miscellaneous
        SELECT 
            ServiceId, 
            ExpenseType, 
            Date, 
            FromTime, 
            ToTime, 
            Particulars, 
            NULL AS Distance, 
            NULL AS TransportType,
            NULL AS Conveyance, 
            NULL AS Lodging, 
            NULL AS Food, 
            NULL AS Others, 
            ClaimedAmount AS Miscellaneous,
            SoNo, 
            SmoNo, 
            RefNo, 
            Remarks
        FROM Miscellaneous
        WHERE Date BETWEEN @FromDate AND @ToDate
          AND isclaimable = 1
    ) AS exp
    INNER JOIN Services s ON exp.ServiceId = s.ServiceId
    
    UNION ALL
    
    -- Refreshment Entries (simplified - just get refreshments for the date range)
    SELECT 
        r.ServiceId,
        'Refreshment' AS ExpenseType,
        r.FromDate AS Date,
        NULL AS FromTime,
        NULL AS ToTime,
        'Monthly Refreshment' AS Particulars,
        NULL AS Distance,
        NULL AS TransportType,
        NULL AS Conveyance,
        NULL AS Lodging,
        NULL AS Food,
        NULL AS Others,
        NULL AS Miscellaneous,
        r.RefreshAmount AS Refreshment,
        NULL AS SoNo,
        NULL AS SmoNo,
        NULL AS RefNo,
        NULL AS Remarks,
        r.Department,
        'Refresh' AS NatureOfWork,
        r.EmployeeId
    FROM Refreshment r
    WHERE r.FromDate BETWEEN @FromDate AND @ToDate
      AND r.IsVerified = 1
) AS expDetails
INNER JOIN Employees emp ON expDetails.EmployeeId = emp.EmployeeId
LEFT JOIN Branch b ON emp.BranchId = b.BranchId
WHERE (@RegionId IS NULL OR @RegionId = '' OR b.RegionId = @RegionId)
  AND (@BranchId IS NULL OR @BranchId = '' OR b.BranchId = @BranchId)
  AND (@EmployeeName IS NULL OR @EmployeeName = '' OR emp.FirstName LIKE '%' + @EmployeeName + '%')
ORDER BY 
    emp.FirstName, 
    YEAR(expDetails.Date), 
    MONTH(expDetails.Date),
    CASE WHEN expDetails.ExpenseType = 'Refreshment' THEN 1 ELSE 0 END,
    expDetails.Date,
    expDetails.FromTime
        ";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.CommandTimeout = 120;

                    cmd.Parameters.AddWithValue("@RegionId", string.IsNullOrEmpty(regionId) ? (object)DBNull.Value : regionId);
                    cmd.Parameters.AddWithValue("@BranchId", string.IsNullOrEmpty(branchId) ? (object)DBNull.Value : branchId);
                    cmd.Parameters.AddWithValue("@FromDate", fromDate);
                    cmd.Parameters.AddWithValue("@ToDate", toDate);
                    cmd.Parameters.AddWithValue("@EmployeeName", string.IsNullOrEmpty(employeeName) ? (object)DBNull.Value : employeeName);

                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    dt.Columns.Add("Total", typeof(decimal));

                    decimal totalConveyance = 0, totalFood = 0, totalOthers = 0, totalLodging = 0,
                            totalMiscellaneous = 0, totalRefreshment = 0, overallTotal = 0;

                    foreach (DataRow row in dt.Rows)
                    {
                        decimal conveyance = row["Conveyance"] != DBNull.Value ? Convert.ToDecimal(row["Conveyance"]) : 0;
                        decimal food = row["Food"] != DBNull.Value ? Convert.ToDecimal(row["Food"]) : 0;
                        decimal others = row["Others"] != DBNull.Value ? Convert.ToDecimal(row["Others"]) : 0;
                        decimal lodging = row["Lodging"] != DBNull.Value ? Convert.ToDecimal(row["Lodging"]) : 0;
                        decimal miscellaneous = row["Miscellaneous"] != DBNull.Value ? Convert.ToDecimal(row["Miscellaneous"]) : 0;
                        decimal refreshment = row["Refreshment"] != DBNull.Value ? Convert.ToDecimal(row["Refreshment"]) : 0;

                        decimal rowTotal = conveyance + food + others + lodging + miscellaneous + refreshment;

                        row["Total"] = rowTotal;

                        totalConveyance += conveyance;
                        totalFood += food;
                        totalOthers += others;
                        totalLodging += lodging;
                        totalMiscellaneous += miscellaneous;
                        totalRefreshment += refreshment;
                        overallTotal += rowTotal;
                    }

                    if (dt.Rows.Count > 0)
                    {
                        DataRow totalsRow = dt.NewRow();
                        totalsRow["Eng_Name"] = "GRAND TOTAL";
                        totalsRow["Tour_Local"] = "";
                        totalsRow["Date"] = DBNull.Value;
                        totalsRow["Particulars"] = "TOTALS:";
                        totalsRow["Conveyance"] = totalConveyance;
                        totalsRow["Food"] = totalFood;
                        totalsRow["Others"] = totalOthers;
                        totalsRow["Lodging"] = totalLodging;
                        totalsRow["Miscellaneous"] = totalMiscellaneous;
                        totalsRow["Refreshment"] = totalRefreshment;
                        totalsRow["Total"] = overallTotal;
                        dt.Rows.Add(totalsRow);
                    }

                    gvReport.DataSource = dt;
                    gvReport.DataBind();
                }
            }
        }

        protected void gvReport_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                object dataItem = e.Row.DataItem;
                string currentEmployeeName = null;
                if (dataItem != null)
                {
                    currentEmployeeName = DataBinder.Eval(dataItem, "Eng_Name") as string;
                }

                if (!string.Equals(previousEmployeeName, currentEmployeeName, StringComparison.OrdinalIgnoreCase))
                {
                    previousEmployeeName = currentEmployeeName;

                    GridViewRow employeeRow = new GridViewRow(-1, -1, DataControlRowType.DataRow, DataControlRowState.Normal);
                    TableCell headerCell = new TableCell
                    {
                        ColumnSpan = gvReport.Columns.Count,
                        CssClass = "employee-header",
                        Text = "<strong>Employee: " + currentEmployeeName + "</strong> - Department: " + DataBinder.Eval(e.Row.DataItem, "Department")
                    };
                    employeeRow.Cells.Add(headerCell);
                    employeeRow.CssClass = "employee-header-row";

                    gvReport.Controls[0].Controls.AddAt(e.Row.RowIndex, employeeRow);
                }
            }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            ExportToExcel(gvReport);
        }

        private void ExportToExcel(GridView gridView)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=ExpenseReport.xls");
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            gridView.AllowPaging = false;
            gridView.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required to avoid the runtime error "Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }
    }
}