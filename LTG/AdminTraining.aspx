<%@ Page Language="C#" MasterPageFile="/Main.Master" AutoEventWireup="true" CodeBehind="AdminTraining.aspx.cs" Inherits="LTG.AdminTraining" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <style>
        /* Data Grid Styles */
        .mydatagrid th, .mydatagrid td {
            border: 1.5px solid black;
            padding: 12px;
            box-shadow: #1f2b60;
        }

        .header {
            background-color: #3f418d;
            font-weight: bold;
            color: ghostwhite;
            position: sticky;
            top: 0;
            z-index: 10;
            text-align: center;
        }

        .rows {
            background-color: #ffffff;
        }

        /* Pagination and scrolling */
        .pager {
            text-align: right;
        }

        .scrollable-container, .scrollable-container1 {
            max-height: 300px;
            overflow: auto;
            border: 1px solid #1f2b60;
            box-shadow: 0 2px 10px darkblue;
            margin: 20px auto;
            width: 90%;
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

        /* Button Styles */
        .custom-button {
            background-color: #3f418d;
            color: white;
            margin-left: 30px; 
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
        }

        .custom-button:hover {
            background-color:#3f418d;
        }

        /* Main container styling */
        .main {
            margin: 0;
            padding: 0;
            background-color: #cadcfc;
            height: 85vh;
            justify-content: center;
            align-items: center;
        }

        /* Custom GridView box-shadow */
        .custom-grid {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .card {
            height:400px;
        }

        /* Card styling */
        .card-header {
            text-align: center;
            background-color: #3f418d;
            color: ghostwhite;
            padding: 15px;
            font-size: 20px;
            border-radius: 5px 5px 0 0;
        }

        .form-label {
            font-weight: bold;
            color: #333;
            margin-right: 10px;
        }

        /* Grid View header */
        .header th {
            background-color: #3f418d;
            color: ghostwhite;
        }

        /* Center the dropdown */
        .centered-dropdown {
            display: flex;             
            justify-content: center;   
            align-items: center;       
            margin: 20px auto;
            gap: 10px;
        }

        .custom-dropdown {
            background-color: white;  
            border: 1.5px solid #3f418d;  
            color: #3f418d;  
            padding: 5px 10px;  
            border-radius: 5px;  
            margin: 10px;
        }

        /* Align items center for the GridView td */
        .mydatagrid td {
            text-align: center;  
            vertical-align: middle; 
        }

        /* Searchable Dropdown Styles */
        .custom-dropdown-wrapper {
            position: relative;
            width: 180px;
            z-index: 100;
            overflow: visible;
        }

        .custom-dropdown-wrapper input.dropdown-input {
            width: 100%;
            padding: 6px 30px 6px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            background-color: white;
            height: 34px;
            box-sizing: border-box;
            cursor: pointer;
            color: #495057;
        }

        .custom-dropdown-wrapper input.dropdown-input:focus {
            outline: none;
            border-color: #3f418d;
            box-shadow: 0 0 0 2px rgba(63, 65, 141, 0.2);
            cursor: text;
        }

        .custom-dropdown-wrapper input.dropdown-input::selection {
            background: transparent;
        }

        .custom-dropdown-wrapper .dropdown-arrow {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none;
            color: #666;
            font-size: 12px;
        }

        .dropdown-list {
            position: absolute;
            background: white;
            border: 1px solid #ddd;
            border-top: none;
            border-radius: 0 0 4px 4px;
            max-height: 250px;
            overflow-y: auto;
            z-index: 99999;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            display: none;
            word-wrap: break-word;
            white-space: normal;
            overflow-x: hidden;
            top: calc(100% - 1px);
            left: 0;
            margin-top: 0;
            width: 100%;
        }

        .dropdown-item {
            padding: 8px 12px;
            cursor: pointer;
            border-bottom: 1px solid #f0f0f0;
            font-size: 13px;
            transition: background-color 0.2s ease;
            user-select: none;
            word-wrap: break-word;
            white-space: normal;
            overflow-x: hidden;
            color: #495057;
            line-height: 1.4;
        }

        .dropdown-item:hover:not(.selected) {
            background-color: #f8f9fa;
        }

        .dropdown-item.selected {
            background-color: #1E73D8;
            color: white;
            font-weight: 500;
        }

        .dropdown-item:last-child {
            border-bottom: none;
        }

        .no-results {
            padding: 12px 15px;
            text-align: center;
            color: #999;
            font-style: italic;
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
            
             <%-- <li class="nav-item">
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
                <li class="nav-item">
    <a class="nav-link" href="AdminPage.aspx">
       <i class="bi bi-pc-display"></i>
        <span>ExpensePage</span>
    </a>
</li>
   </ul>
        </aside>


    <main id="main" class="main">
        
        <div class="centered-dropdown">
            <label class="form-label" for="ddlBranch">Select a Branch:</label>
            <div class="custom-dropdown-wrapper">
                <input type="text" id="branchSearchInput" class="dropdown-input" placeholder="Select a Branch" />
                <span class="dropdown-arrow">?</span>
                <div id="branchDropdownList" class="dropdown-list"></div>
            </div>
            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" CssClass="custom-dropdown" style="display:none !important; visibility:hidden !important; height:0 !important; padding:0 !important; border:none !important;">
            </asp:DropDownList>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                             Training Page
                        </div>
                        <div>
                            <section class="scrollable-container">
                                <asp:GridView ID="gvTraining" runat="server" AutoGenerateColumns="false" 
                                              CellPadding="4" CellSpacing="0" GridLines="None"
                                              Width="100%" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                              RowStyle-CssClass="rows" HeaderStyle-CssClass="header"
                                              style="border: 1.5px solid midnightblue; border-collapse: collapse; font-size:14px; line-height:20px; box-shadow:0 4px 15px rgba(0, 0, 0, 0.2);" 
                                              OnRowCommand="gvTraining_RowCommand">
                                    <Columns>
                                        
                                           <asp:BoundField DataField="FirstName" HeaderText="First Name" />
<asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:dd-MMM-yyyy}" />                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btnVerify" runat="server" Text="Click Here to Verify" CommandName="Verify" CommandArgument='<%# Eval("Training_Id") %>' CssClass="btn btn-primary custom-button center-button" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            initializeBranchDropdown();
        });

        function initializeBranchDropdown() {
            var $searchInput = $('#branchSearchInput');
            var $dropdownList = $('#branchDropdownList');
            var $hiddenDropdown = $('#<%= ddlBranch.ClientID %>');
            var allOptions = [];

            // Get all options from hidden dropdown
            $hiddenDropdown.find('option').each(function () {
                allOptions.push({
                    text: $(this).text(),
                    value: $(this).val()
                });
            });

            // Set initial value
            var selectedText = $hiddenDropdown.find('option:selected').text();
            $searchInput.val(selectedText);

            // Show dropdown when input is focused
            $searchInput.on('focus', function () {
                showDropdownOptions('');
                $dropdownList.show();
                
                // Position cursor at end of text
                var input = this;
                setTimeout(function() {
                    var len = input.value.length;
                    input.setSelectionRange(len, len);
                }, 0);
            });

            // Filter dropdown as user types
            $searchInput.on('input', function () {
                var searchTerm = $(this).val().toLowerCase().trim();
                showDropdownOptions(searchTerm);
                $dropdownList.show();
            });

            // Hide dropdown when clicking outside
            $(document).on('click', function (e) {
                if (!$(e.target).closest('.custom-dropdown-wrapper').length) {
                    $dropdownList.hide();
                }
            });

            function showDropdownOptions(searchTerm) {
                $dropdownList.empty();
                var currentValue = $hiddenDropdown.val();

                var filteredOptions = allOptions.filter(function (opt) {
                    if (searchTerm === '') {
                        return true;
                    }
                    return opt.text.toLowerCase().includes(searchTerm);
                });

                if (filteredOptions.length > 0) {
                    filteredOptions.forEach(function (opt) {
                        var $item = $('<div class="dropdown-item"></div>')
                            .text(opt.text)
                            .attr('data-value', opt.value);
                        
                        if (opt.value === currentValue) {
                            $item.addClass('selected');
                        }
                        
                        $item.on('click', function (e) {
                            e.stopPropagation();
                            $searchInput.val(opt.text);
                            $hiddenDropdown.val(opt.value);
                            $dropdownList.hide();
                            $dropdownList.find('.dropdown-item').removeClass('selected');
                            $item.addClass('selected');
                            
                            // Trigger AutoPostBack
                            $hiddenDropdown.change();
                        });
                        
                        $dropdownList.append($item);
                    });
                } else {
                    $dropdownList.append('<div class="no-results">No results found</div>');
                }
            }
        }
    </script>

</asp:Content>
