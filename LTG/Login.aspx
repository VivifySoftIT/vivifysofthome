<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vivify.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Vivify | Login</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link href="assets/img/favicon.ico" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600|Nunito:300,400,600|Poppins:300,400,500,600" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* Basic reset and body styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .home_banner_area {
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            flex-direction: column;
            padding: 0;
            margin: 0;
            margin-bottom: 15px;
            position: relative;
        }

        .formarea {
            width: 90%;
            max-width: 400px;
            background-color: rgba(35, 43, 102, 0.85); /* Brand Navy with opacity */
            border: 1px solid rgba(238, 35, 38, 0.3);
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            color: black;
            font-weight: bold;
        }

        body {
            background: url(assets/img/airport3.jpeg) no-repeat center center;
            background-size: cover;
        }

        .footer {
            background-color: rgb(249, 243, 243);
            padding: 10px;
            text-align: center;
        }

        .footer a {
            color: midnightblue;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .form-control {
            color: darkblue;
        }

        .forgot-password {
            margin-top: 10px;
            font-size: 14px;
            color: black;
            text-decoration: none;
            transition: color 0.3s;
        }

        .forgot-password:hover {
            color: ghostwhite;
            text-decoration: underline;
        }

        /* Navbar styling */
        .navbar {
            background-color: #232b66; /* Brand navy blue */
        }

        .navbar-nav .nav-link {
            color: white !important;
            font-weight: 600;
            padding: 10px 15px;
             margin-right:60px;
        }

        .navbar-nav .nav-link:hover {
            color: #ee2326 !important;
        }

        .navbar-brand img {
            height: 40px;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .navbar { padding: 10px 5% !important; }
            .navbar-nav .nav-link { margin-right: 0 !important; padding: 12px 0 !important; border-bottom: 1px solid rgba(255,255,255,0.1); }
            .home_banner_area { padding: 40px 5% !important; }
            .formarea { width: 100% !important; max-width: 350px !important; padding: 25px 20px !important; }
            .formarea h5 { font-size: 18px !important; }
        }
        @media (max-width: 576px) {
            .footer { font-size: 0.75rem; padding: 15px !important; }
            .logo_area img { height: 35px !important; }
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="Home.aspx">
                <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft" style="height: 35px; filter: brightness(0) invert(1);">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Home.aspx"><i class="bi bi-house-door"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AboutUs.aspx"><i class="bi bi-info-circle"></i> About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Home.aspx#services"><i class="bi bi-gear"></i> Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Home.aspx#contact"><i class="bi bi-envelope"></i> Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main>
        <div class="home_banner_area">
            <div class="logo_area">
                <a class="navbar-brand logo_h" href="#"><img src="assets/img/BgLogo.png" alt="Logo"></a>
            </div>
            <div class="formarea">
                <div class="form-container">
                    <h5 class="text-center pb-3" style="padding-top:4px; font-weight:bolder; color:ghostwhite">Login to Your Account</h5>

                    <form runat="server">
                        <div class="col-12 p-0 mb-0">
                            <label for="txtUsername" class="form-label">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Enter your username"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtUsername" ForeColor="OrangeRed" ErrorMessage="Please enter your username" />
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtUsername" CssClass="required-field" ErrorMessage="Invalid email format!" 
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$">
                            </asp:RegularExpressionValidator>
                        </div>

                        <div class="col-12 p-0 mb-0">
                            <label for="txtPassword" class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Enter your password"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtPassword" ForeColor="OrangeRed" ErrorMessage="Please enter your password" />
                        </div>

                        <div class="col-12 p-0 mb-0">
                            <asp:Button ID="btnLogin1" runat="server" class="btn btn-primary w-100" OnClick="btnLogin1_Click" Text="Login" style="background-color:#ee2326; border: none; font-weight: 700; padding: 12px; border-radius: 8px;" />
                        </div>

                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" />

                        <div class="col-12 text-center">
                            <a href="ForgotPassword.aspx" class="forgot-password">Forgot Password?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer-vivify">
        <div class="footer-grid">
            <div class="footer-col">
                <div class="footer-logo">
                    <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft Logo">
                </div>
                <p style="color: rgba(255,255,255,0.5); font-size: 14px; line-height: 1.8; margin-top: 10px;">
                    Vivify Soft is a global powerhouse in IT solutions, architecting high-performance digital ecosystems for the modern business landscape.
                </p>
            </div>
            <div class="footer-col">
                <h4>Nav Links</h4>
                <ul class="footer-links">
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="AboutUs.aspx">About</a></li>
                    <li><a href="Home.aspx#services">Services</a></li>
                    <li><a href="OurProcess.aspx">Process</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Nav Links</h4>
                <ul class="footer-links">
                    <li><a href="CaseStudy.aspx">Case Study</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>

                </ul>
            </div>
            <div class="footer-col">
                <h4>Location</h4>
                <p style="color: rgba(255,255,255,0.5); font-size: 14px; line-height: 1.6; margin-bottom: 12px;">
                    <i class="fas fa-map-marker-alt" style="color: var(--primary); margin-right: 8px;"></i>
                    No. 2B, 1st Floor, Mogappair road, Padi, Chennai - 600050
                </p>
                <p style="color: rgba(255,255,255,0.5); font-size: 14px; margin-bottom: 8px;">
                    <i class="fas fa-envelope" style="color: var(--primary); margin-right: 8px;"></i>
                    itsupport@vivifysoft.in
                </p>
                <p style="color: rgba(255,255,255,0.5); font-size: 14px;">
                    <i class="fas fa-phone-alt" style="color: var(--primary); margin-right: 8px;"></i>
                    +91 8838966643
                </p>
                <div style="display: flex; gap: 15px; margin-top: 25px;">
                    <a href="https://x.com/vivifysoft" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-x-twitter"></i></a>
                    <a href="https://www.instagram.com/vivifysoft/" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/vivify-soft-588a813b9/" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="footer-links-policy" style="margin-bottom: 20px; display: flex; justify-content: center; gap: 30px; flex-wrap: wrap;">
                <a href="Terms.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Terms & Conditions</a>
                <a href="Privacy.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Privacy Statement</a>
                <a href="Refund.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none; transition: 0.3s;">Refund Policy</a>
            </div>
            <p>&copy; <script>document.write(new Date().getFullYear())</script> Vivify Soft Architecture. Engineering Future.</p>
        </div>
    </footer>

    <!-- Add fontawesome for footer icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    
    <style>
        :root {
            --primary: #232b66; 
        }
        .footer-vivify { 
            background: #202b61; 
            padding: 80px 5% 30px; 
            color: #fff; 
            position: relative; 
            overflow: hidden; 
            width: 100%;
        }
        .footer-vivify::before {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 1px;
            background: linear-gradient(to right, transparent, var(--primary), transparent);
        }
        .footer-grid { 
            display: grid; 
            grid-template-columns: repeat(4, 1fr); 
            gap: 40px; 
            max-width: 1300px; 
            margin: 0 auto 60px; 
            text-align: left; 
            align-items: start;
        }
        .footer-logo {
            background: #f8f9fa !important; 
            padding: 10px 20px !important; 
            border-radius: 8px !important;
            display: inline-flex;
            align-items: center;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .footer-logo img {
            height: 45px;
            filter: none !important;
        }
        .footer-col h4 { 
            color: #fff; 
            font-size: 18px; 
            font-weight: 800;
            margin-bottom: 30px; 
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
        }
        .footer-col h4::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 30px;
            height: 2px;
            background: var(--primary);
        }
        .footer-links { list-style: none; padding: 0; margin: 0; }
        .footer-links li { margin-bottom: 15px; }
        .footer-links li a { 
            color: rgba(255,255,255,0.6); 
            transition: all 0.3s ease;
            font-size: 15px;
            display: inline-block;
            text-decoration: none;
        }
        .footer-links li a:hover { 
            color: #fff; 
            transform: translateX(8px);
            text-shadow: 0 0 10px rgba(112, 77, 243, 0.5);
        }
        .footer-bottom { 
            border-top: 1px solid rgba(255,255,255,0.05); 
            padding-top: 40px; 
            font-size: 13px; 
            color: rgba(255,255,255,0.4); 
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1300px;
            margin: 0 auto;
        }
        .social-links {
            display: flex;
            gap: 15px;
        }
        .social-btn {
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.05);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            transition: 0.3s;
            border: 1px solid rgba(255,255,255,0.1);
            text-decoration: none;
        }
        .social-btn:hover {
            background: var(--primary);
            color: #fff;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(112, 77, 243, 0.3);
        }
        @media (max-width: 992px) {
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 576px) {
            .footer-grid { grid-template-columns: 1fr; }
            .footer-bottom { flex-direction: column; gap: 20px; }
        }
    </style>

    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
