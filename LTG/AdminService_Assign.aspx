<%@ Page Title="" Language="C#" MasterPageFile="/Main.Master" AutoEventWireup="true" CodeBehind="AdminService_Assign.aspx.cs" Inherits="LTG.AdminService_Assign" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     

        <title>Service Assignment</title>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

        <style>
     .ui-datepicker {
         width: 150px;
         font-size: 12px;
     }
     .ui-datepicker-header {
         background: #007bff;
         color: white;
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
     .ui-datepicker-calendar .ui-state-active {
         background: #007bff;
         color: white;
     }
     .ui-datepicker-calendar .ui-state-disabled {
         background: #f5f5f5;
         color: #ccc;
     }
     .form-select {
         width: 100%;
         padding: 5px;
      /*   margin-bottom: 15px;*/
         border-radius: 4px;
         border: 2px solid darkblue;
     }
     .form-control {
         width: 100%;
         padding: 5px;
        /* margin-bottom: 15px;*/
         border-radius: 4px;
         border: 2px solid darkblue;
     }

     .form-control:focus {
         border-color: #80bdff;
         outline: none;
         box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
     }

     .form-label {
         font-weight: bold;
         color: #333;
         margin-bottom: 0.25rem;
     }
     .form-container {
         padding: 20px;
         background-color: #f8f9fa;
         border-radius: 5px;
         box-shadow: 0 2px 10px darkblue;
     }
     .btn-primary{
         background-color:#3f418d;
     }
     .error-message {
    color: red;
    font-size: 0.9em;
    display: none;
}
      
     .content{
         background-color:#cadcfc;
     }
     @media (max-width: 768px) {
         .form-container {
             margin: 10px;
             padding: 15px;
         }
         .form-select, .form-control {
             font-size: 14px;
         }
         .form-label {
             font-size: 14px;
         }
     }
    .main {
    background-color: #cadcfc;
}

    /* Searchable Dropdown Styles */
    .custom-dropdown {
        position: relative;
        width: 100%;
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

   <main id="main" class="main">
       
        <div class="formarea">
            <section class="section dashboard">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <h5 class="card-title" style="text-align:center; background-color:#3f418d; color:white">Service Assignment</h5>
                            <section class="form-container section error-404 d-flex flex-column align-items-center justify-content-center" style=" box-shadow: 0 2px 10px darkblue; margin:0px;">
                                <div class="row g-3 needs-validation">
                                    <div class="col-12 ">
                                        <label for="ddlBranch" class="form-label">Branch</label>
                                        <div class="custom-dropdown" data-dropdown="branch">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Branch" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlBranch" runat="server" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" AutoPostBack="true" class="form-select hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-12 ">
                                        <label for="ddlCustId" class="form-label">Customer Name</label>
                                        <div class="custom-dropdown" data-dropdown="customer">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Customer" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlCustId" runat="server" class="form-select hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-12 ">
                                        <label for="ddlEmpId" class="form-label">Emp Name & ID</label>
                                        <div class="custom-dropdown" data-dropdown="employee">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Employee" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlEmpId" runat="server" class="form-select hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-12 ">
                                        <label for="ddlservice" class="form-label">Service Type</label>
                                        <div class="custom-dropdown" data-dropdown="service">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Service" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlservice" runat="server" class="form-select hidden-dropdown">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="CM" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="PM" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Installation" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Shifting" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="Others" Value="5"></asp:ListItem>
                                            
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-12 ">
                                        <label for="txtAdvance" class="form-label"  >Advance</label>
                                        <asp:TextBox id="txtAdvance" runat="server" ValidationGroup="TimeSlot" ClientIDMode="Static" class="form-control" autoComplete="off"></asp:TextBox>
                                    </div>
                                   <div class="col-12 mb-3">
    <label for="txtFromDate" class="form-label" >From Date</label>
    <asp:TextBox ID="txtFromDate" runat="server" class="form-control" ClientIDMode="Static"  autoComplete="off"  />
    <div id="errorFromDate" class="error-message">From Date cannot be in the past.</div> <!-- Error message for From Date -->
</div>
<div class="col-12 mb-3">
    <label for="txtToDate" class="form-label"  >To Date</label>
    <asp:TextBox ID="txtToDate" runat="server" class="form-control" ClientIDMode="Static"  autoComplete="off" />
    <div id="errorToDate" class="error-message">To Date cannot be earlier than From Date.</div> <!-- Error message for To Date -->
</div>
                                    <div class="col-12 ">
                                          <label for="ddldepartment" class="form-label">Department</label>
                                   <div class="custom-dropdown" data-dropdown="department">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Department" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                     <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-select hidden-dropdown">
     <asp:ListItem Text="Select " Value="0"></asp:ListItem>
                                         <asp:ListItem Text="Sales " Value="1"></asp:ListItem>
    <asp:ListItem Text="Service" Value="2"></asp:ListItem>
                                           <asp:ListItem Text="Project" Value="3"></asp:ListItem>
                                           <asp:ListItem Text="Refresh" Value="4"></asp:ListItem>
   
</asp:DropDownList>
 </div>
                                    <div class="col-12 ">
                                        <label for="txtremarks" class="form-label"  >Remarks</label>
                                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" TextMode="MultiLine" ClientIDMode="Static" autoComplete="off" />
                                    </div>
                                    <div class="col-12 ">
                                        <asp:Button ID="btnService" OnClick="btnService_Click" class="btn btn-primary w-100" Text="Submit" runat="server" style="background-color: #3f418d;"/>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </section>
        </div>
             
    </main>

   <script>
       $(function () {
           // Initialize date pickers
           $("#<%= txtFromDate.ClientID %>").datepicker({
               dateFormat: "yy-mm-dd"
           });
           $("#<%= txtToDate.ClientID %>").datepicker({
               dateFormat: "yy-mm-dd"
           });

           // Function to get today's date in yyyy-mm-dd format
           function getTodayDate() {
               var today = new Date();
               var day = ("0" + today.getDate()).slice(-2);
               var month = ("0" + (today.getMonth() + 1)).slice(-2);
               var year = today.getFullYear();
               return year + "-" + month + "-" + day;
           }

           // Validate dates
           $("#<%= txtFromDate.ClientID %>, #<%= txtToDate.ClientID %>").change(function() {
            var fromDate = $("#<%= txtFromDate.ClientID %>").val();
            var toDate = $("#<%= txtToDate.ClientID %>").val();

            // Clear error messages initially
            $("#errorFromDate").hide();
            $("#errorToDate").hide();

            // Validate From Date - just check if it's entered
            if (!fromDate) {
                $("#errorFromDate").text("Please enter a From Date.").show();
                $("#btnService").prop("disabled", true);  // Disable submit button
            } else {
                $("#btnService").prop("disabled", false); // Enable submit button
            }


            if (fromDate && toDate && toDate < fromDate) {
                $("#errorToDate").text("To Date cannot be earlier than From Date.").show();
                $("#btnService").prop("disabled", true);  // Disable submit button
            } else {
                $("#btnService").prop("disabled", false); // Enable submit button
            }
        });
       });

       // Searchable Dropdown Functionality
       $(document).ready(function () {
           initializeCustomDropdowns();
       });

       function initializeCustomDropdowns() {
           syncDropdownData('branch', '<%= ddlBranch.ClientID %>');
           syncDropdownData('customer', '<%= ddlCustId.ClientID %>');
           syncDropdownData('employee', '<%= ddlEmpId.ClientID %>');
           syncDropdownData('service', '<%= ddlservice.ClientID %>');
           syncDropdownData('department', '<%= ddldepartment.ClientID %>');
           
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
               case 'customer':
                   return '<%= ddlCustId.ClientID %>';
               case 'employee':
                   return '<%= ddlEmpId.ClientID %>';
               case 'service':
                   return '<%= ddlservice.ClientID %>';
               case 'department':
                   return '<%= ddldepartment.ClientID %>';
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
