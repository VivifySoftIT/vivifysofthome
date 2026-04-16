<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["success"] == "true")
            {
                ShowMessage("Demo request successfully sent! Our team will contact you shortly.", "success");
            }
        }
    }

    protected void btnBook_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text.Trim();
            string userEmail = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string solution = ddlSolution.SelectedValue;
            string size = ddlSize.SelectedValue;
            string date = txtDate.Text;

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(userEmail) || string.IsNullOrWhiteSpace(date) || string.IsNullOrWhiteSpace(phone))
            {
                ShowMessage("Please fill all required fields!", "error");
                return;
            }

            if (SendEmail(name, userEmail, phone, solution, size, date))
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtDate.Text = "";
                ShowMessage("Demo request successfully sent! Our team will contact you shortly.", "success");
            }
            else
            {
                ShowMessage("Oops! Something went wrong while sending your request.", "error");
            }
        }
        catch (Exception ex)
        {
            ShowMessage("An error occurred: " + ex.Message, "error");
        }
    }

    private bool SendEmail(string name, string userEmail, string phone, string solution, string size, string date)
    {
        try
        {
            string recipient = "itsupport@vivifysoft.in";
            MailMessage mail = new MailMessage
            {
                From = new MailAddress(ConfigurationManager.AppSettings["SMTPFrom"], "Vivify Soft Demo System"),
                Subject = string.Format("[VIVIFY SOFT] New Demo Request: {0}", solution),
                IsBodyHtml = true,
                Body = string.Format(@"
                    <div style='font-family:sans-serif; padding:20px; border:1px solid #704df3; border-radius:12px; background:#f9f8ff; max-width:600px;'>
                        <h2 style='color:#4524c5; margin-bottom:20px; border-bottom:2px solid #704df3; padding-bottom:10px;'>VIVIFY SOFT | Official Demo Request Received</h2>
                        <p><b>Name:</b> {0}</p>
                        <p><b>Email:</b> {1}</p>
                        <p><b>Phone:</b> {2}</p>
                        <p><b>Solution of Interest:</b> {3}</p>
                        <p><b>Company Size:</b> {4}</p>
                        <p><b>Preferred Date:</b> {5}</p>
                        <hr style='border:0; border-top:1px solid #eee; margin:20px 0;'>
                        <p style='font-size:12px; color:#888;'>This request was generated from the Book Demo page on VivifySoft.in</p>
                    </div>
                ", name, userEmail, phone, solution, size, date)
            };

            mail.To.Add(recipient);
            mail.ReplyToList.Add(new MailAddress(userEmail));

            using (SmtpClient smtp = new SmtpClient(
                ConfigurationManager.AppSettings["SMTPHost"],
                int.Parse(ConfigurationManager.AppSettings["SMTPPort"])
            ))
            {
                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["SMTPEnableSsl"]);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(
                    ConfigurationManager.AppSettings["SMTPUser"],
                    ConfigurationManager.AppSettings["SMTPPass"]
                );
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(mail);
            }

            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    private void ShowMessage(string message, string type)
    {
        string color = type == "success" ? "#ee2326" : "#ee2326";
        string bg = type == "success" ? "#fff5f5" : "#fff5f5";

        string script = string.Format(@"
            (function() {{
                const oldPopup = document.getElementById('vivify-msg-popup');
                if(oldPopup) oldPopup.remove();

                const div = document.createElement('div');
                div.id = 'vivify-msg-popup';
                div.style.cssText = 'position:fixed; top:30px; right:30px; padding:20px 30px; background:{0}; color:{1}; border-left:5px solid {1}; border-radius:8px; box-shadow:0 15px 40px rgba(0,0,0,0.15); z-index:99999; font-family:sans-serif; font-weight:600; display:flex; align-items:center; gap:15px; transform:translateX(100%); transition:0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);';
                
                const icon = '{2}' === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle';
                div.innerHTML = '<i class=""fas ' + icon + '"" style=""font-size:22px;""></i> <span>{3}</span>';
                
                document.body.appendChild(div);
                setTimeout(() => div.style.transform = 'translateX(0)', 100);
                setTimeout(() => {{
                    div.style.transform = 'translateX(120%)';
                    setTimeout(() => div.remove(), 600);
                }}, 5000);
            }})();
        ", bg, color, type, message);
        ScriptManager.RegisterStartupScript(this, GetType(), "ShowMsg", script, true);
    }
</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book a Demo | Vivify Soft</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        :root {
            --primary-dark: #111536;
            --primary: #232b66; 
            --primary-light: #2d3882;
            --bg-body: #f7f9fc;
            --bg-card: #ffffff;
            --text-dark: #1f1b3d;
            --text-body: #6f6b8f;
            --accent: #ee2326; 
            --secondary: #ee2326; 
            --gradient-1: linear-gradient(135deg, #232b66 0%, #111536 100%);
            --gradient-2: linear-gradient(135deg, #ee2326 0%, #b81b1d 100%);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background: var(--bg-body); color: var(--text-body); overflow-x: hidden; }

        /* ----- PREMIUM CYBER NAVBAR ----- */
        .navbar {
            position: fixed; top: 0; left: 0; width: 100%; padding: 8px 5%;
            display: flex; justify-content: space-between; align-items: center; z-index: 1000;
            transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
            background: rgba(255, 255, 255, 0.95); backdrop-filter: blur(15px);
            border-bottom: 2px solid transparent; border-image: linear-gradient(90deg, var(--primary), var(--accent)) 1; 
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
        }
        .navbar.nav-scrolled {
            padding: 10px 5%; background: #232b66; 
            border-image: linear-gradient(90deg, #fff, var(--accent)) 1;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
        }
        .logo img { height: 70px; transition: all 0.3s ease; }
        .navbar.nav-scrolled .logo img { padding: 8px 12px; background: #ffffff; border-radius: 12px; }
        
        .nav-links { display: flex; gap: 28px; margin-left: 30px; list-style: none; padding: 0; align-items: center; }
        .nav-links li a {
            color: #0f172a; font-size: 13px; font-weight: 800; text-transform: uppercase;
            letter-spacing: 1.5px; padding: 10px 0; transition: all 0.3s ease; text-decoration: none;
        }
        .navbar.nav-scrolled .nav-links li a { color: rgba(255, 255, 255, 0.9); }
        .nav-links li.active a, .nav-links li a:hover { color: var(--accent); }
        .navbar.nav-scrolled .nav-links li.active a, .navbar.nav-scrolled .nav-links li a:hover { color: #fff; text-shadow: 0 0 15px rgba(255, 255, 255, 0.5); }

        .nav-btn { display: flex; align-items: center; gap: 14px; }
        .btn-theme { padding: 10px 24px; font-size: 12px; font-weight: 800; border: 2px solid #1a1a1a; color: #1a1a1a; border-radius: 10px; text-decoration: none; transition: 0.3s; text-transform: uppercase; }
        .navbar.nav-scrolled .btn-theme { color: #fff; border-color: rgba(255,255,255,0.4); }
        .btn-login { background: #1a1a1a; color: #fff; border: none; clip-path: polygon(0 0, 90% 0, 100% 100%, 10% 100%); padding: 10px 28px; }
        .navbar.nav-scrolled .btn-login { background: #fff !important; color: #232b66 !important; }

        /* ----- MOBILE NAV ----- */
        .mobile-toggle, .mobile-only { display: none; }
        @media (max-width: 991px) {
            .navbar { padding: 12px 5%; }
            .nav-btn { display: none; }
            .mobile-toggle { display: block !important; z-index: 20001; cursor: pointer; font-size: 24px; color: #0f172a; }
            .navbar.nav-scrolled .mobile-toggle { color: #fff; }
            .nav-links {
                position: fixed; top: 0; right: -100%; width: 280px; height: 100vh;
                background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
                flex-direction: column; align-items: stretch; padding: 40px 25px;
                transition: 0.5s cubic-bezier(0.77, 0.2, 0.05, 1); z-index: 20000; display: flex !important;
            }
            .nav-links.active { right: 0; }
            .nav-links li a { color: rgba(255,255,255,0.7) !important; padding: 15px 0 !important; border-bottom: 1px solid rgba(255,255,255,0.05); }
            .nav-links li.active a { color: #fff !important; background: rgba(112, 77, 243, 0.1); }
            .mobile-only { display: block !important; }
            .nav-menu-header { display: flex !important; align-items: center; justify-content: space-between; margin-bottom: 30px; }
            .nav-menu-header img { height: 35px; width: auto; background: #fff; padding: 5px 12px; border-radius: 6px; }
        }

        /* ----- DROPDOWN ----- */
        .dropdown { position: relative; }
        .dropdown-menu {
            position: absolute; top: 100%; left: 0; width: 260px; background: #fff;
            border-radius: 12px; box-shadow: 0 15px 50px rgba(0,0,0,0.1); padding: 15px 0;
            opacity: 0; visibility: hidden; transform: translateY(15px); transition: 0.3s; list-style: none;
        }
        .dropdown:hover .dropdown-menu { opacity: 1; visibility: visible; transform: translateY(0); }
        .dropdown-menu li a { padding: 12px 25px !important; display: flex !important; align-items: center; gap: 12px; color: #1f1b3d !important; font-weight: 700 !important; font-size: 13px !important; border: none !important; }
        .dropdown-menu li a:hover { background: rgba(35,43,102,0.05) !important; color: var(--accent) !important; }

        /* ----- DEMO PAGE SPECIFIC ----- */
        .demo-hero { padding: 160px 5% 100px; background: linear-gradient(135deg, #f0f4ff 0%, #ffffff 100%); text-align: center; }
        .demo-hero h1 { font-size: 48px; color: var(--text-dark); margin-bottom: 20px; font-weight: 800; }
        .demo-hero p { font-size: 18px; max-width: 600px; margin: 0 auto 40px; }

        .booking-container {
            max-width: 1100px; margin: -60px auto 100px; background: #ffffff;
            border-radius: 30px; box-shadow: 0 40px 100px rgba(112, 77, 243, 0.1);
            display: grid; grid-template-columns: 1.2fr 1.8fr; overflow: hidden; border: 1px solid rgba(112, 77, 243, 0.1);
        }
        .booking-info { background: var(--primary); padding: 60px 40px; color: #fff; position: relative; overflow: hidden; }
        .booking-info h2 { font-size: 32px; margin-bottom: 30px; }
        .info-item { display: flex; gap: 20px; margin-bottom: 35px; }
        .info-item i { font-size: 24px; color: var(--secondary); }

        .booking-form-wrap { padding: 60px 50px; background: #fff; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-bottom: 30px; }
        .form-group { display: flex; flex-direction: column; gap: 10px; }
        .form-group label { font-weight: 600; color: var(--text-dark); font-size: 14px; }
        .form-group input, .form-group select { padding: 15px; border: 2px solid #f1f5f9; border-radius: 12px; background: #f8fafc; }
        .btn-book { width: 100%; padding: 18px; background: var(--primary); color: #fff; border: none; border-radius: 15px; font-size: 18px; font-weight: 700; cursor: pointer; transition: 0.3s; margin-top: 20px; }
        .btn-book:hover { background: var(--primary-dark); transform: translateY(-3px); box-shadow: 0 10px 25px rgba(35, 43, 102, 0.3); }

        /* ----- FOOTER ----- */
        footer { background: #202b61; padding: 100px 5% 40px; color: #fff; position: relative; overflow: hidden; }
        .footer-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 40px; max-width: 1300px; margin: 0 auto 60px; }
        .footer-logo { background: #f8f9fa !important; padding: 10px 20px !important; border-radius: 8px !important; display: inline-flex; align-items: center; margin-bottom: 25px; }
        .footer-logo img { height: 45px; }
        .footer-col h4 { color: #fff !important; font-size: 18px !important; font-weight: 800 !important; margin-bottom: 30px !important; text-transform: uppercase !important; letter-spacing: 2px !important; position: relative !important; }
        .footer-col h4::after { content: ''; position: absolute; bottom: -10px; left: 0; width: 30px; height: 2px; background: var(--primary); }
        .footer-links { list-style: none; padding: 0; }
        .footer-links li { margin-bottom: 15px; }
        .footer-links li a { color: rgba(255,255,255,0.6) !important; transition: 0.3s; font-size: 15px !important; text-decoration: none !important; display: inline-block; }
        .footer-links li a:hover { color: #fff !important; transform: translateX(8px); }
        .footer-bottom { border-top: 1px solid rgba(255,255,255,0.05); padding-top: 40px; font-size: 13px; color: rgba(255,255,255,0.4); display: flex; justify-content: space-between; align-items: center; max-width: 1300px; margin: 0 auto; }
        .social-links { display: flex; gap: 15px; }
        .social-btn { width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; border: 1px solid rgba(255,255,255,0.1); text-decoration: none !important; transition: 0.3s; }
        .social-btn:hover { background: var(--primary); transform: translateY(-5px); }

        @media (max-width: 768px) {
            .booking-container { grid-template-columns: 1fr; }
            .form-grid { grid-template-columns: 1fr; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 480px) {
            .footer-grid { grid-template-columns: 1fr; }
        }

        /* ----- LOGIN MODAL ----- */
        .login-modal-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); backdrop-filter: blur(10px); display: none; justify-content: center; align-items: center; z-index: 9999; }
        .login-modal-overlay.active { display: flex; }
        .login-modal { background: #fff; width: 90%; max-width: 450px; padding: 50px 40px; border-radius: 24px; position: relative; text-align: center; }
        .login-opt-btn { display: flex; align-items: center; justify-content: center; padding: 16px; background: #232b66; color: #fff !important; border-radius: 12px; font-weight: 700; text-decoration: none; transition: 0.3s; margin-bottom: 10px; }
        .login-opt-btn:hover { background: #1a204d; transform: translateY(-3px); }
        .close-modal { position: absolute; top: 25px; right: 25px; font-size: 22px; cursor: pointer; color: #666; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <nav class="navbar" id="navbar">
            <a href="Home.aspx" class="logo">
                <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft" />
            </a>
            <div class="mobile-toggle" id="mobileToggle">
                <i class="fas fa-bars"></i>
            </div>
            <ul class="nav-links" id="navLinks">
                <li class="nav-menu-header mobile-only">
                    <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify" />
                    <i class="fas fa-times" onclick="toggleMenu()" style="color:#fff; font-size:24px;"></i>
                </li>
                <li><a href="Home.aspx">Home</a></li>
                <li><a href="AboutUs.aspx">About</a></li>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropdown-trigger">Services <i class="fas fa-chevron-down" style="font-size: 10px; margin-left: 5px; opacity: 0.5;"></i></a>
                    <ul class="dropdown-menu">
                        <li><a href="WebDevelopment.aspx"><i class="fas fa-desktop"></i> Web Development</a></li>
                        <li><a href="MobileDevelopment.aspx"><i class="fas fa-mobile-alt"></i> Mobile Development</a></li>
                        <li><a href="CustomDevelopment.aspx"><i class="fas fa-cogs"></i> Custom Development</a></li>
                    </ul>
                </li>
                <li><a href="OurProcess.aspx">Process</a></li>
                <li><a href="CaseStudy.aspx">Case Study</a></li>
                <li><a href="Contact.aspx">Contact</a></li>
                <li class="mobile-only" style="margin-top: 25px;">

                </li>
            </ul>
            <div class="nav-btn">

                <a href="Home.aspx" class="btn-theme">Home</a>
            </div>
        </nav>

        <section class="demo-hero">
            <h4 style="color:var(--primary); text-transform:uppercase; letter-spacing:3px; font-weight:800; font-size:14px; margin-bottom:15px;">Experience the Future</h4>
            <h1>See Vivify Soft in Action</h1>
            <p>Schedule a personalized walk-through of our solutions and discover how we can transform your business operations.</p>
        </section>

        <div class="booking-container">
            <div class="booking-info">
                <h2>What to Expect?</h2>
                <div class="info-item">
                    <i class="fas fa-magic"></i>
                    <div>
                        <h4>Customized Demo</h4>
                        <p>A tailored tour of features that matter most to your industry.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-user-tie"></i>
                    <div>
                        <h4>Expert Consultation</h4>
                        <p>Discuss your specific challenges with our senior architects.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-chart-line"></i>
                    <div>
                        <h4>ROI Analysis</h4>
                        <p>Get a preliminary view of the efficiency gains you can expect.</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class="fas fa-clock"></i>
                    <div>
                        <h4>30-Min Session</h4>
                        <p>Quick, focused, and high-impact session on your schedule.</p>
                    </div>
                </div>
            </div>

            <div class="booking-form-wrap">
                <asp:UpdatePanel ID="UpdatePanelBook" runat="server">
                    <ContentTemplate>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" placeholder="John Doe" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Work Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="john@company.com" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Solution of Interest</label>
                                <asp:DropDownList ID="ddlSolution" runat="server">
                                    <asp:ListItem>Web Development</asp:ListItem>
                                    <asp:ListItem>Mobile App Development</asp:ListItem>
                                    <asp:ListItem>Custom Enterprise Software</asp:ListItem>
                                    <asp:ListItem>HR & Safety Systems</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Company Size</label>
                                <asp:DropDownList ID="ddlSize" runat="server">
                                    <asp:ListItem>1-10 Employees</asp:ListItem>
                                    <asp:ListItem>11-50 Employees</asp:ListItem>
                                    <asp:ListItem>51-200 Employees</asp:ListItem>
                                    <asp:ListItem>200+ Employees</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-grid">
                            <div class="form-group">
                                <label>Phone Number</label>
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="+91 12345 67890" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Preferred Date</label>
                                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnBook" runat="server" CssClass="btn-book" Text="Reserve My Demo Session" OnClick="btnBook_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <footer class="footer">
            <div class="footer-grid">
                <div class="footer-col">
                    <div class="footer-logo">
                        <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft Logo" />
                    </div>
                    <p style="color: rgba(255,255,255,0.5); font-size: 14px; line-height: 1.8; margin-top: 10px;">
                        Vivify Soft is a global powerhouse in IT solutions, architecting high-performance digital ecosystems for the modern business landscape.
                    </p>
                </div>
                <div class="footer-col">
                    <h4>Explore</h4>
                    <ul class="footer-links">
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="AboutUs.aspx">About Us</a></li>
                        <li><a href="Home.aspx#services">Services</a></li>
                        <li><a href="OurProcess.aspx">Our Process</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Resources</h4>
                    <ul class="footer-links">
                        <li><a href="CaseStudy.aspx">Case Studies</a></li>
                        <li><a href="Contact.aspx">Contact Us</a></li>

                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Contact</h4>
                    <p style="color:rgba(255,255,255,0.5); font-size:14px; margin-bottom:12px;"><i class="fas fa-map-marker-alt" style="color:var(--primary); margin-right:8px;"></i> No. 2B, 1st Floor, Mogappair road, Padi, Chennai - 600050</p>
                    <p style="color:rgba(255,255,255,0.5); font-size:14px; margin-bottom:12px;"><i class="fas fa-envelope" style="color:var(--primary); margin-right:8px;"></i> itsupport@vivifysoft.in</p>
                    <div class="social-links" style="margin-top:20px;">
                        <a href="https://x.com/vivifysoft" target="_blank" class="social-btn"><i class="fab fa-x-twitter"></i></a>
                        <a href="https://www.instagram.com/vivifysoft/" target="_blank" class="social-btn"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/in/vivify-soft-588a813b9/" target="_blank" class="social-btn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
            <div class="footer-links-policy" style="margin-bottom: 20px; display: flex; justify-content: center; gap: 30px; flex-wrap: wrap;">
                <a href="Terms.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Terms & Conditions</a>
                <a href="Privacy.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Privacy Statement</a>
                <a href="Refund.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Refund Policy</a>
            </div>
                <p>&copy; <script>document.write(new Date().getFullYear())</script> Vivify Soft. Engineering Future.</p>
            </div>
        </footer>

        <div id="loginModal" class="login-modal-overlay">
            <div class="login-modal">
                <i class="fas fa-times close-modal" onclick="closeLoginModal()"></i>
                <h2>Portal Access</h2>
                <div class="login-options">
                    <a href="https://vivifysoft.in/safety/#/AdminLogin" target="_blank" class="login-opt-btn">Safety Tool</a>
                    <a href="https://vivifysoft.in/Login.aspx" target="_blank" class="login-opt-btn">Reimbursement</a>
                    <a href="https://vivifysoft.in/employeehub/" target="_blank" class="login-opt-btn">Employee Hub</a>
                </div>
            </div>
        </div>

        <script>
            function toggleMenu() {
                const nav = document.getElementById('navLinks');
                const bar = document.getElementById('navbar');
                nav.classList.toggle('active');
                bar.classList.toggle('menu-open');
            }
            document.getElementById('mobileToggle').addEventListener('click', toggleMenu);

            function openLoginModal() {
                document.getElementById('loginModal').classList.add('active');
                document.body.style.overflow = 'hidden';
            }
            function closeLoginModal() {
                document.getElementById('loginModal').classList.remove('active');
                document.body.style.overflow = 'auto';
            }

            // Close modal when clicking outside
            window.onclick = function(event) {
                const modal = document.getElementById('loginModal');
                if (event.target == modal) {
                    closeLoginModal();
                }
            }

            window.onscroll = function() {
                const nav = document.getElementById('navbar');
                if (window.pageYOffset > 50) nav.classList.add('nav-scrolled');
                else nav.classList.remove('nav-scrolled');
            };

            // Mobile Dropdown
            const trig = document.querySelector('.dropdown-trigger');
            if(trig) {
                trig.addEventListener('click', function(e) {
                    if(window.innerWidth <= 991) {
                        e.preventDefault();
                        this.parentElement.classList.toggle('active');
                    }
                });
            }
        </script>
    </form>
</body>
</html>
