<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DocView.aspx.cs" Inherits="Vivify.DocView" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .mydatagrid th, .mydatagrid td {
            border: 1px solid black;
            padding: 8px;
            margin: 0;
            width: 400px;
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
            overflow: auto;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            width: 100%;
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
    margin-left: 10px; /* Adjust margin to fit sidebar */
    padding: 20px;
    background-color: #cadcfc;
    min-height: calc(100vh - 40px); /* Ensures content fills available height minus footer */
    padding-bottom: 50px; /* To ensure content doesn't overlap footer */
    box-sizing: border-box; /* Includes padding in height calculation */
    flex: 1;
}
        .footer {
            background-color: rgb(249, 243, 243);
            text-align: center;
            padding: 10px;
            color: #333;
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
        .form-container {
           
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top:10px;
        }
     /*   .input{
        width: 100%;
    padding: 5px;
    margin-bottom: 15px;
    border-radius: 4px;
    border: 2px solid darkblue;
}*/

          .input {
    width: 100%;
    padding: 5px;
    margin-bottom: 15px;
    border-radius: 4px;
    border: 2px solid darkblue;
}

        .label {
            display: block;
            margin-bottom: 5px;
            color:black;
            font-weight:bold;
        }
        
                .button {
    width: 150px; /* Adjust the width as needed */
    display: block; /* Make it a block-level element */
    margin: 0 auto; /* Center it horizontally */
    text-align: center; /* Optional: center the text inside the button */
    padding: 10px; /* Optional: adjust padding for better appearance */
    background-color: #3f418d; /* Optional: button background color */
    color: white; /* Optional: button text color */
    border: none; /* Optional: remove border */
    border-radius: 5px; /* Optional: rounded corners */
    cursor: pointer; /* Change cursor to pointer on hover */
}
        .button:hover {
            background-color: #3f418d;
        }
        .card {
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }
        .card-title {
            text-align: center;
            background-color: #3f418d;
            color: white;
            padding: 15px;
            margin: 0;
        }

        /* Searchable Dropdown Styles */
        .custom-dropdown {
            position: relative;
            width: 100%;
            margin-bottom: 15px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dropdown-input {
            width: 100%;
            padding: 5px 12px;
            border: 2px solid #3f418d;
            border-radius: 4px;
            font-size: 14px;
            background-color: white;
            cursor: pointer;
            appearance: none;
            box-sizing: border-box;
            color: #495057;
            position: relative;
        }

        .dropdown-input:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .dropdown-input::selection {
            background-color: transparent;
            color: inherit;
        }

        .dropdown-input::-moz-selection {
            background-color: transparent;
            color: inherit;
        }

        .dropdown-input::-webkit-selection {
            background-color: transparent;
            color: inherit;
        }

        .dropdown-arrow {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 14px;
            color: #6c757d;
            pointer-events: none;
            font-family: Arial, sans-serif;
        }

        .dropdown-options {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #dee2e6;
            border-top: none;
            border-radius: 0 0 4px 4px;
            max-height: 200px;
            overflow-y: auto;
            z-index: 10000;
            display: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
            margin-top: 2px;
        }

        .dropdown-options.show {
            display: block;
        }

        .dropdown-option {
            padding: 8px 12px;
            cursor: pointer;
            font-size: 14px;
            color: #495057;
            transition: background-color 0.2s;
            border-bottom: 1px solid #e9ecef;
        }

        .dropdown-option:hover:not(.selected) {
            background-color: #e6f2ff;
            color: #212529;
        }

        .dropdown-option.selected {
            background-color: #2b7de9;
            color: white;
            font-weight: 500;
        }

        .dropdown-option:last-child {
            border-bottom: none;
        }

        .no-results {
            padding: 10px 12px;
            text-align: center;
            color: #6c757d;
            font-style: italic;
        }

        .hidden-dropdown {
            display: none !important;
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
                           <h5 class="card-title">Attachment</h5>
 <section class="form-container">
    <asp:Label ID="lblBranchName" runat="server" Text="Branch Name:" CssClass="label"></asp:Label>
    <div class="custom-dropdown" data-dropdown="branch">
        <input type="text" class="dropdown-input" readonly placeholder="Select Branch" />
        <span class="dropdown-arrow">?</span>
        <div class="dropdown-options"></div>
    </div>
    <asp:DropDownList ID="ddlBranch" runat="server" CssClass="input hidden-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
    </asp:DropDownList>

    <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Name:" CssClass="label"></asp:Label>
    <div class="custom-dropdown" data-dropdown="employee">
        <input type="text" class="dropdown-input" readonly placeholder="Select Employee" />
        <span class="dropdown-arrow">?</span>
        <div class="dropdown-options"></div>
    </div>
    <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="input hidden-dropdown">
    </asp:DropDownList>

     <asp:Label ID="lblFromDate" runat="server" Text="From Date:" CssClass="label"></asp:Label>
     <asp:TextBox ID="txtFromDate" runat="server" TextMode="date" CssClass="input"></asp:TextBox>
     <asp:RequiredFieldValidator 
         ID="rfvFromDate" 
         runat="server" 
         ControlToValidate="txtFromDate" 
         InitialValue="" 
         ErrorMessage="From Date is required." 
         ForeColor="Red" />

     <asp:Label ID="lblToDate" runat="server" Text="To Date:" CssClass="label"></asp:Label>
     <asp:TextBox ID="txtToDate" runat="server" TextMode="date" CssClass="input"></asp:TextBox>
     <asp:RequiredFieldValidator 
         ID="rfvToDate" 
         runat="server" 
         ControlToValidate="txtToDate" 
         InitialValue="" 
         ErrorMessage="To Date is required." 
         ForeColor="Red" />

     <!-- CompareValidator to ensure To Date is after From Date -->
     <asp:CompareValidator 
         ID="cvDateRange" 
         runat="server" 
         ControlToValidate="txtToDate" 
         ControlToCompare="txtFromDate" 
         Operator="GreaterThanEqual" 
         Type="Date" 
         ErrorMessage="To Date must be after From Date." 
         ForeColor="Red" />
                               
                               
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                                <asp:Button ID="btnFilter" runat="server" Text="Generate PDF" OnClick="btnFilter_Click" CssClass="button" />
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <%--<div class="footer">
        
            <div class="footer-links-policy" style="margin-bottom: 20px; display: flex; justify-content: center; gap: 30px; flex-wrap: wrap;">
                <a href="Terms.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Terms & Conditions</a>
                <a href="Privacy.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Privacy Statement</a>
                <a href="Refund.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Refund Policy</a>
            </div><p>&copy; 2023 Vivify Technocrats | <a href="Privacy.aspx">Privacy Policy</a></p>
    </div>--%>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Initialize searchable dropdowns
            initializeCustomDropdowns();
        });

        // Searchable Dropdown Functions
        function initializeCustomDropdowns() {
            syncDropdownData('branch', '<%= ddlBranch.ClientID %>');
            syncDropdownData('employee', '<%= ddlEmployee.ClientID %>');
            
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
                
                // Trigger change event for branch dropdown to maintain AutoPostBack functionality
                if (dropdownType === 'branch') {
                    $('#' + aspDropdownId).change();
                }
                
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
                case 'employee':
                    return '<%= ddlEmployee.ClientID %>';
                default:
                    return '';
            }
        }

        // Re-initialize dropdowns after postback
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function() {
            initializeCustomDropdowns();
        });
    </script>
</asp:Content>
