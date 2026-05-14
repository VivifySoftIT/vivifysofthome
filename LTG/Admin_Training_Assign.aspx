 <%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Admin_Training_Assign.aspx.cs" Inherits="LTG.Admin_Training_Assign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 5px;
            border-radius: 4px;
            border: 2px solid darkblue;
        }

        .form-label {
            font-weight: bold;
            color: black;
        }

        .form-container {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 2px 10px darkblue;
        }

        .form-control[readonly] {
            background-color: #e9ecef;
        }

        .btn {
            background-color: #3f418d;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:disabled {
            background-color: #3f418d;
            color: white;
            cursor: not-allowed;
            opacity: 1;
        }

        .error-message {
            color: red;
            font-size: 14px;
        }

        /* Custom Dropdown Styles */
     /* === EXACT STYLE FROM YOUR IMAGE === */
.custom-dropdown {
    position: relative;
    width: 100%;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.dropdown-input {
    width: 100%;
    padding: 5px 12px;           /* matches .form-control padding */
    border: 2px solid #3f418d;   /* exact header color */
    border-radius: 4px;
    font-size: 14px;             /* matches other inputs */
    background-color: white;
    cursor: pointer;
    appearance: none;
    box-sizing: border-box;
    color: #495057;
    position: relative;
    /* Remove default browser focus styles */
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
    content: "?";
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
    font-size: 13px;
}

.hidden-dropdown {
    display: none !important;
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
            
<%--              <li class="nav-item">
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

</li>--%>
                            <li class="nav-item">
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
</li>     
   </ul>
        </aside>


    <body>
        <main id="main" class="main">
            <div class="formarea">
                <section class="section dashboard">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <h5 class="card-title" style="text-align:center; background-color:#3f418d; color:white">
                                    Training Assignment
                                </h5>

                                <section class="form-container">
                                    <!-- Branch Dropdown -->
                                    <div class="form-group">
                                        <label for="ddlBranch">Branch</label>
                                        <div class="custom-dropdown" data-dropdown="branch">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Branch" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList 
                                            ID="ddlBranch" 
                                            runat="server" 
                                            CssClass="form-control hidden-dropdown" 
                                            OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" 
                                            AutoPostBack="true">
                                            <asp:ListItem Text="Select Branch" Value="" />
                                        </asp:DropDownList>
                                    </div>

                                    <!-- Employee Dropdown -->
                                    <div class="form-group">
                                        <label for="ddlEmployee">Employee Name</label>
                                        <div class="custom-dropdown" data-dropdown="employee">
                                            <input type="text" class="dropdown-input" readonly placeholder="Select Employee" />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList 
                                            ID="ddlEmployee" 
                                            runat="server" 
                                            CssClass="form-control hidden-dropdown">
                                            <asp:ListItem Text="Select Employee" Value="" />
                                        </asp:DropDownList>
                                    </div>

                                    <!-- From Date -->
                                    <div class="form-group">
                                        <label for="txtFromDate">From Date</label>
                                        <asp:TextBox 
                                            ID="txtFromDate" 
                                            runat="server" 
                                            CssClass="form-control" 
                                            TextMode="Date">
                                        </asp:TextBox>
                                    </div>
                                    <div id="errorFromDate" class="error-message" style="display:none;"></div>

                                    <!-- To Date -->
                                    <div class="form-group">
                                        <label for="txtToDate">To Date</label>
                                        <asp:TextBox 
                                            ID="txtToDate" 
                                            runat="server" 
                                            CssClass="form-control" 
                                            TextMode="Date">
                                        </asp:TextBox>
                                    </div>
                                    <div id="errorToDate" class="error-message" style="display:none;"></div>

                                    <!-- Training Details -->
                                    <div class="form-group">
                                        <label for="txtTrainingDetails">Training Details</label>
                                        <asp:TextBox 
                                            ID="txtTrainingDetails" 
                                            runat="server" 
                                            CssClass="form-control" 
                                            placeholder="Enter training details">
                                        </asp:TextBox>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="form-group">
                                        <asp:Button 
                                            ID="btnSubmit" 
                                            runat="server" 
                                            CssClass="btn" 
                                            Text="Submit" 
                                            OnClick="btnSubmit_Click" />
                                    </div>

                                    <!-- Error Message -->
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                                </section>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </body>

   <script>
       $(document).ready(function () {
           // Initialize searchable dropdowns
           initializeCustomDropdowns();

           // Initialize datepickers
           $("#<%= txtFromDate.ClientID %>").datepicker({ dateFormat: "yy-mm-dd" });
           $("#<%= txtToDate.ClientID %>").datepicker({ dateFormat: "yy-mm-dd" });

           // Handle change event for From and To Date fields
           $("#<%= txtFromDate.ClientID %>, #<%= txtToDate.ClientID %>").change(function () {
               var fromDate = $("#<%= txtFromDate.ClientID %>").val();
               var toDate = $("#<%= txtToDate.ClientID %>").val();

               // Clear errors initially
               $("#errorFromDate").hide();
               $("#errorToDate").hide();

               // Validate From Date
               if (!fromDate) {
                   $("#errorFromDate").text("Please enter a From Date.").show();
                   $("#btnSubmit").prop("disabled", true);
               } else {
                   $("#errorFromDate").hide();
               }

               // Validate To Date
               if (fromDate && toDate && new Date(toDate) < new Date(fromDate)) {
                   $("#errorToDate").text("To Date cannot be earlier than From Date.").show();
                   $("#btnSubmit").prop("disabled", true);
               } else {
                   $("#errorToDate").hide();
                   if (fromDate && toDate) {
                       $("#btnSubmit").prop("disabled", false);
                   }
               }
           });
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

               // Highlight first item (e.g., "Select Branch") if it's the default/empty selection
               if ((option.value === "" || option.value === "0") && options.indexOf(option) === 0) {
                   $option.addClass('selected');
               } else if (option.value === selectedValue) {
                   $option.addClass('selected');
               }

               $dropdownOptions.append($option);
           });

           var selectedText = $aspDropdown.find('option:selected').text();
           $input.val(selectedText).attr('data-value', selectedValue);
           $customDropdown.data('all-options', options);
       }

       function bindDropdownEvents() {
           $(document).off('click', '.dropdown-input').on('click', '.dropdown-input', function (e) {
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
                   $input.removeAttr('readonly').focus();
                   
                   // Position cursor at the end of text
                   var textLength = $input.val().length;
                   if ($input[0].setSelectionRange) {
                       $input[0].setSelectionRange(textLength, textLength);
                   } else if ($input[0].createTextRange) {
                       var range = $input[0].createTextRange();
                       range.collapse(true);
                       range.moveEnd('character', textLength);
                       range.moveStart('character', textLength);
                       range.select();
                   }
                   
                   $dropdown.find('.dropdown-arrow').addClass('open');
                   $dropdown.addClass('open');
               }
           });

           $(document).off('input', '.dropdown-input').on('input', '.dropdown-input', function () {
               var $dropdown = $(this).closest('.custom-dropdown');
               var searchTerm = $(this).val().toLowerCase();

               if (searchTerm === '') {
                   showAllOptions($dropdown);
               } else {
                   filterOptions($dropdown, searchTerm);
               }
           });

           $(document).off('click', '.dropdown-option').on('click', '.dropdown-option', function (e) {
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

           $(document).on('click.dropdown', function (e) {
               if (!$(e.target).closest('.custom-dropdown').length) {
                   $('.custom-dropdown').each(function () {
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

           allOptions.forEach(function (option) {
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

           allOptions.forEach(function (option) {
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
           switch (dropdownType) {
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
       prm.add_endRequest(function () {
           initializeCustomDropdowns();
       });

       // Function to clear all fields and reset form after submission
       function clearFormAndReenableSubmitButton() {
           $("#<%= txtFromDate.ClientID %>").val("");
           $("#<%= txtToDate.ClientID %>").val("");
           $("#<%= txtTrainingDetails.ClientID %>").val("");
           $("#<%= ddlBranch.ClientID %>").val("");
           $("#<%= ddlEmployee.ClientID %>").val("");

           // Reset custom dropdowns
           $('[data-dropdown="branch"]').find('.dropdown-input').val("Select Branch");
           $('[data-dropdown="employee"]').find('.dropdown-input').val("Select Employee");

           $("#errorFromDate").hide();
           $("#errorToDate").hide();
           $("#btnSubmit").prop("disabled", false);
       }
   </script>

</asp:Content>
