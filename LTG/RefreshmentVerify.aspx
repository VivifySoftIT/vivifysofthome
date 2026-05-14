

<%@ Page Title="" Language="C#" MasterPageFile="/Main.Master" AutoEventWireup="true" CodeBehind="RefreshmentVerify.aspx.cs" Inherits="LTG.RefreshmentVerify" %>


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
        max-height: 500px;
        overflow-y: auto;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
    .gridview {
        width: 100%;
        border-spacing: 0;
        margin: 0;
    }

    .gridview th, .gridview td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }

    .gridview th {
        background-color: darkblue;
        color: white;
        position: sticky;
        top: 0;
        z-index: 10;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .gridview tr:hover {
        background-color: #f1f1f1;
    }

    .border-right {
        border-right: 4px solid #ddd;
    }

            .label {
                display: block;
                color: black;
                font-weight: bold;
            }

            .date-column {
                white-space: nowrap;
                width: 800px;
            }

            .particulars-column {
                white-space: nowrap;
                width: 250px;
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
                    padding: 20px;
                    background-color: #cadcfc;
                    min-height: calc(100vh - 40px);
                    padding-bottom: 50px;
                    box-sizing: border-box;
                }

                .form-row .col {
                    flex: 1;
                    min-width: 100px;
                }

                .form-row .form-label {
                    font-size: 0.875rem;
                    margin-bottom: 2px;
                }

                .form-row .form-control, .form-row .form-select {
                    width: 100%;
                    padding: 4px;
                    font-size: 0.875rem;
                    height: 28px;
                }

                .form-row .btn {
                    padding: 5px 10px;
                    font-size: 0.875rem;
                    height: 30px;
                    min-width: 70px;
                }

                #verificationForm label {
                    font-size: 0.875rem;
                    margin-right: 5px;
                }

                #verificationForm input[type="text"],
                #verificationForm .btn {
                    width: 120px;
                    height: 28px;
                    font-size: 0.875rem;
                    padding: 4px;
                }

                #verificationForm .form-row {
                    display: flex;
                    flex-wrap: nowrap;
                    gap: 5px;
                    align-items: center;
                }

                .form-row .col-4 {
                    flex: 0 0 22%;
                }

                .btn-container {
                    display: flex;
                    gap: 10px;
                    justify-content: space-between;
                    align-items: center;
                }

                .required-field {
                    color: OrangeRed;
                    margin-top: 0.25rem;
                    font-size: 0.875rem;
                }

              .btn-primary {
    background-color: #3f418d;
    border-color: #3f418d;
    color: white;
    padding: 4px 12px;
    border-radius: 4px;
    font-size: 0.85rem;
    transition: 0.3s ease;
}

