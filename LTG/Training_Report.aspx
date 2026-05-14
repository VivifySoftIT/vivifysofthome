<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Training_Report.aspx.cs" Inherits="LTG.Training_Report" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <style>
        body {
            font-size: 14px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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

        .search-btn-container {
            display: flex;
            align-items: end;
            margin-top: 0;
        }

        .btn-search {
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

        .btn-search:hover {
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

        .verified-btn {
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }

        .verified-btn:hover {
            background-color: #218838 !important;
            border-color: #1e7e34 !important;
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

        /* Enhanced freeze during postback to prevent all shaking */
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

        .filter-container.postback-freeze .custom-dropdown {
            transform: translateZ(0) !important;
            backface-visibility: hidden !important;
            will-change: auto !important;
        }

        /* FINAL ARROW LOCK - Prevent any shaking */
        .dropdown-arrow,
        .custom-dropdown .dropdown-arrow,
        .custom-dropdown.open .dropdown-arrow,
        .custom-dropdown.frozen .dropdown-arrow,
        .custom-dropdown.loading .dropdown-arrow,
        .filter-container .dropdown-arrow,
        .filter-container.postback-freeze .dropdown-arrow {
            position: absolute !important;
            right: 8px !important;
            top: 11px !important;
            transform: none !important;
            backface-visibility: hidden !important;
            will-change: auto !important;
        }

        /* Generate Excel Button */
        .btn-generate-excel {
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
            margin-top: 15px;
            display: block;
            margin-left: 0;
            margin-right: auto;
        }

        .btn-generate-excel:hover {
            background-color: #2a2c6b !important;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
            
              <%--<li class="nav-item">
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

    <div class="content">
        <main id="main" class="main">
            <section class="section dashboard">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <h5 class="card-title">Training Report</h5>
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
                                        <label class="filter-label">Branch Name</label>
                                        <div class="custom-dropdown" data-dropdown="branch">
                                            <input type="text" class="dropdown-input" placeholder="Search branch..." readonly />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="false" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" CssClass="hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label">Employee Name</label>
                                        <div class="custom-dropdown" data-dropdown="employee">
                                            <input type="text" class="dropdown-input" placeholder="Search employee..." readonly />
                                            <span class="dropdown-arrow">?</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBack="false" CssClass="hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="search-btn-container">
                                        <asp:Button ID="btnFilter" runat="server" Text="Search" OnClick="btnFilter_Click" CssClass="btn-search" />
                                    </div>
                                </div>
                            </div>
                        </div> 
                            
                                <div class="grid-container">
                                    <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="false" CssClass="gridview">
                                        <HeaderStyle BackColor="#3f418d" ForeColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="EngineerName" HeaderText="Engineer Name" ItemStyle-Width="150px" />
                                            <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="FromDate" ItemStyle-CssClass="no-wrap" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                                            <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="ToDate" ItemStyle-CssClass="no-wrap" HeaderStyle-Width="120px" ItemStyle-Width="120px" />
                                            <asp:BoundField DataField="FromTime" HeaderText="From Time" DataFormatString="{0:hh\:mm}" SortExpression="FromTime" ItemStyle-CssClass="no-wrap" HeaderStyle-Width="250px" ItemStyle-Width="250px" />
                                            <asp:BoundField DataField="ToTime" HeaderText="To Time" DataFormatString="{0:hh\:mm}" SortExpression="ToTime" ItemStyle-CssClass="no-wrap" HeaderStyle-Width="250px" ItemStyle-Width="250px" />
                                            <asp:BoundField DataField="Particulars" HeaderText="Particulars" ItemStyle-Width="250px" SortExpression="ConvParticulars" NullDisplayText=" " />
                                            <asp:BoundField DataField="Distance" HeaderText="Distance" ItemStyle-Width="100px" SortExpression="Distance" NullDisplayText=" " />
                                            <asp:BoundField DataField="ModeOfTransport" HeaderText="Mode Of Transport" ItemStyle-Width="150px" />
                                            <asp:BoundField DataField="ConveyanceAmount" HeaderText="Conveyance" ItemStyle-Width="150px" SortExpression="ConvAmount" />
                                            <asp:BoundField DataField="FoodAmount" HeaderText="Food" ItemStyle-Width="150px" SortExpression="FoodAmount" />
                                            <asp:BoundField DataField="" HeaderText="Lodging" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="" HeaderText="Others" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="" HeaderText="Misc" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="Total" HeaderText="Total Amount" ItemStyle-Width="150px" />
                                            <asp:BoundField DataField="" HeaderText="Nature of Work" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="" HeaderText="SAP Contract Number/ SO Number" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="" HeaderText="SMO/SO/WBS" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="" HeaderText="Document Reference" SortExpression="" ItemStyle-Width="100px" />
                                            <asp:BoundField DataField="TrainingDetails" HeaderText="Remarks" SortExpression="TrainingDetails" ItemStyle-Width="150px" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                 <asp:Button ID="btnGenerate" runat="server" Text="Generate Excel" OnClick="btnGenerate_Click" CssClass="btn-generate-excel" />
                        </div>
                    </div>
                </div>
             
            </section>
        </main>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            initializeCustomDropdowns();
        });

        function initializeCustomDropdowns() {
            // Sync custom dropdowns with ASP.NET dropdowns
            syncDropdownData('branch', '<%= ddlBranch.ClientID %>');
            syncDropdownData('employee', '<%= ddlEmployeeName.ClientID %>');
            
            // Bind events only once
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

            // Build options from ASP.NET dropdown
            var options = [];
            $aspDropdown.find('option').each(function () {
                options.push({
                    value: $(this).val(),
                    text: $(this).text()
                });
            });

            // Update custom dropdown options
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

            // Update input display
            var selectedText = $aspDropdown.find('option:selected').text();
            $input.val(selectedText).attr('data-value', selectedValue);
            $customDropdown.data('all-options', options);
        }

        function bindDropdownEvents() {
            // Click on input to open dropdown
            $(document).off('click', '.dropdown-input').on('click', '.dropdown-input', function(e) {
                e.stopPropagation();
                
                var $dropdown = $(this).closest('.custom-dropdown');
                var $options = $dropdown.find('.dropdown-options');
                var $arrow = $dropdown.find('.dropdown-arrow');
                
                // Close other dropdowns
                $('.dropdown-options').not($options).hide();
                $('.dropdown-arrow').not($arrow).removeClass('open');
                $('.dropdown-input').not($(this)).attr('readonly', true);
                $('.custom-dropdown').not($dropdown).removeClass('open');
                
                // Toggle current dropdown
                if ($options.is(':visible')) {
                    $options.hide();
                    $arrow.removeClass('open');
                    $dropdown.removeClass('open');
                    $(this).attr('readonly', true);
                } else {
                    $options.show();
                    $arrow.addClass('open');
                    $dropdown.addClass('open');
                    $(this).removeAttr('readonly').focus();
                    showAllOptions($dropdown);
                }
            });

            // Search as user types
            $(document).off('input', '.dropdown-input').on('input', '.dropdown-input', function() {
                var $dropdown = $(this).closest('.custom-dropdown');
                var searchTerm = $(this).val().toLowerCase();
                
                if (searchTerm === '') {
                    showAllOptions($dropdown);
                } else {
                    filterOptions($dropdown, searchTerm);
                }
            });

            // Select option
            $(document).off('click', '.dropdown-option').on('click', '.dropdown-option', function(e) {
                e.stopPropagation();
                var $option = $(this);
                var $dropdown = $option.closest('.custom-dropdown');
                var dropdownType = $dropdown.attr('data-dropdown');
                var value = $option.attr('data-value');
                var text = $option.text();
                
                // Update custom dropdown
                var $input = $dropdown.find('.dropdown-input');
                $input.val(text).attr('data-value', value);
                $dropdown.find('.dropdown-option').removeClass('selected');
                $option.addClass('selected');
                
                // Update ASP.NET dropdown
                var aspDropdownId = getAspDropdownId(dropdownType);
                $('#' + aspDropdownId).val(value);
                
                // Close dropdown
                $dropdown.find('.dropdown-options').hide();
                $dropdown.find('.dropdown-arrow').removeClass('open');
                $dropdown.removeClass('open');
                $input.attr('readonly', true);
                
                // Handle cascading with AJAX (no postback)
                if (dropdownType === 'branch') {
                    loadEmployeesAjax(value);
                }
            });

            // Close dropdown when clicking outside
            $(document).off('click.dropdown').on('click.dropdown', function(e) {
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

        function loadEmployeesAjax(branchValue) {
            // Add loading state to employee dropdown
            $('[data-dropdown="employee"]').addClass('loading');
            
            // Freeze all dropdowns to prevent shaking
            $('.custom-dropdown').addClass('frozen');
            $('.filter-container').addClass('postback-freeze');
            
            $.ajax({
                type: "POST",
                url: "Training_Report.aspx/GetEmployees",
                data: JSON.stringify({ branchId: branchValue }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(response) {
                    // Update employee dropdown - will show "All Employees" as first option
                    updateDropdownOptions('employee', response.d);
                    
                    // Remove freeze and loading
                    $('.custom-dropdown').removeClass('frozen loading');
                    $('.filter-container').removeClass('postback-freeze');
                },
                error: function() {
                    console.error('Error loading employees');
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

            // Set default selection to first option (All Employees)
            var firstOption = options[0];
            $aspDropdown.val(firstOption.value);
            $input.val(firstOption.text).attr('data-value', firstOption.value);
            $dropdownOptions.find('[data-value="' + firstOption.value + '"]').addClass('selected');
            
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
                case 'branch':
                    return '<%= ddlBranch.ClientID %>';
                case 'employee':
                    return '<%= ddlEmployeeName.ClientID %>';
                default:
                    return '';
            }
        }
    </script>

</asp:Content>
