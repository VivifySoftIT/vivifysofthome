<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RefreshmentReport.aspx.cs" Inherits="Vivify.RefreshmentReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-size: 14px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .HeaderStyle {
            width: 100%;
        }

        .grid-container {
            max-height: 400px;
            overflow-y: auto;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            font-size: 13px;
            margin-top: 15px;
        }

        .gridview {
            width: 100%;
            border-spacing: 0;
            margin: 0;
            font-size: 13px;
            border-collapse: collapse;
        }
         .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .gridview th {
            background-color: #3f418d;
            color: white;
            position: sticky;
            top: 0;
            z-index: 10;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-size: 13px;
            padding: 8px;
            font-weight: 600;
        }

        .gridview tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .gridview tr:hover {
            background-color: #e9ecef;
        }

        main {
            background-color: #cadcfc;
        }

        #header {
            background-color: #3f418d;
        }

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

        /* Dropdown arrow styling */
        .custom-dropdown-wrapper input.filter-control {
            padding-right: 30px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path fill="%233f418d" d="M6 9L1 4h10z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 8px center;
            background-size: 12px 12px;
            cursor: pointer;
        }

        .custom-dropdown-wrapper input.filter-control:focus {
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12"><path fill="%233f418d" d="M6 9L1 4h10z"/></svg>');
        }

        .search-btn-container {
            display: flex;
            align-items: end;
            margin-top: 0;
        }

        #ContentPlaceHolder1_btnFilter {
            background-color: #3f418d !important;
            color: white !important;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 120px;
            height: 34px;
            box-sizing: border-box;
        }

        #ContentPlaceHolder1_btnFilter:hover {
            background-color: #2a2c6b !important;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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

        .content {
            margin-left: 10px;
            padding: 15px;
            background-color: #cadcfc;
            min-height: calc(100vh - 40px);
            padding-bottom: 50px;
            box-sizing: border-box;
        }

        .btn-primary {
            background-color: #3f418d;
            border-color: #3f418d;
            font-size: 12px;
            padding: 6px 12px;
            border-radius: 4px;
            color: white;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary:hover {
            background-color: #2a2c6b;
            border-color: #2a2c6b;
            color: white;
        }

        .card-title {
            text-align: center;
            background-color: #3f418d;
            color: white;
            padding: 12px;
            margin: 0;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px 8px 0 0;
        }
        
        .card {
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: none;
        }
        
        .custom-button {
            font-size: 12px;
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 500;
            min-width: 120px;
        }

        .main {
            padding: 0;
            margin: 0;
        }

        .section.dashboard {
            padding: 0;
            margin: 0;
        }

        .row {
            margin: 0;
        }

        .col {
            padding: 0;
        }

        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: #f9f3f3;
            text-align: center;
            padding: 10px;
            color: #333;
            z-index: 1000;
            border-top: 1px solid #ddd;
        }

        .footer a {
            color: #3f418d;
            text-decoration: none;
            font-weight: 500;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .filter-container .form-row {
            display: flex;
            align-items: end;
        }

        .filter-container .filter-group {
            flex: 1;
            margin-bottom: 0;
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

        .sidebar-nav .nav-link:hover {
            color: red;
            border: 2px solid #222b65;
            box-shadow: 0 2px 10px #1f2b60;
        }

        #btnGenerate {
            background-color: #3f418d;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 15px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        #btnGenerate:hover {
            background-color: #2a2c6b;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Custom Dropdown Styles */
        .custom-dropdown-wrapper {
            position: relative;
            width: 100%;
            z-index: 100;
            overflow: visible;
        }

        .dropdown-list {
            position: absolute;
            background: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            max-height: 200px;
            overflow-y: auto;
            z-index: 99999;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            min-width: 150px;
            display: none;
            word-wrap: break-word;
            white-space: normal;
            overflow-x: hidden;
            top: calc(100% - 1px);
            left: 0;
            margin-top: 0;
        }

        .dropdown-item {
            padding: 10px 12px;
            cursor: pointer;
            border-bottom: 1px solid #f0f0f0;
            font-size: 13px;
            transition: background-color 0.2s ease;
            user-select: none;
            word-wrap: break-word;
            white-space: normal;
            overflow-x: hidden;
        }

        .dropdown-item:hover {
            background-color: #f8f9fa;
        }

        .dropdown-item.selected {
            background-color: #1E73D8;
            color: white;
        }

        .dropdown-item:last-child {
            border-bottom: none;
        }

        .no-results {
            padding: 10px 12px;
            text-align: center;
            color: #999;
            font-style: italic;
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
                            <h5 class="card-title">Refreshment Report</h5>
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                            <!-- ? FILTER CONTAINER - CLEAN LAYOUT -->
                            <div class="filter-container">
                                <div class="form-row">
                                    <div class="filter-group">
                                        <label class="filter-label">From Date</label>
                                        <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="filter-control"></asp:TextBox>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label">To Date</label>
                                        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="filter-control"></asp:TextBox>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label">Region</label>
                                        <div class="custom-dropdown-wrapper">
                                            <input type="text" id="regionSearchInput" class="filter-control" placeholder="All Regions" value="<%= GetRegionDisplayText() %>" />
                                            <div id="regionDropdownList" class="dropdown-list"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlRegion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" CssClass="filter-control" style="display:none !important; visibility:hidden !important; height:0 !important; padding:0 !important; border:none !important;">
                                            <asp:ListItem Text="All Regions" Value="" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label">Branch Name</label>
                                        <div class="custom-dropdown-wrapper">
                                            <input type="text" id="branchSearchInput" class="filter-control" placeholder="All Branches" value="<%= GetBranchDisplayText() %>" />
                                            <div id="branchDropdownList" class="dropdown-list"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" CssClass="filter-control" style="display:none !important; visibility:hidden !important; height:0 !important; padding:0 !important; border:none !important;">
                                            <asp:ListItem Text="All Branches" Value="" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label">Employee Name</label>
                                        <div class="custom-dropdown-wrapper">
                                            <input type="text" id="employeeSearchInput" class="filter-control" placeholder="All Employees" value="<%= GetEmployeeDisplayText() %>" />
                                            <div id="employeeDropdownList" class="dropdown-list"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="filter-control" style="display:none !important; visibility:hidden !important; height:0 !important; padding:0 !important; border:none !important;">
                                            <asp:ListItem Text="All Employees" Value="" />
                                        </asp:DropDownList>
                                    </div>

                                    <div class="search-btn-container">
                                        <asp:Button ID="btnFilter" runat="server" Text="Search" OnClick="btnFilter_Click" CssClass="btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <section class="scrollable-container">
                            <div class="grid-container">
                         <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="false" CssClass="gridview">
    <HeaderStyle BackColor="darkblue" ForeColor="White" Font-Size="11px" />
    <RowStyle Font-Size="11px" />
    <Columns>
        <asp:BoundField DataField="Eng_Name" HeaderText="Employee Name" />
        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
        <asp:BoundField DataField="FromTime" HeaderText="From Time" />
        <asp:BoundField DataField="ToTime" HeaderText="To Time" />
        <asp:BoundField DataField="Particulars" HeaderText="Particulars" />
        <asp:BoundField DataField="Distance" HeaderText="Distance" />
        <asp:BoundField DataField="Transport" HeaderText="Mode of Transport" />
        <asp:BoundField DataField="Conveyance" HeaderText="Conveyance" />
        <asp:BoundField DataField="Lodging" HeaderText="Lodging" />
        <asp:BoundField DataField="Food" HeaderText="Fooding Exp" />
        <asp:BoundField DataField="TrainBus" HeaderText="Train/Bus Fair" />
        <asp:BoundField DataField="Others" HeaderText="Others" />
        <asp:BoundField DataField="Miscellaneous" HeaderText="Misc."  />
        <asp:BoundField DataField="Total" HeaderText="Total" />
        <asp:BoundField DataField="Department" HeaderText="Department" />
        <asp:BoundField DataField="Nature_of_Work" HeaderText="Nature of Work" />
        <asp:BoundField DataField="SMO" HeaderText="SMO/SO/WBS" />
        <asp:BoundField DataField="Document_Reference" HeaderText="Doc Ref" />
    </Columns>
</asp:GridView>
                            </div>
                            <asp:Button ID="btnGenerate" runat="server" Text="Generate Excel" OnClick="btnGenerate_Click"  style="background-color:darkblue; color:white;" />
                        </section>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            initializeRegionDropdown();
            initializeBranchDropdown();
            initializeEmployeeDropdown();
        });

        function initializeRegionDropdown() {
            initializeSearchableDropdown('regionSearchInput', 'regionDropdownList', '<%= ddlRegion.ClientID %>');
        }

        function initializeBranchDropdown() {
            initializeSearchableDropdown('branchSearchInput', 'branchDropdownList', '<%= ddlBranch.ClientID %>');
        }

        function initializeEmployeeDropdown() {
            initializeSearchableDropdown('employeeSearchInput', 'employeeDropdownList', '<%= ddlEmployee.ClientID %>');
        }

        function initializeSearchableDropdown(inputId, dropdownListId, hiddenDropdownId) {
            var $searchInput = $('#' + inputId);
            var $dropdownList = $('#' + dropdownListId);
            var $hiddenDropdown = $('#' + hiddenDropdownId);
            var allOptions = [];

            // Get all options from hidden dropdown
            $hiddenDropdown.find('option').each(function () {
                allOptions.push({
                    text: $(this).text(),
                    value: $(this).val()
                });
            });

            // Show dropdown when input is focused
            $searchInput.on('focus', function () {
                // Close all other dropdowns
                $('.dropdown-list').not($dropdownList).hide();
                
                showDropdownOptions('');
                $dropdownList.show();
            });

            // Filter dropdown as user types
            $searchInput.on('input', function () {
                var searchTerm = $(this).val().toLowerCase().trim();
                showDropdownOptions(searchTerm);
                $dropdownList.show();
            });

            // Hide dropdown when clicking outside
            $(document).on('click', function (e) {
                if (!$(e.target).closest('.custom-dropdown-wrapper').length && !$(e.target).closest('.dropdown-item').length) {
                    $dropdownList.hide();
                }
            });

            function positionDropdown() {
                var width = $searchInput.outerWidth();
                
                $dropdownList.css({
                    width: width
                });
            }

            function showDropdownOptions(searchTerm) {
                $dropdownList.empty();
                var currentValue = $hiddenDropdown.val();

                var filteredOptions = allOptions.filter(function (opt) {
                    if (searchTerm === '') {
                        return true; // Show all if search is empty
                    }
                    return opt.text.toLowerCase().includes(searchTerm);
                });

                if (filteredOptions.length > 0) {
                    filteredOptions.forEach(function (opt) {
                        var $item = $('<div class="dropdown-item"></div>')
                            .text(opt.text)
                            .attr('data-value', opt.value);
                        
                        // Highlight selected item
                        if (opt.value === currentValue) {
                            $item.addClass('selected');
                        }
                        
                        // Bind click event
                        $item.on('click', function (e) {
                            e.stopPropagation();
                            $searchInput.val(opt.text);
                            $hiddenDropdown.val(opt.value);
                            $dropdownList.hide();
                            // Mark this item as selected
                            $dropdownList.find('.dropdown-item').removeClass('selected');
                            $item.addClass('selected');
                            
                            // Trigger change event for AutoPostBack
                            $hiddenDropdown.trigger('change');
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