.btn-primary:hover {
    background-color: #2d3270;
    border-color: #2d3270;
}

                .form-container {
                    padding: 15px;
                    background-color: #f8f9fa;
                    border-radius: 5px;
                    box-shadow: 0 2px 10px darkblue;
                }

                .table-container {
                    display: block;
                    max-height: 400px;
                    overflow-y: auto;
                    box-shadow: 0 4px 15px darkblue;
                    background-color: white;
                    border-radius: 5px;
                    margin-bottom: 50px;
                }

                .table th {
                    position: sticky;
                    top: 0;
                    background-color: #3f418d;
                    color: ghostwhite;
                    z-index: 10;
                    text-align: center;
                }

                .table th, .table td {
                    padding: 8px;
                    border: 2px solid darkblue;
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
                    position: fixed;
                    bottom: 0;
                    left: 0;
                    right: 0;
                    background-color: rgb(249, 243, 243);
                    text-align: center;
                    padding: 10px;
                    color: ghostwhite;
                    z-index: 1000;
                }

                .footer a {
                    color: midnightblue;
                    text-decoration: none;
                }

                .footer a:hover {
                    text-decoration: underline;
               
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
            <section class="section dashboard" >
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <h5 class="card-title" style="text-align:center;background-color:#3f418d;color:white">Refreshment Verification </h5>
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                           
                            <div class="filter-container">
                                <div class="form-row">
                                    <div class="filter-group">
                                        <label class="filter-label" for="txtFromDate">From Date</label>
                                        <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="filter-control"></asp:TextBox>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="txtToDate">To Date</label>
                                        <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="filter-control"></asp:TextBox>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="ddlRegion">Region</label>
                                        <div class="custom-dropdown" data-dropdown="region">
                                            <input type="text" class="dropdown-input" placeholder="Search region..." readonly />
                                            <span class="dropdown-arrow">&#9660;</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlRegion" runat="server" CssClass="hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="ddlBranch">Branch Name</label>
                                        <div class="custom-dropdown" data-dropdown="branch">
                                            <input type="text" class="dropdown-input" placeholder="Search branch..." readonly />
                                            <span class="dropdown-arrow">&#9660;</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="filter-group">
                                        <label class="filter-label" for="ddlEmployee">Employee Name</label>
                                        <div class="custom-dropdown" data-dropdown="employee">
                                            <input type="text" class="dropdown-input" placeholder="Search employee..." readonly />
                                            <span class="dropdown-arrow">&#9660;</span>
                                            <div class="dropdown-options"></div>
                                        </div>
                                        <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="hidden-dropdown">
                                        </asp:DropDownList>
                                    </div>
                                    
                                    <div class="search-btn-container">
                                        <asp:Button ID="btnFilter" runat="server" Text="Search" OnClick="btnFilter_Click" CssClass="btn-primary" />
                                    </div>
                                </div>
                            </div>
                                </div>

   <div class="grid-container">
    <asp:GridView ID="GridView1" runat="server" CssClass="gridview"
        AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
        OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="Employee Name" />
            <asp:BoundField DataField="BranchName" HeaderText="Branch" />
            <asp:BoundField DataField="FromDate" HeaderText="From Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="ToDate" HeaderText="To Date" DataFormatString="{0:yyyy-MM-dd}" />
           <asp:BoundField DataField="RefreshAmount" HeaderText="Amount" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnVerify" runat="server" Text="Verify" CommandName="VerifyRow" CommandArgument='<%# Eval("Id") %>'
                        CssClass="btn btn-sm btn-primary" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
                    <asp:Label ID="lblError" runat="server" CssClass="error-label" Visible="false"></asp:Label>

        </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function () {
        // Initialize custom dropdowns
        initializeCustomDropdowns();
        
        // Lock all dropdown arrows in position
        lockDropdownArrows();
    });

    function lockDropdownArrows() {
        // Force all dropdown arrows to be absolutely positioned and locked with perfect centering
        $('.dropdown-arrow').each(function() {
            var $arrow = $(this);
            
            // Lock position with perfect centering using fixed pixel positioning
            $arrow.css({
                'position': 'absolute',
                'right': '8px',
                'top': '11px',
                'transform': 'none',
                'transition': 'none',
                'animation': 'none',
                'will-change': 'auto',
                'backface-visibility': 'hidden',
                'line-height': '12px',
                'display': 'block'
            });
            
            // Prevent any future changes
            $arrow.addClass('arrow-locked');
        });
        
        // Re-lock arrows every 100ms to prevent any changes
        setInterval(function() {
            $('.dropdown-arrow:not(.arrow-locked)').each(function() {
                $(this).css({
                    'position': 'absolute',
                    'right': '8px',
                    'top': '11px',
                    'transform': 'none',
                    'transition': 'none',
                    'animation': 'none',
                    'line-height': '12px',
                    'display': 'block'
                }).addClass('arrow-locked');
            });
            
            // Also re-lock existing arrows to prevent any drift
            $('.arrow-locked').css({
                'top': '11px',
                'transform': 'none',
                'transition': 'none',
                'animation': 'none'
            });
        }, 50);
    }

    function initializeCustomDropdowns() {
        // Sync custom dropdowns with ASP.NET dropdowns
        syncDropdownData('region', '<%= ddlRegion.ClientID %>');
        syncDropdownData('branch', '<%= ddlBranch.ClientID %>');
        syncDropdownData('employee', '<%= ddlEmployee.ClientID %>');
        
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
            
            // Handle cascading - use AJAX instead of postback
            if (dropdownType === 'region') {
                loadBranchesAjax(value);
            } else if (dropdownType === 'branch') {
                var selectedRegion = $('[data-dropdown="region"] .dropdown-input').attr('data-value') || 'All';
                loadEmployeesAjax(value, selectedRegion);
            }
        });

        // Close dropdown when clicking outside
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

    function loadBranchesAjax(regionValue) {
        // Add loading state to branch dropdown
        $('[data-dropdown="branch"]').addClass('loading');
        
        // Freeze all dropdowns to prevent shaking
        $('.custom-dropdown').addClass('frozen');
        $('.filter-container').addClass('postback-freeze');
        
        $.ajax({
            type: "POST",
            url: "RefreshmentVerify.aspx/GetBranches",
            data: JSON.stringify({ regionName: regionValue }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                // Update branch dropdown
                updateDropdownOptions('branch', response.d);
                
                // Reset employee dropdown to "All Employees"
                updateDropdownOptions('employee', [{ value: 'All', text: 'All Employees' }]);
                
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

    function loadEmployeesAjax(branchValue, regionValue) {
        // Add loading state to employee dropdown
        $('[data-dropdown="employee"]').addClass('loading');
        
        // Freeze all dropdowns to prevent shaking
        $('.custom-dropdown').addClass('frozen');
        $('.filter-container').addClass('postback-freeze');
        
        $.ajax({
            type: "POST",
            url: "RefreshmentVerify.aspx/GetEmployees",
            data: JSON.stringify({ branchName: branchValue, regionName: regionValue }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                // Update employee dropdown
                updateDropdownOptions('employee', response.d);
                
                // Remove freeze and loading
                setTimeout(function() {
                    $('.custom-dropdown').removeClass('frozen loading');
                    $('.filter-container').removeClass('postback-freeze');
                }, 50);
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

        // Set default selection to "All" with proper text
        $aspDropdown.val('All');
        var allOptionText = options.find(opt => opt.value === 'All')?.text || 'All';
        $input.val(allOptionText).attr('data-value', 'All');
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
            case 'employee':
                return '<%= ddlEmployee.ClientID %>';
            default:
                return '';
        }
    }

    // Re-initialize dropdowns after postback (for Search button)
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    
    prm.add_endRequest(function() {
        // Re-initialize dropdowns
        initializeCustomDropdowns();
        lockDropdownArrows();
    });
</script>

</asp:Content>
