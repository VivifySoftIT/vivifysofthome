<%@ Page Title="" Language="C#" MasterPageFile="/Main.Master" AutoEventWireup="true" CodeBehind="Employeecreation.aspx.cs" Inherits="Vivify.Employeecreation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <head>
       <%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />--%>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
      
    <style>
    /* Existing styles remain the same */
    .form-label {
        font-weight: bold;
        color: #333;
        margin-bottom: 0.25rem;
    }s
    .sidebar {
      background-color: #3f418d;
      padding: 10px;
      width: 250px;
      min-width: 250px;
      max-width: 250px;
      box-shadow: 0 2px 10px rgba(63, 65, 141, 0.3);
      position: fixed;
      height: 100vh;
      overflow-y: auto;
      z-index: 1000;
  }

  .sidebar-nav .nav-link {
      display: flex;
      align-items: center;
      padding: 6px 10px;
      border-radius: 4px;
      color: #222b65;
      background-color: white;
      font-size: 11px;
      margin-bottom: 4px;
      transition: all 0.3s ease;
  }

  .sidebar-nav .nav-link i {
      font-size: 12px;
      margin-right: 5px;
  }
    .edit-button, .delete-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        padding: 0;
        border-radius: 4px;
        text-decoration: none;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s, border 0.3s;
        margin-right: 4px;
    }

    .edit-button:hover, .delete-button:hover {
        opacity: 0.9;
    }

    .edit-button {
        background-color: #003366;
        border: 2px solid #003366;
        color: white;
    }

    .delete-button {
        background-color: #dc3545;
        border: 2px solid #dc3545;
        color: white;
    }

    .form-select{
        width: 100%;
        padding: 5px;
        border-radius: 4px;
        border: 2px solid darkblue;
    }

    .form-control {
        width: 100%;
        padding: 5px;
        border-radius: 4px;
        border: 2px solid darkblue;
    }

    .form-control:focus {
        border-color: #80bdff;
        outline: none;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

    .dropdown-input:focus {
        border-color: #80bdff !important;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25) !important;
        background-color: white !important;
    }

    .custom-button {
        background-color: blue;
        color: white;
        border: 2px solid black;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }

    .custom-button:hover {
        background-color: darkblue;
    }
    
    .form-control:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }
    
    .required-field {
        color: OrangeRed;
        margin-top: 0.25rem;
        font-size: 0.875rem;
    }

    .btn-primary {
        background-color: #3f418d;
        border-color: #3f418d;
    }
    
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    
    .form-container {
        padding: 15px;
        background-color: #f8f9fa;
        border-radius: 5px;
        box-shadow: 0 2px 10px darkblue;
    }

    /* Updated Grid Styles */
    .table-container {
        display: block;
        max-height: 400px;
        overflow-y: auto;
        overflow-x: auto; /* Allow horizontal scrolling only when necessary */
        box-shadow: 0 4px 15px darkblue;
        background-color: white;
        border-radius: 5px;
        margin-bottom: 50px;
        width: 100%;
    }

    .mydatagrid {
        width: 100%;
        border-collapse: collapse;
        font-size: 0.75rem; /* Reduced font size */
    }

    .mydatagrid th {
        position: sticky;
        top: 0;
        background-color: #3f418d;
        color: ghostwhite;
        z-index: 10;
        text-align: center;
        padding: 6px 4px; /* Reduced padding */
        border: 1px solid darkblue;
        font-size: 0.7rem; /* Smaller font for headers */
        font-weight: bold;
        white-space: nowrap;
    }

    .mydatagrid td {
        padding: 5px 3px; /* Reduced padding */
        border: 1px solid darkblue;
        text-align: center;
        font-size: 0.7rem; /* Smaller font for cells */
        word-wrap: break-word;
        white-space: normal; /* Allow text to wrap */
    }

    /* Mobile Responsive Styles */
    @media (max-width: 768px) {
        .mydatagrid {
            font-size: 0.65rem; /* Even smaller on mobile */
        }
        
        .mydatagrid th,
        .mydatagrid td {
            padding: 4px 2px;
            font-size: 0.65rem;
        }
        
        .table-container {
            max-height: 350px;
            margin-bottom: 30px;
        }
        
        .edit-button, .delete-button {
            width: 28px;
            height: 28px;
            margin-right: 2px;
        }
        
        .edit-button i, 
        .delete-button i {
            font-size: 0.8rem;
        }
    }

    @media (max-width: 576px) {
        .mydatagrid {
            font-size: 0.6rem;
        }
        
        .mydatagrid th,
        .mydatagrid td {
            padding: 3px 1px;
            font-size: 0.6rem;
        }
        
        /* Hide less important columns on very small screens */
        .mydatagrid td:nth-child(4), /* Official Mail */
        .mydatagrid th:nth-child(4) {
            display: none;
        }
    }

    /* Ensure the grid is responsive */
    .table-responsive {
        width: 100%;
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
    }

    /* Searchable Dropdown Styles */
    .custom-dropdown {
        position: relative;
        width: 100%;
    }

    .dropdown-input {
        width: 100%;
        padding: 5px 30px 5px 5px;
        border: 2px solid darkblue;
        border-radius: 4px;
        font-size: 13px;
        background-color: white !important;
        cursor: pointer;
    }

    .dropdown-input:focus {
        border-color: #80bdff !important;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25) !important;
        background-color: white !important;
    }

    /* Override browser autofill background */
    .dropdown-input:-webkit-autofill,
    .dropdown-input:-webkit-autofill:hover,
    .dropdown-input:-webkit-autofill:focus,
    .dropdown-input:-webkit-autofill:active {
        -webkit-box-shadow: 0 0 0 30px white inset !important;
        box-shadow: 0 0 0 30px white inset !important;
        background-color: white !important;
    }

    /* Remove text selection background color */
    .dropdown-input::selection {
        background-color: transparent;
        color: inherit;
    }

    .dropdown-input::-moz-selection {
        background-color: transparent;
        color: inherit;
    }

    .dropdown-arrow {
        position: absolute !important;
        right: 8px !important;
        top: 50% !important;
        transform: translateY(-50%) !important;
        font-size: 12px !important;
        color: #666 !important;
        pointer-events: none !important;
    }

    .dropdown-options {
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background: white;
        border: 1px solid #ddd;
        border-top: none;
        border-radius: 0 0 4px 4px;
        max-height: 250px;
        overflow-y: auto;
        z-index: 10000;
        display: none;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .dropdown-options.show {
        display: block;
    }

    .dropdown-option {
        padding: 8px 12px;
        cursor: pointer;
        font-size: 13px;
        border-bottom: 1px solid #f0f0f0;
        transition: background-color 0.2s ease;
    }

    .dropdown-option:hover {
        background-color: #f8f9fa;
    }

    .dropdown-option.selected {
        background-color: #1E73D8;
        color: white;
    }

    .dropdown-option:last-child {
        border-bottom: none;
    }

    .no-results {
        padding: 12px;
        text-align: center;
        color: #999;
        font-style: italic;
    }

    .hidden-dropdown {
        display: none !important;
    }

    /* Filter Section Styles */
    .filter-container {
        background-color: white;
        padding: 20px;
        margin: 20px 0;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .form-row {
        display: flex;
        gap: 15px;
        align-items: flex-end;
        flex-wrap: wrap;
    }

    .filter-group {
        flex: 1;
        min-width: 200px;
        display: flex;
        flex-direction: column;
    }

    .filter-label {
        font-weight: bold;
        color: #333;
        margin-bottom: 8px;
        font-size: 14px;
    }

    .filter-control {
        width: 100%;
        padding: 8px 12px;
        border: 2px solid darkblue;
        border-radius: 4px;
        font-size: 14px;
    }

    .search-btn-container {
        display: flex;
        align-items: flex-end;
    }

    .search-btn-container .btn-primary {
        padding: 10px 30px;
        background-color: #3f418d;
        border: none;
        border-radius: 4px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        font-size: 14px;
    }

    .search-btn-container .btn-primary:hover {
        background-color: #2d2f6b;
    }
</style>
                <aside id="sidebar" class="sidebar" style="box-shadow: 0 2px 10px darkblue;">

   <ul class="sidebar-nav" id="sidebar-nav">
      <%-- <li class="nav-item">
    <a class="nav-link" href="Dashboard.aspx">
        <i class="bi bi-grid"></i>
        <span>Dashboard</span>
    </a>
</li>--%>
            
              <li class="nav-item">
    <a class="nav-link" href="AdminPage.aspx">
       <i class="bi bi-pc-display"></i>
        <span>Expense Page</span>
    </a>
</li>
                    
  
          <li class="nav-item">
  <a class="nav-link " href="Employeecreation.aspx">
      <i class="bi bi-personbi bi-person-circle"></i><span>Employee Creation</span>
  </a>
</li>
                   
        
      <li class="nav-item">
    
            <a class="nav-link " href="AdminCustomer_Creation.aspx">
               <i class="bi bi-person-workspace"></i><span>Customer Creation</span>
            </a>
          </li>

                          <li class="nav-item">
  <a class="nav-link " href="AdminService_Assign.aspx">
      <i class="bi bi-diagram-3"></i><span>Service Assignment</span>
  </a>
</li>
       
                                 <li class="nav-item">
  <a class="nav-link " href="Reportform.aspx">
      <i class="bi bi-filetype-exe"></i><span>Expense Report</span>
  </a>

</li>

                                 <li class="nav-item">
  <a class="nav-link " href="CombinedReport.aspx">
      <i class="bi bi-folder-fill"></i><span>Combined Report</span>
  </a>

</li>
       
                <li class="nav-item">
  <a class="nav-link " href="DocView.aspx">
      <i class="bi bi-file-earmark-pdf-fill"></i><span> Attachment</span>
  </a>

</li>
<%--                            <li class="nav-item">
    <a class="nav-link" href="AdminTraining.aspx">
        <i class="bi bi-person-rolodex"></i>
        <span>Training Page</span>
    </a>
</li>
              <li class="nav-item">
    <a class="nav-link" href="Admin_Training_Assign.aspx">
        <i class="bi bi-person-plus-fill"></i>
        <span>Training Assignment</span>
    </a>
</li>     
                     <li class="nav-item">
    <a class="nav-link" href="Training_Report.aspx">
        <i class="bi bi-file-spreadsheet"></i>
        <span>Training Report</span>
    </a>
</li>--%>     
   </ul>
        </aside>

        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    
    <main id="main" class="main" style="background-color: #cadcfc;">
        <div class="container">
            <div class="formarea">
                <section class="section dashboard">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                 <h5 class="card-title" style="text-align:center;background-color:#3f418d;color:white">Employee Creation</h5>
                                <section class="form-container section error-404 d-flex flex-column align-items-center justify-content-center" >
                                    <div class="row g-1 needs-validation"> <!-- Changed g-3 to g-1 for tighter spacing -->
                                        <div class="col-12 ">
                                            <label for="ddlBranch" class="form-label">Branch</label>
                                            <div class="custom-dropdown" data-dropdown="branch">
                                                <input type="text" class="dropdown-input form-control" readonly placeholder="Select Branch" />
                                                <span class="dropdown-arrow">▼</span>
                                                <div class="dropdown-options"></div>
                                            </div>
                                            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-select hidden-dropdown"  EnableViewState="true">
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-12 ">
                                            <label for="txtcode" class="form-label">Employee Code</label>
                                            <asp:TextBox ID="txtcode" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="rfvEmpCode" runat="server" 
        ControlToValidate="txtcode" ErrorMessage="Employee Code is required!" ForeColor="Red"
        ValidationGroup="EmployeeCreation" />
                                        </div>

                                        <div class="col-12 ">
                                            <label for="txtName" class="form-label">First Name</label>
                                            <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
        ControlToValidate="txtName" ErrorMessage="First Name is required!" ForeColor="Red"
        ValidationGroup="EmployeeCreation" />
                                        </div>

                                        <div class="col-12 ">
                                            <label for="txtLname" class="form-label">Last Name</label>
                                            <asp:TextBox ID="txtLname" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
        ControlToValidate="txtLname" ErrorMessage="Last Name is required!" ForeColor="Red"
        ValidationGroup="EmployeeCreation" />
                                        </div>
                                        <div class="col-12">
    <label for="ddlRole" class="form-label">Role</label>
    <div class="custom-dropdown" data-dropdown="role">
        <input type="text" class="dropdown-input form-control" readonly placeholder="Select Role" />
        <span class="dropdown-arrow">▼</span>
        <div class="dropdown-options"></div>
    </div>
    <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select hidden-dropdown">
        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
        <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
        <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
    </asp:DropDownList>
   
</div>

                                        <div class="col-12 ">
                                        <label for="txtMobno" class="form-label">Mobile Number</label>
                                        <asp:TextBox ID="txtMobno" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                      
                                       <asp:RequiredFieldValidator ID="rfvMobile" runat="server" 
        ControlToValidate="txtMobno" ErrorMessage="Mobile Number is required!" ForeColor="Red"
        ValidationGroup="EmployeeCreation" />
                                        <asp:RegularExpressionValidator 
                                            runat="server" 
                                            ControlToValidate="txtMobno" 
                                            CssClass="required-field" 
                                            ErrorMessage="Please enter a valid 10-digit mobile number!" 
                                            ValidationExpression="^\d{10}$" />
                                    </div>
<div class="col-12">
    <label for="txtAltMobno" class="form-label">Alternative Mobile Number</label>
    <asp:TextBox ID="txtAltMobno" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
    
    <asp:RegularExpressionValidator 
        runat="server" 
        ControlToValidate="txtAltMobno" 
        ValidationExpression="^\d{10}$" 
        ErrorMessage="Please enter a valid 10-digit mobile number (if provided)" 
        ForeColor="Red" />
</div>


<div class="col-12">
        <label for="txtOfcemail" class="form-label">Official Email</label>
       <asp:TextBox ID="txtOfcemail" runat="server" TextMode="Email" ClientIDMode="Static" CssClass="form-control" autocomplete="off"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
    ControlToValidate="txtOfcemail" ErrorMessage="Official Email is required!" ForeColor="Red"
    ValidationGroup="EmployeeCreation" />
    </div>
                                           <%-- <asp:RegularExpressionValidator 
                    runat="server" 
                    ControlToValidate="txtOfcemail" 
                    CssClass="required-field" 
                    ErrorMessage="Invalid email format!" 
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$">
                </asp:RegularExpressionValidator> auto
                                       --%>

                                        <div class="col-12">
    <label for="txtTempPassword" class="form-label">Temporary Password</label>
    <asp:TextBox ID="txtPassword" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
        ControlToValidate="txtPassword" ErrorMessage="Password is required!" ForeColor="Red"
        ValidationGroup="EmployeeCreation" />
</div>



                                        <%--<div class="col-12 ">
                                            <label for="ddldesignation" class="form-label">Designation</label>
                                            <asp:DropDownList ID="ddldesignation" runat="server" CssClass="form-select">
                                                  <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="FSE" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="FST" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>--%>
                                        <asp:Label ID="lblMessage" runat="server" CssClass="text-success" Visible="false"></asp:Label>
<div class="col-12 d-flex gap-2">
    <asp:Button ID="btn1" OnClick="btn1_Click" CssClass="btn btn-primary w-50" Text="Submit" 
        runat="server" ClientIDMode="Static" style="background-color:#3f418d; margin-top:10px;" />
    <asp:Button ID="btnClear" OnClick="btnClear_Click" CssClass="btn btn-warning w-50" Text="Cancel" 
        runat="server" ClientIDMode="Static" style="background-color:#cc4c4c; margin-top:10px; color: white;" />
</div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            
            <!-- Filter Section -->
            <div class="filter-container">
                <div class="form-row">
                    <div class="filter-group">
                        <label class="filter-label" for="ddlFilterRegion">Region</label>
                        <div class="custom-dropdown" data-dropdown="filterregion">
                            <input type="text" class="dropdown-input" placeholder="All Regions" readonly />
                            <span class="dropdown-arrow">&#9660;</span>
                            <div class="dropdown-options"></div>
                        </div>
                        <asp:DropDownList ID="ddlFilterRegion" runat="server" CssClass="hidden-dropdown" ClientIDMode="Static">
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <label class="filter-label" for="ddlFilterBranch">Branch</label>
                        <div class="custom-dropdown" data-dropdown="filterbranch">
                            <input type="text" class="dropdown-input" placeholder="All Branches" readonly />
                            <span class="dropdown-arrow">&#9660;</span>
                            <div class="dropdown-options"></div>
                        </div>
                        <asp:DropDownList ID="ddlFilterBranch" runat="server" CssClass="hidden-dropdown" ClientIDMode="Static">
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <label class="filter-label" for="ddlFilterEmployee">Employee</label>
                        <div class="custom-dropdown" data-dropdown="filteremployee">
                            <input type="text" class="dropdown-input" placeholder="All Employees" readonly />
                            <span class="dropdown-arrow">&#9660;</span>
                            <div class="dropdown-options"></div>
                        </div>
                        <asp:DropDownList ID="ddlFilterEmployee" runat="server" CssClass="hidden-dropdown" ClientIDMode="Static">
                        </asp:DropDownList>
                    </div>
                    
                    <div class="search-btn-container">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn-primary" />
                    </div>
                </div>
            </div>

          <section class="scrollable-container mt-4">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <div class="table-responsive">
        <div class="table-container">
  <asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="false"
    CssClass="mydatagrid table table-bordered"
    OnRowDeleting="GridView1_RowDeleting"
    OnRowDataBound="GridView1_RowDataBound"
    DataKeyNames="EmployeeId"
    Width="100%"
    CellSpacing="0"
    CellPadding="3">
    <Columns>
        <asp:TemplateField HeaderText="Emp Code" ItemStyle-Width="12%">
            <ItemTemplate>
                <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Eval("EmployeeCode") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="First Name" ItemStyle-Width="15%">
            <ItemTemplate>
                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Mobile" ItemStyle-Width="12%">
            <ItemTemplate>
                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("MobileNumber") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email" ItemStyle-Width="20%">
            <ItemTemplate>
                <asp:Label ID="lblMail" runat="server" Text='<%# Eval("OfficialMail") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Branch" ItemStyle-Width="15%">
            <ItemTemplate>
                <asp:Label ID="lblBranch" runat="server" Text='<%# Eval("BranchName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="12%">
            <ItemTemplate>
                <asp:LinkButton ID="btnEdit" runat="server" 
                    OnClick="btnEdit_Click" 
                    CssClass="edit-button" 
                    CausesValidation="false"
                    CommandArgument='<%# Eval("EmployeeId") %>'
                    ToolTip="Edit">
                    <i class="bi bi-pencil"></i>
                </asp:LinkButton>
                <asp:LinkButton ID="btnDelete" runat="server" 
                    CommandName="Delete" 
                    CssClass="delete-button" 
                    OnClientClick="return confirm('Are you sure you want to delete this employee?');" 
                    CausesValidation="false"
                    ToolTip="Delete">
                    <i class="bi bi-trash"></i>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
        </div>
    </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</section>


                    </div>
               
    </main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        initializeCustomDropdowns();
        setupCascadingDropdowns();
        syncFormDropdownsAfterPostback();
    });

    function syncFormDropdownsAfterPostback() {
        // Sync Branch dropdown
        var branchValue = $('#<%= ddlBranch.ClientID %>').val();
        var branchText = $('#<%= ddlBranch.ClientID %> option:selected').text();
        if (branchValue && branchValue !== '0') {
            var $branchDropdown = $('[data-dropdown="branch"]');
            $branchDropdown.find('.dropdown-input').val(branchText).attr('data-value', branchValue);
        }

        // Sync Role dropdown
        var roleValue = $('#<%= ddlRole.ClientID %>').val();
        var roleText = $('#<%= ddlRole.ClientID %> option:selected').text();
        if (roleValue && roleValue !== '0') {
            var $roleDropdown = $('[data-dropdown="role"]');
            $roleDropdown.find('.dropdown-input').val(roleText).attr('data-value', roleValue);
        }
    }

    function initializeCustomDropdowns() {
        syncDropdownData('branch', '<%= ddlBranch.ClientID %>');
        syncDropdownData('role', '<%= ddlRole.ClientID %>');
        syncDropdownData('filterregion', '<%= ddlFilterRegion.ClientID %>');
        syncDropdownData('filterbranch', '<%= ddlFilterBranch.ClientID %>');
        syncDropdownData('filteremployee', '<%= ddlFilterEmployee.ClientID %>');

        if (!window.dropdownEventsInitialized) {
            bindDropdownEvents();
            window.dropdownEventsInitialized = true;
        }
    }

    function setupCascadingDropdowns() {
        // Handle region change to filter branches
        $(document).on('dropdown:changed', '[data-dropdown="filterregion"]', function (e, selectedValue, selectedText) {
            var regionName = selectedValue === "All" ? "All" : selectedText;

            // Clear branch dropdown
            var $branchDropdown = $('[data-dropdown="filterbranch"]');
            var $branchInput = $branchDropdown.find('.dropdown-input');
            var $branchOptions = $branchDropdown.find('.dropdown-options');
            var $branchAspDropdown = $('#<%= ddlFilterBranch.ClientID %>');

            $branchInput.val('All Branches').attr('data-value', 'All');
            $branchAspDropdown.val('All');
            $branchOptions.empty();

            // Clear employee dropdown
            var $employeeDropdown = $('[data-dropdown="filteremployee"]');
            var $employeeInput = $employeeDropdown.find('.dropdown-input');
            var $employeeOptions = $employeeDropdown.find('.dropdown-options');
            var $employeeAspDropdown = $('#<%= ddlFilterEmployee.ClientID %>');

            $employeeInput.val('All Employees').attr('data-value', 'All');
            $employeeAspDropdown.val('All');
            $employeeOptions.empty();

            // If "All Regions" is selected, load all branches
            if (regionName === "All") {
                loadAllBranches();
                loadAllEmployees();
                return;
            }

            // Load branches for selected region via AJAX
            $.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/Employeecreation.aspx/GetFilterBranches") %>',
                data: JSON.stringify({ regionName: regionName }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var branches = response.d || response;

                    // Update branch dropdown
                    $branchOptions.empty();
                    $branchAspDropdown.empty();

                    branches.forEach(function (branch) {
                        // Update custom dropdown
                        var $option = $('<div class="dropdown-option"></div>')
                            .text(branch.text)
                            .attr('data-value', branch.value);
                        $branchOptions.append($option);

                        // Update hidden ASP dropdown
                        $branchAspDropdown.append($('<option></option>')
                            .attr('value', branch.value)
                            .text(branch.text));
                    });

                    // Set default selection
                    $branchAspDropdown.val('All');
                    $branchDropdown.data('all-options', branches);

                    // Trigger branch change to update employees
                    $(document).trigger('dropdown:changed', [$branchDropdown, 'All', 'All Branches']);
                },
                error: function (xhr, status, error) {
                    console.error("Error loading branches: ", error);
                }
            });
        });

        // Handle branch change to filter employees
        $(document).on('dropdown:changed', '[data-dropdown="filterbranch"]', function (e, selectedValue, selectedText) {
            var branchName = selectedValue === "All" ? "All" : selectedText;
            var regionValue = $('[data-dropdown="filterregion"]').find('.dropdown-input').attr('data-value');
            var regionName = regionValue === "All" ? "All" : $('[data-dropdown="filterregion"]').find('.dropdown-input').val();

            // Clear employee dropdown
            var $employeeDropdown = $('[data-dropdown="filteremployee"]');
            var $employeeInput = $employeeDropdown.find('.dropdown-input');
            var $employeeOptions = $employeeDropdown.find('.dropdown-options');
            var $employeeAspDropdown = $('#<%= ddlFilterEmployee.ClientID %>');

            $employeeInput.val('All Employees').attr('data-value', 'All');
            $employeeAspDropdown.val('All');
            $employeeOptions.empty();

            // Load employees based on region and branch
            $.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/Employeecreation.aspx/GetFilterEmployees") %>',
                data: JSON.stringify({ 
                    branchName: branchName, 
                    regionName: regionName 
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var employees = response.d || response;
                    
                    // Update employee dropdown
                    $employeeOptions.empty();
                    $employeeAspDropdown.empty();
                    
                    employees.forEach(function(employee) {
                        // Update custom dropdown
                        var $option = $('<div class="dropdown-option"></div>')
                            .text(employee.text)
                            .attr('data-value', employee.value);
                        $employeeOptions.append($option);
                        
                        // Update hidden ASP dropdown
                        $employeeAspDropdown.append($('<option></option>')
                            .attr('value', employee.value)
                            .text(employee.text));
                    });
                    
                    // Set default selection
                    $employeeAspDropdown.val('All');
                    $employeeDropdown.data('all-options', employees);
                },
                error: function (xhr, status, error) {
                    console.error("Error loading employees: ", error);
                }
            });
        });
    }

    function loadAllBranches() {
        $.ajax({
            type: "POST",
            url: '<%= ResolveUrl("~/Employeecreation.aspx/GetFilterBranches") %>',
            data: JSON.stringify({ regionName: "All" }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var branches = response.d || response;
                var $branchDropdown = $('[data-dropdown="filterbranch"]');
                var $branchOptions = $branchDropdown.find('.dropdown-options');
                var $branchAspDropdown = $('#<%= ddlFilterBranch.ClientID %>');
                
                $branchOptions.empty();
                $branchAspDropdown.empty();
                
                branches.forEach(function(branch) {
                    var $option = $('<div class="dropdown-option"></div>')
                        .text(branch.text)
                        .attr('data-value', branch.value);
                    $branchOptions.append($option);
                    
                    $branchAspDropdown.append($('<option></option>')
                        .attr('value', branch.value)
                        .text(branch.text));
                });
                
                $branchAspDropdown.val('All');
                $branchDropdown.data('all-options', branches);
            }
        });
    }

    function loadAllEmployees() {
        $.ajax({
            type: "POST",
            url: '<%= ResolveUrl("~/Employeecreation.aspx/GetFilterEmployees") %>',
            data: JSON.stringify({ 
                branchName: "All", 
                regionName: "All" 
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var employees = response.d || response;
                var $employeeDropdown = $('[data-dropdown="filteremployee"]');
                var $employeeOptions = $employeeDropdown.find('.dropdown-options');
                var $employeeAspDropdown = $('#<%= ddlFilterEmployee.ClientID %>');
                
                $employeeOptions.empty();
                $employeeAspDropdown.empty();
                
                employees.forEach(function(employee) {
                    var $option = $('<div class="dropdown-option"></div>')
                        .text(employee.text)
                        .attr('data-value', employee.value);
                    $employeeOptions.append($option);
                    
                    $employeeAspDropdown.append($('<option></option>')
                        .attr('value', employee.value)
                        .text(employee.text));
                });
                
                $employeeAspDropdown.val('All');
                $employeeDropdown.data('all-options', employees);
            }
        });
    }

    function syncDropdownData(dropdownType, aspDropdownId) {
        var $aspDropdown = $('#' + aspDropdownId);
        var $customDropdown = $('[data-dropdown="' + dropdownType + '"]');
        var $dropdownOptions = $customDropdown.find('.dropdown-options');
        var $input = $customDropdown.find('.dropdown-input');

        var options = [];
        $aspDropdown.find('option').each(function () {
            options.push({
                value: $(this).val(),
                text: $(this).text()
            });
        });

        $dropdownOptions.hide().empty();
        var selectedValue = $aspDropdown.val();

        options.forEach(function (option) {
            var $option = $('<div class="dropdown-option"></div>')
                .text(option.text)
                .attr('data-value', option.value);
            if (option.value === selectedValue) {
                $option.addClass('selected');
            }
            $dropdownOptions.append($option);
        });

        var selectedText = $aspDropdown.find('option:selected').text();
        $input.val(selectedText).attr('data-value', selectedValue);
        $customDropdown.data('all-options', options);
    }

    function bindDropdownEvents() {
        $(document).off('click', '.dropdown-input').on('click', '.dropdown-input', function(e) {
            e.stopPropagation();
            
            var $dropdown = $(this).closest('.custom-dropdown');
            var $options = $dropdown.find('.dropdown-options');
            
            $('.dropdown-options').not($options).hide();
            $('.dropdown-input').not($(this)).attr('readonly', true);
            $('.dropdown-arrow').not($dropdown.find('.dropdown-arrow')).removeClass('open');
            $('.custom-dropdown').not($dropdown).removeClass('open');
            
            if ($options.is(':visible')) {
                $options.hide();
                $(this).attr('readonly', true);
                $dropdown.find('.dropdown-arrow').removeClass('open');
                $dropdown.removeClass('open');
            } else {
                showAllOptions($dropdown);
                $options.show();
                var $input = $(this);
                $input.removeAttr('readonly');
                
                // Use setTimeout to ensure cursor positioning happens after focus
                setTimeout(function() {
                    $input.focus();
                    var textLength = $input.val().length;
                    $input[0].setSelectionRange(textLength, textLength);
                }, 0);
                
                $dropdown.find('.dropdown-arrow').addClass('open');
                $dropdown.addClass('open');
            }
        });

        $(document).off('input', '.dropdown-input').on('input', '.dropdown-input', function() {
            var $dropdown = $(this).closest('.custom-dropdown');
            var searchTerm = $(this).val().toLowerCase();
            
            if (searchTerm === '') {
                showAllOptions($dropdown);
            } else {
                filterOptions($dropdown, searchTerm);
            }
        });

        $(document).off('click', '.dropdown-option').on('click', '.dropdown-option', function(e) {
            e.stopPropagation();
            
            var $dropdown = $(this).closest('.custom-dropdown');
            var $input = $dropdown.find('.dropdown-input');
            var $options = $dropdown.find('.dropdown-options');
            var dropdownType = $dropdown.data('dropdown');
            
            var value = $(this).attr('data-value');
            var text = $(this).text();
            
            $options.find('.dropdown-option').removeClass('selected');
            $(this).addClass('selected');
            
            $input.val(text).attr('data-value', value);
            
            var aspDropdownId = getAspDropdownId(dropdownType);
            $('#' + aspDropdownId).val(value);
            
            // Trigger custom event for cascading dropdowns
            $(document).trigger('dropdown:changed', [$dropdown, value, text]);
            
            $options.hide();
            $dropdown.find('.dropdown-arrow').removeClass('open');
            $dropdown.removeClass('open');
            $input.attr('readonly', true);
        });

        $(document).on('click.dropdown', function(e) {
            if (!$(e.target).closest('.custom-dropdown').length) {
                $('.custom-dropdown').each(function() {
                    $(this).find('.dropdown-options').hide();
                    $(this).find('.dropdown-arrow').removeClass('open');
                    $(this).removeClass('open');
                    $(this).find('.dropdown-input').attr('readonly', true);
                });
            }
        });
    }

    function showAllOptions($dropdown) {
        var allOptions = $dropdown.data('all-options') || [];
        var $options = $dropdown.find('.dropdown-options');
        var selectedValue = $dropdown.find('.dropdown-input').attr('data-value');
        
        $options.empty();
        
        allOptions.forEach(function(option) {
            var $optionDiv = $('<div class="dropdown-option"></div>')
                .text(option.text)
                .attr('data-value', option.value);
                
            if (option.value === selectedValue) {
                $optionDiv.addClass('selected');
            }
            
            $options.append($optionDiv);
        });
    }

    function filterOptions($dropdown, searchTerm) {
        var allOptions = $dropdown.data('all-options') || [];
        var $options = $dropdown.find('.dropdown-options');
        var selectedValue = $dropdown.find('.dropdown-input').attr('data-value');
        var hasResults = false;
        
        $options.empty();
        
        allOptions.forEach(function(option) {
            if (option.text.toLowerCase().includes(searchTerm)) {
                var $optionDiv = $('<div class="dropdown-option"></div>')
                    .text(option.text)
                    .attr('data-value', option.value);
                    
                if (option.value === selectedValue) {
                    $optionDiv.addClass('selected');
                }
                
                $options.append($optionDiv);
                hasResults = true;
            }
        });
        
        if (!hasResults) {
            $options.append('<div class="no-results">No results found</div>');
        }
    }

    function getAspDropdownId(dropdownType) {
        switch(dropdownType) {
            case 'branch':
                return '<%= ddlBranch.ClientID %>';
            case 'role':
                return '<%= ddlRole.ClientID %>';
            case 'filterregion':
                return '<%= ddlFilterRegion.ClientID %>';
            case 'filterbranch':
                return '<%= ddlFilterBranch.ClientID %>';
            case 'filteremployee':
                return '<%= ddlFilterEmployee.ClientID %>';
            default:
                return '';
        }
    }

    // AJAX Cascading for Filter Dropdowns
    $(document).ready(function() {
        setupFilterCascading();
    });

    function setupFilterCascading() {
        // When filter region dropdown option is clicked
        $('[data-dropdown="filterregion"]').on('click', '.dropdown-option', function() {
            var regionValue = $(this).attr('data-value');
            
            if (regionValue && regionValue !== 'All') {
                // Freeze branch and employee dropdowns
                freezeFilterDropdown('filterbranch');
                freezeFilterDropdown('filteremployee');
                
                // Load branches for selected region
                $.ajax({
                    type: "POST",
                    url: "Employeecreation.aspx/GetFilterBranches",
                    data: JSON.stringify({ regionName: regionValue }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(response) {
                        updateFilterDropdown('filterbranch', response.d);
                        resetFilterDropdown('filteremployee');
                        unfreezeFilterDropdown('filterbranch');
                        unfreezeFilterDropdown('filteremployee');
                    },
                    error: function(xhr, status, error) {
                        console.error("Error loading branches:", error);
                        unfreezeFilterDropdown('filterbranch');
                        unfreezeFilterDropdown('filteremployee');
                    }
                });
            } else {
                // If "All" is selected, reset branch and employee
                resetFilterDropdown('filterbranch');
                resetFilterDropdown('filteremployee');
            }
        });

        // When filter branch dropdown option is clicked
        $('[data-dropdown="filterbranch"]').on('click', '.dropdown-option', function() {
            var branchValue = $(this).attr('data-value');
            var regionValue = $('#ddlFilterRegion').val();
            
            if (branchValue && branchValue !== 'All') {
                // Freeze employee dropdown
                freezeFilterDropdown('filteremployee');
                
                // Load employees for selected branch and region
                $.ajax({
                    type: "POST",
                    url: "Employeecreation.aspx/GetFilterEmployees",
                    data: JSON.stringify({ branchName: branchValue, regionName: regionValue }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(response) {
                        updateFilterDropdown('filteremployee', response.d);
                        unfreezeFilterDropdown('filteremployee');
                    },
                    error: function(xhr, status, error) {
                        console.error("Error loading employees:", error);
                        unfreezeFilterDropdown('filteremployee');
                    }
                });
            } else {
                // If "All" is selected, reset employee
                resetFilterDropdown('filteremployee');
            }
        });
    }

    function updateFilterDropdown(dropdownType, options) {
        var $dropdown = $('[data-dropdown="' + dropdownType + '"]');
        var $aspDropdown = $('#' + getAspDropdownId(dropdownType));
        var $input = $dropdown.find('.dropdown-input');
        var $optionsContainer = $dropdown.find('.dropdown-options');
        
        // Clear ASP dropdown
        $aspDropdown.empty();
        
        // Clear custom dropdown options
        $optionsContainer.empty();
        
        // Add options
        options.forEach(function(option) {
            // Add to ASP dropdown
            $aspDropdown.append($('<option></option>').val(option.value).text(option.text));
            
            // Add to custom dropdown
            var $optionDiv = $('<div class="dropdown-option"></div>')
                .text(option.text)
                .attr('data-value', option.value);
            
            if (option.value === 'All') {
                $optionDiv.addClass('selected');
                $input.val(option.text);
            }
            
            $optionsContainer.append($optionDiv);
        });
        
        // Set ASP dropdown to "All"
        $aspDropdown.val('All');
        
        // Store options for search functionality
        $dropdown.data('all-options', options);
    }

    function resetFilterDropdown(dropdownType) {
        var $dropdown = $('[data-dropdown="' + dropdownType + '"]');
        var $aspDropdown = $('#' + getAspDropdownId(dropdownType));
        var $input = $dropdown.find('.dropdown-input');
        var $optionsContainer = $dropdown.find('.dropdown-options');
        
        var defaultText = dropdownType === 'filterbranch' ? 'All Branches' : 'All Employees';
        
        // Clear and reset ASP dropdown
        $aspDropdown.empty().append($('<option></option>').val('All').text(defaultText));
        
        // Clear and reset custom dropdown
        $optionsContainer.empty().append(
            $('<div class="dropdown-option selected"></div>')
                .text(defaultText)
                .attr('data-value', 'All')
        );
        
        // Update input
        $input.val(defaultText);
        
        // Store default option
        $dropdown.data('all-options', [{ value: 'All', text: defaultText }]);
    }

    function freezeFilterDropdown(dropdownType) {
        var $dropdown = $('[data-dropdown="' + dropdownType + '"]');
        var $input = $dropdown.find('.dropdown-input');
        
        $input.addClass('frozen').prop('disabled', true);
        $dropdown.addClass('loading');
    }

    function unfreezeFilterDropdown(dropdownType) {
        var $dropdown = $('[data-dropdown="' + dropdownType + '"]');
        var $input = $dropdown.find('.dropdown-input');
        
        $input.removeClass('frozen').prop('disabled', false);
        $dropdown.removeClass('loading');
    }
</script>
    

</asp:Content>