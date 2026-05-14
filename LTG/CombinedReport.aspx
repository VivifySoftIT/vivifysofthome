
<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CombinedReport.aspx.cs" Inherits="LTG.CombinedReport" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Filter Container Styles from AdminPage */
        .filter-container {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .form-row {
            display: flex;
            align-items: end;
            flex-wrap: nowrap;
            gap: 10px;
            margin-bottom: 10px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            flex: 1;
            min-width: 120px;
        }

        .filter-label {
            font-size: 12px;
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
            white-space: nowrap;
        }

        .filter-control {
            width: 100%;
            padding: 6px 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            background-color: white;
            height: 34px;
            box-sizing: border-box;
        }

        .filter-control:focus {
            outline: none;
            border-color: #3f418d;
            box-shadow: 0 0 0 2px rgba(63, 65, 141, 0.2);
        }

        .search-btn-container {
            display: flex;
            align-items: end;
            margin-top: 0;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-wrap: wrap;
                gap: 10px;
            }
            
            .filter-group {
                min-width: calc(50% - 10px);
            }
        }

        /* Searchable Dropdown Styles */
        .custom-dropdown {
            position: relative;
            width: 100%;
        }

        .custom-dropdown.open {
            z-index: 10001;
        }

        .dropdown-input {
            width: 100%;
            padding: 6px 30px 6px 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            background-color: white;
            height: 34px;
            box-sizing: border-box;
            cursor: text;
            outline: none;
        }

        .dropdown-input:focus {
            border-color: #3f418d;
            box-shadow: 0 0 0 2px rgba(63, 65, 141, 0.2);
        }

        .dropdown-arrow {
            position: absolute !important;
            right: 8px !important;
            top: 11px !important;
            transform: none !important;
            font-size: 12px !important;
            color: #666 !important;
            pointer-events: none !important;
            transition: none !important;
            z-index: 1 !important;
            backface-visibility: hidden !important;
            will-change: auto !important;
            width: 12px !important;
            height: 12px !important;
            text-align: center !important;
            line-height: 12px !important;
            animation: none !important;
            opacity: 1 !important;
            margin: 0 !important;
            padding: 0 !important;
            display: block !important;
        }

        .dropdown-arrow.open {
            transform: none !important;
            transition: none !important;
            top: 11px !important;
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

        /* Hide original dropdowns */
        .hidden-dropdown {
            display: none !important;
        }

        /* Loading state styles */
        .custom-dropdown.loading {
            opacity: 0.7;
            pointer-events: none;
        }

        .custom-dropdown.loading .dropdown-input {
            background-color: #d4e5f7 !important;
            border-color: #1E73D8 !important;
        }

        .custom-dropdown.loading .dropdown-arrow {
            animation: pulse 1.5s ease-in-out infinite;
            color: #1E73D8 !important;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        /* Freeze during AJAX to prevent shaking */
        .filter-container.postback-freeze {
            pointer-events: none;
            position: relative;
        }

        .filter-container.postback-freeze * {
            transition: none !important;
            animation: none !important;
            transform: translateZ(0) !important;
            backface-visibility: hidden !important;
        }

        .filter-container.postback-freeze .filter-control,
        .filter-container.postback-freeze .dropdown-input {
            background-color: white !important;
            border-color: #ddd !important;
            opacity: 1 !important;
            position: relative !important;
        }

        .filter-container.postback-freeze .dropdown-arrow {
            transform: none !important;
            animation: none !important;
            transition: none !important;
            opacity: 1 !important;
            position: absolute !important;
            right: 8px !important;
            top: 11px !important;
            font-size: 12px !important;
            color: #666 !important;
            will-change: auto !important;
            backface-visibility: hidden !important;
        }

        .custom-dropdown.frozen {
            pointer-events: none;
            opacity: 0.95;
            position: relative;
            transform: translateZ(0) !important;
            backface-visibility: hidden !important;
        }

        .custom-dropdown.frozen .dropdown-input {
            transition: none !important;
            transform: translateZ(0) !important;
            backface-visibility: hidden !important;
            position: relative !important;
            width: 100% !important;
            height: 34px !important;
        }

        .custom-dropdown.frozen .dropdown-arrow {
            transition: none !important;
            transform: none !important;
            backface-visibility: hidden !important;
            animation: none !important;
            opacity: 1 !important;
            position: absolute !important;
            right: 8px !important;
            top: 11px !important;
            font-size: 12px !important;
            color: #666 !important;
            will-change: auto !important;
        }

        .mydatagrid th, .mydatagrid td {
            border: 1px solid black;
            padding: 8px;
            margin: 0;
            width:200px;
            align-items:center;
             margin-bottom: 20px; 
        }
        .mydatagrid {
    width: 100%;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
}
        .mydatagrid td{
            background-color:white;
        }
        .mydatagrid th {
            background-color: #3f418d;
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        .scrollable-container {
            max-height: 400px;
            overflow-x: auto;
            overflow-y: auto;
            border: 0px solid #ccc;
            margin-bottom: 10px;
            width:400px;
                -webkit-overflow-scrolling: touch; /* Smooth scrolling for mobile devices */

        }
            .toggle-sidebar-btn {
     font-size: 40px;
     color:midnightblue;
 }
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

.sidebar-nav .nav-link i {
    font-size: 14px; /* Smaller icons */
    margin-right: 6px; /* Reduced spacing */
}

.sidebar-nav .nav-link span {
    white-space: nowrap; /* Prevent text wrapping */
    overflow: hidden;
    text-overflow: ellipsis; /* Add ellipsis if text is too long */
}

 .sidebar-nav .nav-link:hover {
        color: red;
        transition: background 0.3s, color 0.3s, border 0.3s; 
        border : 2px solid #222b65;
        box-shadow: 0 2px 10px #1f2b60;
    }

.sidebar-nav .nav-link.active {
    background-color: #222b65;
    color: white;
}

.sidebar-nav .nav-item {
    margin-bottom: 6px; /* Further reduced space */
}

.sidebar-nav {
    padding: 0;
    margin: 0;
    list-style: none;
}
                    .footer {
        background-color:rgb(249, 243, 243);
        text-align: center;
        padding:10px;
        color: ghostwhite;
        margin:0px;
    }
    
    .footer a {
        color: midnightblue;
        text-decoration: none;
    }
    
    .footer a:hover {
        text-decoration: underline;
    }

    .btn-primary{
        background-color:#3f418d;
    }
     .btn-primary:hover{
     background-color:#3f418d;
 }

/* Adjust main content area to accommodate smaller sidebar */
.main {
    margin-left: 200px; /* Match sidebar width */
}

/* For mobile responsiveness */
@media (max-width: 768px) {
    .sidebar {
        width: 180px; /* Even smaller on mobile */
        min-width: 180px;
        max-width: 180px;
    }
    
    .main {
        margin-left: 180px;
    }
    
    .sidebar-nav .nav-link {
        font-size: 11px;
        padding: 6px 10px;
    }
    
    .sidebar-nav .nav-link i {
        font-size: 13px;
    }
}
        .content {
            margin-left: 10px;
            padding: 20px;
            background-color: #cadcfc;
        }
       .footer {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgb(249, 243, 243); /* Footer background color */
    text-align: center; /* Center footer text */
    padding: 10px; /* Padding for footer */
    color: ghostwhite; /* Footer text color */
    z-index: 1000; /* Ensure it's above other content */
}

.footer a {
    color: midnightblue; /* Link color in footer */
    text-decoration: none; /* Remove underline from links */
}

.footer a:hover {
    text-decoration: underline; /* Underline on hover */
}
  /*.blue-background {
            background-color: #007bff;*/ /* Blue background */
            /*color: white;*/ /* White text for contrast */
            /*border: 3px solid #000000;*/ /* Black border */
        /*}*/
.local-tour-border {
    border: 3px solid #FF5733;  /* Orange border for Local & Tour Total */
    background-color: #007bff;  /* Blue background */
    color: white;  /* Text color to white to make it stand out on the blue background */
}

.expense-total-border {
    border: 3px solid #28a745;  /* Green border for Expense Total */
    background-color: #007bff;  /* Blue background */
    color: white;  /* Text color to white */
}

.department-total-border {
    border: 3px solid #007bff;  /* Blue border for Department Total */
    background-color: #007bff;  /* Blue background */
    color: white;  /* Text color to white */
}

 .label {
    display: block;
    margin-bottom: 5px;
    color: black;
    font-weight: bold;
}

@media (max-width: 767px) {
    .d-flex {
        flex-direction: column;
    }
    .col-12 {
        width: 100%;
    }
}

         .content {
    margin-left: 10px; /* Adjust margin to fit sidebar */
    padding: 20px;
    background-color: #cadcfc;
    min-height: calc(100vh - 40px); /* Ensures content fills available height minus footer */
    padding-bottom: 50px; /* To ensure content doesn't overlap footer */
    box-sizing: border-box; /* Includes padding in height calculation */
    flex: 1;
}
         .grid-container {
    margin-bottom: 20px;
}

/* Mobile responsiveness */
        @media (max-width: 768px) {
            .mobile-card {
                display: flex;
                flex-direction: column;
                background-color: #ffffff;
                border: 1px solid #ccc;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 15px;
                margin-bottom: 20px;
            }
        }
        
    </style>

             <aside id="sidebar" class="sidebar" style="box-shadow: 0 2px 10px rgba(63, 65, 141, 0.3);">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link" href="AdminPage.aspx">
                    <i class="bi bi-pc-display"></i>
                    <span>Expense Page</span>
                </a>
            </li>
           <li class="nav-item">
  <a class="nav-link" href="TravelExpensePage.aspx">
    <i class="bi bi-geo-alt"></i>
    <span>Travel Expense Page</span>
  </a>
</li>

<li class="nav-item">
  <a class="nav-link" href="TravelReport.aspx">
    <i class="bi bi-map"></i>
    <span>Travel Report</span>
  </a>
</li>

            <li class="nav-item">
                <a class="nav-link" href="Employeecreation.aspx">
                    <i class="bi bi-person-circle"></i>
                    <span>Employee Creation</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminCustomer_Creation.aspx">
                    <i class="bi bi-person-workspace"></i>
                    <span>Customer Creation</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminService_Assign.aspx">
                    <i class="bi bi-diagram-3"></i>
                    <span>Service Assignment</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="RefreshmentVerify.aspx">
                 <i class="bi bi-file-check"></i>
                    <span>Refreshment Verify</span>
                </a>
            </li>
            <li class="nav-item">
    <a class="nav-link" href="RefreshmentReport.aspx">
        <i class="bi-file-earmark-text"></i> 
        <span>Refreshment Report</span>
    </a>
</li> 
            <li class="nav-item">
                <a class="nav-link" href="Reportform.aspx">
                    <i class="bi bi-filetype-exe"></i>
                    <span>Expense Report</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="CombinedReport.aspx">
                    <i class="bi bi-folder-fill"></i>
                    <span>Combined Report</span>
                </a>
            </li>
            <li class="nav-item">
  <a class="nav-link" href="SmithReport.aspx">
    <i class="bi bi-journal-text"></i>
    <span>Smith Report</span>
  </a>
</li>
            <li class="nav-item">
                <a class="nav-link" href="DocView.aspx">
                    <i class="bi bi-file-earmark-pdf-fill"></i>
                    <span>Attachment</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AdminTraining.aspx">
                    <i class="bi bi-person-rolodex"></i>
                    <span>Training Page</span>
                </a>
            </li>
        </ul>
    </aside>


    <div class="content">
        <main id="main" class="main">
            <section class="section dashboard">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <h5 class="card-title" style="text-align:center;background-color:#3f418d;color:white">Combined Report</h5>
                            
                            <div class="filter-container">
                                <div class="form-row">
                                    <div class="filter-group">
                                        <label class="filter-label" for="TextBox1">From Date</label>
                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="date" CssClass="filter-control"></asp:TextBox>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="TextBox2">To Date</label>
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="date" CssClass="filter-control"></asp:TextBox>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="ddlRegion">Region</label>
                                        <div class="custom-dropdown" data-dropdown="region">
                                            <input type="text" class="dropdown-input" placeholder="Search region..." readonly />
                                            <span class="dropdown-arrow">&#9660;</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlRegion" runat="server" AutoPostBack="true" 
                                            OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" CssClass="hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="ddlBranch">Branch Name</label>
                                        <div class="custom-dropdown" data-dropdown="branch">
                                            <input type="text" class="dropdown-input" placeholder="Search branch..." readonly />
                                            <span class="dropdown-arrow">&#9660;</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="hidden-dropdown"></asp:DropDownList>
                                    </div>

                                    <div class="search-btn-container">
                                        <asp:Button ID="btnFilter" runat="server" Text="Search" OnClick="btnFilter_Click" CssClass="btn-primary" 
                                            style="background-color:#3f418d !important;color:white !important;padding:8px 20px;border:none;border-radius:4px;font-size:14px;font-weight:600;cursor:pointer;min-width:120px;height:34px;"/>
                                    </div>
                                </div>
                            </div>

                            <section class="form-container section error-404 d-flex flex-column align-items-center justify-content-center" >
                                <br />

                              
                                <h2  style="margin-top:10px;text-align:center">Summary Report</h2>
                                  <div class="scrollable-container" style="width: 75%; overflow-x: auto;">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                              
                                    <asp:GridView ID="gvExpenseReport" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid" >
    <Columns>
        <asp:BoundField DataField="EngineerName" HeaderText="Engineer Name" SortExpression="EngineerName" />
        <asp:BoundField DataField="LocalExpenses" HeaderText="LocalExpenses" />
        <asp:BoundField DataField="TourExpenses" HeaderText="TourExpenses" />
                <asp:BoundField DataField="RefreshmentAmount" HeaderText="Refreshment Amount" />

        <asp:BoundField DataField="OverallExpenses" HeaderText=" TotalExpenses" />
    </Columns>
</asp:GridView>

                                </div>
                                  

                               <%-- <h2  style="margin-top:10px;">SMO Report</h2>--%>
                                <%--<h2 style="margin-top:10px;">SMO Summary Report</h2>--%>
<div class="grid-container mobile-card">
    <div class="scrollable-container" style="width: 100%; overflow-x: auto;">
        <asp:GridView ID="gvSmoReport" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid">
            <Columns>
                <asp:BoundField DataField="SmoNo" HeaderText="SMO Number" />
                <asp:BoundField DataField="TotalClaimedAmount" HeaderText="Expenses" DataFormatString="{0:F2}" />
            </Columns>
        </asp:GridView>
    </div>
</div>

<%--<h2 style="margin-top:10px;">SO Summary Report</h2>--%>
<div class="grid-container mobile-card">
    <div class="scrollable-container" style="width: 100%; overflow-x: auto;">
        <asp:GridView ID="gvSoReport" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid">
            <Columns>
                <asp:BoundField DataField="SoNo" HeaderText="SO Number" />
                <asp:BoundField DataField="TotalClaimedAmount" HeaderText="Expenses" DataFormatString="{0:F2}" />
            </Columns>
        </asp:GridView>
    </div>
</div>
                          <%--  <h2  style="margin-top:10px;">Export Report</h2>--%>
                         
<%--<h2  style="margin-top:10px;" >Local & Tour Summary</h2>--%>
                                <div class="grid-container mobile-card">
<asp:GridView ID="gvLocalTour" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid">
    <Columns>
        <asp:BoundField DataField="ExpenseCategory" HeaderText="Expense Type" />
        <asp:BoundField DataField="TotalAmount" HeaderText="Expenses"  />
    </Columns>
</asp:GridView>
</div>

<%--<h2  style="margin-top:10px;">Expense Categories</h2>--%>
                                <div class="grid-container mobile-card">
<asp:GridView ID="gvExpenseCategories" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid ">
    <Columns>
        <asp:BoundField DataField="ExpenseCategory" HeaderText="Expense Type" SortExpression="ExpenseCategory" />
        <asp:BoundField DataField="TotalAmount" HeaderText="Expenses" SortExpression="TotalAmount" />
    </Columns>
</asp:GridView>
                                    </div>


<%--<h2  style="margin-top:10px;">Department Totals</h2>--%>
<asp:GridView ID="gvDepartmentTotals" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid ">
    <Columns>
        
        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
        
        
        <asp:BoundField DataField="TotalAmount" HeaderText="Expenses" SortExpression="TotalAmount" 
            HtmlEncode="false" />
    </Columns>
</asp:GridView>

                        </section>
                    </div>
                </div>
            </div>
        </section>

        <asp:Button ID="btnGenerate" runat="server" Text="Generate Excel" OnClick="btnGenerate_Click" CssClass="btn-primary" style="background-color:#3f418d; color:white;"/>
    </main>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        initializeCustomDropdowns();
    });

    function initializeCustomDropdowns() {
        syncDropdownData('region', '<%= ddlRegion.ClientID %>');
        syncDropdownData('branch', '<%= ddlBranch.ClientID %>');
        
        if (!window.dropdownEventsInitialized) {
            bindDropdownEvents();
            window.dropdownEventsInitialized = true;
        }
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
            
            if ($options.is(':visible')) {
                $options.hide();
                $(this).attr('readonly', true);
            } else {
                $options.show();
                $(this).removeAttr('readonly').focus();
                showAllOptions($dropdown);
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
            var $option = $(this);
            var $dropdown = $option.closest('.custom-dropdown');
            var dropdownType = $dropdown.attr('data-dropdown');
            var value = $option.attr('data-value');
            var text = $option.text();
            
            var $input = $dropdown.find('.dropdown-input');
            $input.val(text).attr('data-value', value);
            $dropdown.find('.dropdown-option').removeClass('selected');
            $option.addClass('selected');
            
            var aspDropdownId = getAspDropdownId(dropdownType);
            $('#' + aspDropdownId).val(value);
            
            $dropdown.find('.dropdown-options').hide();
            $input.attr('readonly', true);
            
            if (dropdownType === 'region') {
                loadBranchesAjax(value);
            }
        });

        $(document).on('click.dropdown', function(e) {
            if (!$(e.target).closest('.custom-dropdown').length) {
                $('.custom-dropdown').each(function() {
                    $(this).find('.dropdown-options').hide();
                    $(this).find('.dropdown-input').attr('readonly', true);
                });
            }
        });
    }

    function loadBranchesAjax(regionValue) {
        // Add loading state to branch dropdown
        $('[data-dropdown="branch"]').addClass('loading');
        
        // Freeze all dropdowns to prevent shaking
        $('.custom-dropdown').addClass('frozen');
        $('.filter-container').addClass('postback-freeze');

        $.ajax({
            type: "POST",
            url: "CombinedReport.aspx/GetBranches",
            data: JSON.stringify({ regionName: regionValue }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                // Update branch dropdown
                updateDropdownOptions('branch', response.d);
                
                // Remove freeze and loading
                setTimeout(function() {
                    $('.custom-dropdown').removeClass('frozen loading');
                    $('.filter-container').removeClass('postback-freeze');
                }, 50);
            },
            error: function() {
                console.error('Error loading branches');
                $('.custom-dropdown').removeClass('frozen loading');
                $('.filter-container').removeClass('postback-freeze');
            }
        });
    }

    function updateDropdownOptions(dropdownType, options) {
        var $customDropdown = $('[data-dropdown="' + dropdownType + '"]');
        var $aspDropdown = $('#' + getAspDropdownId(dropdownType));
        var $dropdownOptions = $customDropdown.find('.dropdown-options');
        var $input = $customDropdown.find('.dropdown-input');

        // Clear existing options
        $aspDropdown.empty();
        $dropdownOptions.empty();

        // Add new options
        options.forEach(function(option) {
            // Add to ASP.NET dropdown
            $aspDropdown.append(new Option(option.text, option.value));
            
            // Add to custom dropdown
            var $option = $('<div class="dropdown-option"></div>')
                .text(option.text)
                .attr('data-value', option.value);
            $dropdownOptions.append($option);
        });

        // Set default selection to "All" - use the text from the first option
        $aspDropdown.val('All');
        var allText = options.length > 0 && options[0].value === 'All' ? options[0].text : 'All';
        $input.val(allText).attr('data-value', 'All');
        $dropdownOptions.find('[data-value="All"]').addClass('selected');
        
        // Store options for search functionality
        $customDropdown.data('all-options', options);
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
            case 'region':
                return '<%= ddlRegion.ClientID %>';
            case 'branch':
                return '<%= ddlBranch.ClientID %>';
            default:
                return '';
        }
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function() {
        initializeCustomDropdowns();
    });
</script>

<%--<footer class="footer">
    
            <div class="footer-links-policy" style="margin-bottom: 20px; display: flex; justify-content: center; gap: 30px; flex-wrap: wrap;">
                <a href="Terms.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Terms & Conditions</a>
                <a href="Privacy.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Privacy Statement</a>
                <a href="Refund.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Refund Policy</a>
            </div><p>&copy; 2024 Your Company. All rights reserved.</p>
</footer>--%>
</asp:Content>
