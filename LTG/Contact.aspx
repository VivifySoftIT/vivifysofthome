<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) { }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string service = ddlService.SelectedValue;
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(subject) || string.IsNullOrWhiteSpace(message))
            {
                ShowNotification("Please fill in all required fields.", "error");
                return;
            }

            if (SendEmail(name, email, phone, service, subject, message))
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
                ShowNotification("Your message has been sent! We'll be in touch within 24 hours.", "success");
            }
            else
            {
                ShowNotification("Something went wrong. Please try again or call us directly.", "error");
            }
        }
        catch (Exception ex)
        {
            ShowNotification("An error occurred: " + ex.Message, "error");
        }
    }

    private bool SendEmail(string name, string email, string phone, string service, string subject, string message)
    {
        try
        {
            MailMessage mail = new MailMessage
            {
                From = new MailAddress(ConfigurationManager.AppSettings["SMTPFrom"], "Vivify Soft Contact Page"),
                Subject = string.Format("[VIVIFY SOFT] New Inquiry: {0}", subject),
                IsBodyHtml = true,
                Body = string.Format(@"
                    <div style='font-family:Inter,sans-serif; padding:30px; background:#f9f8ff; border:1px solid #704df3; border-radius:12px; max-width:600px;'>
                        <h2 style='color:#4524c5; border-bottom:2px solid #704df3; padding-bottom:15px; margin-bottom:20px;'>VIVIFY SOFT | Official Inquiry Received</h2>
                        <p><b>Name:</b> {0}</p>
                        <p><b>Email:</b> {1}</p>
                        <p><b>Phone:</b> {2}</p>
                        <p><b>Service of Interest:</b> {3}</p>
                        <p><b>Subject:</b> {4}</p>
                        <hr style='border:0; border-top:1px solid #eee; margin:20px 0;'>
                        <p><b>Message:</b></p>
                        <p style='background:#fff; padding:15px; border-radius:8px; border-left:4px solid #704df3;'>{5}</p>
                        <hr style='border:0; border-top:1px solid #eee; margin:20px 0;'>
                        <p style='font-size:12px; color:#888;'>Sent from Contact.aspx — VivifySoft.in</p>
                    </div>
                ", name, email, phone, service, subject, message.Replace("\n", "<br>"))
            };
            mail.To.Add("itsupport@vivifysoft.in");
            mail.ReplyToList.Add(new MailAddress(email));

            using (SmtpClient smtp = new SmtpClient(
                ConfigurationManager.AppSettings["SMTPHost"],
                int.Parse(ConfigurationManager.AppSettings["SMTPPort"])))
            {
                smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["SMTPEnableSsl"]);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(
                    ConfigurationManager.AppSettings["SMTPUser"],
                    ConfigurationManager.AppSettings["SMTPPass"]);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(mail);
            }
            return true;
        }
        catch { return false; }
    }

    private void ShowNotification(string message, string type)
    {
        string bg = type == "success" ? "#e8f5e9" : "#ffebee";
        string color = type == "success" ? "#2e7d32" : "#c62828";
        string icon = type == "success" ? "fa-check-circle" : "fa-exclamation-circle";
        string script = string.Format(@"
            (function() {{
                var p = document.getElementById('notify-popup');
                p.style.background = '{0}';
                p.style.color = '{1}';
                p.style.borderLeft = '5px solid {1}';
                p.innerHTML = '<i class=""fas {2}"" style=""font-size:22px;""></i> <span>{3}</span>';
                p.classList.add('show');
                setTimeout(function(){{ p.classList.remove('show'); }}, 5000);
            }})();
        ", bg, color, icon, message);
        ScriptManager.RegisterStartupScript(this, GetType(), "Notify", script, true);
    }
</script>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Vivify Soft</title>
    <meta name="description" content="Get in touch with Vivify Soft. Email, call or visit our Chennai office. We respond within 24 hours.">
    <link href="assets/img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        :root {
            --primary-dark: #232b66; /* Deep brand blue */
            --primary: #232b66;      /* Primary navy */
            --primary-light: #2d3882; /* Lighter shade of brand blue */
            --bg-body: #f7f9fc;
            --bg-card: #ffffff;
            --text-dark: #1f1b3d;
            --text-body: #6f6b8f;
            --accent: #ee2326;    /* Brand red */
            --secondary: #ee2326; /* Brand red alias */
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { scroll-behavior: smooth; }
        body { font-family: 'Poppins', sans-serif; background: var(--bg-body); color: var(--text-body); overflow-x: hidden; line-height: 1.7; }
        h1,h2,h3,h4,h5,h6 { font-weight: 700; color: var(--text-dark); line-height: 1.2; }
        a { text-decoration: none; color: inherit; }

        /* REVEAL */
        .reveal-up { opacity: 0; transform: translateY(40px); transition: all 0.8s cubic-bezier(0.5,0,0,1); }
        .reveal-up.active { opacity: 1; transform: translateY(0); }

        /* ----- PREMIUM CYBER NAVBAR ----- */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 8px 5%; /* Ultra compact navbar */
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-bottom: 2px solid transparent;
            border-image: linear-gradient(90deg, var(--primary), var(--secondary)) 1;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
        }

        .navbar.nav-scrolled {
            padding: 10px 5%;
            background: #232b66; /* Brand Blue */
            border-image: linear-gradient(90deg, #fff, var(--accent)) 1;
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
        }

        .logo { 
            display: flex;
            align-items: center;
            transition: transform 0.3s ease;
        }
        .logo img { 
            height: 70px;
            padding: 0px;
            background: transparent;
            border-radius: 12px;
            box-shadow: none;
            transition: all 0.3s ease;
        }
        .navbar.nav-scrolled .logo img { 
            padding: 8px 12px;
            background: #ffffff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .nav-links { display: flex; gap: 28px; margin-left: 30px; list-style: none; padding: 0; align-items: center; }
        .nav-links li { position: relative; }
        
                .nav-links li a {
            color: #0f172a;
            font-size: 13px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            padding: 10px 0;
            display: flex;
            align-items: center;
            gap: 6px;
            white-space: nowrap;
            transition: all 0.3s ease;
        }

        .navbar.nav-scrolled .nav-links li a {
            color: rgba(255, 255, 255, 0.9);
        }

        .nav-links li.active a, .nav-links li a:hover {
            color: var(--accent);
            opacity: 1;
        }
        
        .navbar.nav-scrolled .nav-links li.active a, 
        .navbar.nav-scrolled .nav-links li a:hover {
            color: #fff;
            text-shadow: 0 0 15px rgba(255, 255, 255, 0.5);
        }
        
        /* Animated indicator */
        .nav-links li::after {
            content: ''; position: absolute; bottom: 0; left: 0; width: 0; height: 2px;
            background: var(--accent); transition: width 0.3s ease;
        }
        .navbar.nav-scrolled .nav-links li::after {
            background: var(--accent);
            box-shadow: 0 0 10px var(--accent);
        }
        .nav-links li.active::after, .nav-links li:hover::after { width: 100%; }

        .mobile-toggle { color: #1f1b3d !important; display: none; cursor: pointer; font-size: 24px; }
        .navbar.nav-scrolled .mobile-toggle { color: #fff !important; }

        /* ----- NAVBAR BUTTONS ----- */
        .nav-btn { display: flex; align-items: center; gap: 14px; }

        .nav-btn .btn-theme {
            padding: 10px 24px;
            font-size: 12px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            border: 2px solid #1a1a1a;
            color: #1a1a1a;
            background: transparent;
            border-radius: 10px !important;
            transition: all 0.3s ease;
            position: relative;
            z-index: 1;
            white-space: nowrap;
        }

        .navbar.nav-scrolled .nav-btn .btn-theme {
            color: #fff;
            border-color: rgba(255, 255, 255, 0.4);
        }

        /* Login Button Styling */
        .nav-btn .btn-theme:last-child {
            background: #1a1a1a; 
            color: #fff;
            border: none;
            clip-path: polygon(0 0, 90% 0, 100% 100%, 10% 100%); /* Cyber shape */
            padding: 10px 28px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .navbar.nav-scrolled .nav-btn .btn-theme:last-child {
            background: #ffffff !important;
            color: #232b66 !important;
            box-shadow: 0 8px 30px rgba(255, 255, 255, 0.3);
        }

        /* NO COLOR CHANGE ON HOVER */
        .nav-btn .btn-theme:hover {
            transform: translateY(-3px);
            color: #fff !important;
            background: var(--accent) !important;
            border-color: var(--accent) !important;
        }

        .nav-btn .btn-theme:last-child:hover {
            transform: translateY(-3px);
            color: #fff !important;
        }

        .info-card:hover { transform: translateY(-10px); box-shadow: 0 25px 60px rgba(69,36,197,0.12); border-color: rgba(69,36,197,0.15); }
        .info-icon {
            width: 70px; height: 70px; border-radius: 18px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            display: flex; align-items: center; justify-content: center;
            font-size: 28px; color: #fff; margin: 0 auto 20px;
            transition: 0.4s;
        }
        .info-card:hover .info-icon { transform: rotate(10deg) scale(1.1); background: var(--accent); }
        .info-card h4 { font-size: 18px; margin-bottom: 10px; }
        .info-card p { font-size: 14px; margin-bottom: 10px; }
        .info-card a { color: var(--accent); font-weight: 600; font-size: 14px; transition: 0.3s; }
        .info-card a:hover { color: var(--accent); opacity: 0.8; }

        /* FORM SECTION */
        .form-section { padding: 50px 5% 70px; }
        .form-wrapper { max-width: 1100px; margin: 0 auto; display: grid; grid-template-columns: 1fr 1.4fr; gap: 60px; align-items: start; }
        @media (max-width: 900px) { .form-wrapper { grid-template-columns: 1fr; } }

        .section-label { font-size: 12px; font-weight: 700; color: var(--accent); text-transform: uppercase; letter-spacing: 3px; margin-bottom: 12px; }
        .form-left h2 { font-size: 36px; margin-bottom: 15px; }
        .form-left p { font-size: 15px; line-height: 1.9; margin-bottom: 20px; }
        .contact-detail { display: flex; align-items: flex-start; gap: 15px; margin-bottom: 20px; }
        .c-icon { width: 45px; height: 45px; background: var(--accent); border-radius: 12px; display: flex; align-items: center; justify-content: center; color: #fff; font-size: 16px; flex-shrink: 0; }
        .c-text h5 { font-size: 13px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; color: var(--text-dark); margin-bottom: 3px; }
        .c-text p, .c-text a { font-size: 14px; color: var(--text-body); text-decoration: none; }
        .c-text a:hover { color: var(--primary); }

        .social-row { display: flex; gap: 12px; margin-top: 25px; }
        .social-btn { width: 42px; height: 42px; background: var(--bg-body); border: 1px solid rgba(0,0,0,0.08); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: var(--text-body); font-size: 16px; transition: 0.3s; }
        .social-btn:hover { background: var(--accent); color: #fff; border-color: var(--accent); transform: translateY(-4px); }

        /* FORM CARD */
        .form-card { background: #fff; border-radius: 24px; padding: 50px 45px; box-shadow: 0 20px 60px rgba(0,0,0,0.08); border: 1px solid rgba(0,0,0,0.04); }
        @media (max-width: 550px) { .form-card { padding: 30px 20px; } }
        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        @media (max-width: 500px) { .form-row { grid-template-columns: 1fr; } }
        .form-grp { margin-bottom: 22px; }
        .form-grp label { display: block; font-size: 12px; font-weight: 700; color: var(--text-dark); margin-bottom: 8px; text-transform: uppercase; letter-spacing: 0.5px; }
        .form-grp input, .form-grp textarea, .form-grp select {
            width: 100%; background: var(--bg-body); border: 1.5px solid rgba(0,0,0,0.08);
            border-radius: 10px; padding: 13px 16px; color: var(--text-dark); font-size: 14px;
            font-family: 'Poppins', sans-serif; outline: none; transition: 0.3s;
        }
        .form-grp input:focus, .form-grp textarea:focus, .form-grp select:focus {
            border-color: var(--primary-light); box-shadow: 0 0 0 3px rgba(112,77,243,0.12);
            background: #fff;
        }
        .form-grp input::placeholder, .form-grp textarea::placeholder { color: #b0aec7; }
        .form-grp textarea { resize: vertical; min-height: 130px; }
        .submit-btn {
            width: 100%; padding: 17px; 
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-light));
            color: #fff; border: none; border-radius: 12px;
            font-size: 15px; font-weight: 700; font-family: 'Poppins', sans-serif;
            cursor: pointer; letter-spacing: 0.5px; transition: 0.3s;
            box-shadow: 0 12px 35px rgba(69,36,197,0.35);
        }
        .submit-btn:hover { transform: translateY(-4px); box-shadow: 0 20px 50px rgba(238, 35, 38, 0.5); }

        /* MAP */
        .map-section { padding: 0 5% 70px; }
        .map-inner { max-width: 1100px; margin: 0 auto; }
        .map-inner h3 { font-size: 28px; margin-bottom: 20px; }
        .map-frame { border-radius: 20px; overflow: hidden; border: 1px solid rgba(0,0,0,0.08); height: 400px; box-shadow: 0 15px 40px rgba(0,0,0,0.07); }
        .map-frame iframe { width: 100%; height: 100%; border: none; }

        /* FAQs */
        .faq-section { padding: 70px 5%; background: #fff; }
        .faq-wrap { max-width: 800px; margin: 0 auto; }
        .faq-item { border: 1px solid rgba(0,0,0,0.07); border-radius: 14px; margin-bottom: 15px; overflow: hidden; }
        .faq-q { padding: 20px 25px; font-size: 15px; font-weight: 600; color: var(--text-dark); cursor: pointer; display: flex; justify-content: space-between; align-items: center; background: #fff; transition: 0.3s; }
        .faq-q:hover { color: var(--primary); }
        .faq-q i { transition: 0.3s; }
        .faq-q.open i { transform: rotate(180deg); color: var(--primary); }
        .faq-a { max-height: 0; overflow: hidden; transition: max-height 0.4s ease, padding 0.4s; padding: 0 25px; font-size: 14px; line-height: 1.9; }
        .faq-a.open { max-height: 300px; padding: 0 25px 20px; }

        /* ----- FOOTER UPDATES ----- */
        footer { 
            background: #202b61; 
            padding: 100px 5% 40px; 
            color: #fff; 
            position: relative; 
            overflow: hidden; 
        }
        footer::before {
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
        }
        .social-btn:hover {
            background: var(--primary);
            color: #fff;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(112, 77, 243, 0.3);
        }

        /* POPUP TOAST */
        #notify-popup {
            position: fixed; top: 30px; right: 30px; padding: 20px 30px;
            border-radius: 12px; font-weight: 600; font-size: 15px;
            display: flex; align-items: center; gap: 15px;
            transform: translateX(120%); transition: 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            z-index: 99999; box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }
        #notify-popup.show { transform: translateX(0); }
        /* ----- DROPDOWN MENU ----- */
        .dropdown { position: relative; }
        .dropdown-menu {
            position: absolute;
            top: 100% !important;
            left: 0;
            width: 280px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 15px 50px rgba(0,0,0,0.1);
            padding: 15px 0;
            opacity: 0;
            visibility: hidden;
            transform: translateY(15px);
            transition: all 0.4s cubic-bezier(0.19, 1, 0.22, 1);
            list-style: none;
            z-index: 1000;
            margin-top: 0;
            border: 1px solid rgba(0,0,0,0.05);
        }
        .dropdown:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }
        .dropdown-menu li {
            width: 100% !important;
            margin: 0 !important;
            border: none !important;
            padding: 0 !important;
        }
        .dropdown-menu li a {
            padding: 12px 25px !important;
            display: flex !important;
            align-items: center;
            gap: 12px;
            font-size: 13px !important;
            color: #1f1b3d !important;
            font-weight: 700 !important;
            text-transform: uppercase !important;
            letter-spacing: 1px !important;
            transition: all 0.3s ease;
            width: 100%;
            border-bottom: none !important;
            background: transparent !important;
        }
        .dropdown-menu li a:after { display: none !important; }
        
        .dropdown-menu li a i {
            width: 32px;
            height: 32px;
            background: rgba(35, 43, 102, 0.05);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: var(--primary);
            transition: 0.3s;
            flex-shrink: 0;
        }
        .dropdown-menu li a:hover {
            background: rgba(35, 43, 102, 0.04) !important;
            color: var(--accent) !important;
            padding-left: 32px !important;
        }
        .dropdown-menu li a:hover i {
            background: var(--accent);
            color: #fff;
        }
        
        @media (max-width: 991px) {
            .dropdown-menu {
                position: static !important;
                width: 100%;
                opacity: 1;
                visibility: visible;
                transform: none;
                background: rgba(255,255,255,0.05) !important;
                box-shadow: none;
                padding: 10px 0 10px 20px;
                display: none; /* Initially hidden on mobile */
                border: none;
            }
            .dropdown.active .dropdown-menu { display: block !important; }
            .dropdown-menu li a { 
                color: rgba(255,255,255,0.7) !important; 
                padding: 12px 0 !important;
            }
            .dropdown-menu li a i { background: rgba(255,255,255,0.1); color: #fff; }
        }

        /* ----- MOBILE NAV ----- */
        .mobile-only { display: none; }
        @media (max-width: 991px) {
            .nav-btn { display: none; }
            .mobile-toggle { display: flex !important; align-items: center; }
            .nav-links {
                position: fixed;
                top: 0; right: -100%;
                width: 80%; max-width: 340px;
                height: 100vh;
                background: #232b66;
                flex-direction: column;
                align-items: flex-start;
                gap: 0;
                padding: 30px 30px 40px;
                overflow-y: auto;
                transition: right 0.4s cubic-bezier(0.19,1,0.22,1);
                z-index: 999;
                box-shadow: -10px 0 40px rgba(0,0,0,0.3);
            }
            .nav-links.active { right: 0; }
            .nav-links li { width: 100%; border-bottom: 1px solid rgba(255,255,255,0.07); }
            .nav-links li a { color: rgba(255,255,255,0.85) !important; padding: 16px 0; font-size: 13px; }
            .nav-links li.active a, .nav-links li a:hover { color: #fff !important; }
            .nav-links li::after { display: none; }
            .mobile-only { display: block; }
            .nav-menu-header img { height: 40px; }
        }

        /* ----- PAGE HERO ----- */
        .page-hero {
            min-height: 380px;
            background: linear-gradient(135deg, #232b66 0%, #1a2055 60%, #0f1540 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 120px 5% 160px;
            position: relative;
            overflow: visible;
        }
        .page-hero .shape { position: absolute; border-radius: 50%; opacity: 0.12; }
        .page-hero .shape-1 { width: 500px; height: 500px; background: var(--accent); top: -180px; right: -100px; }
        .page-hero .shape-2 { width: 350px; height: 350px; background: #4a5bc7; bottom: -120px; left: -80px; }
        .hero-badge {
            display: inline-block; padding: 8px 20px;
            border: 1px solid rgba(238,35,38,0.4); background: rgba(238,35,38,0.1);
            border-radius: 50px; font-size: 12px; font-weight: 700;
            letter-spacing: 2px; text-transform: uppercase; color: var(--accent); margin-bottom: 20px;
        }
        .page-hero h1 { font-size: clamp(32px, 5vw, 56px); color: #ffffff; line-height: 1.15; margin-bottom: 18px; }
        .page-hero > p { font-size: 16px; color: rgba(255,255,255,0.65); max-width: 520px; }
        .wave-bottom { position: absolute; bottom: 0; left: 0; width: 100%; line-height: 0; overflow: hidden; }
        .wave-bottom svg { display: block; }
        .wave-bottom .shape-fill { fill: var(--bg-body); }

        /* ----- INFO SECTION ----- */
        .info-section { padding: 60px 5% 20px; }
        .info-cards { display: grid; grid-template-columns: repeat(3,1fr); gap: 30px; max-width: 1100px; margin: 0 auto; }
        @media (max-width: 768px) { .info-cards { grid-template-columns: 1fr; } }
        .info-card {
            background: var(--bg-card); border-radius: 20px; padding: 40px 30px;
            text-align: center; border: 1px solid rgba(0,0,0,0.06);
            box-shadow: 0 10px 40px rgba(0,0,0,0.05);
            transition: transform 0.4s ease, box-shadow 0.4s ease, border-color 0.4s ease;
        }

        /* ----- LOGIN MODAL ----- */
        .login-modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.6); z-index: 9999; align-items: center; justify-content: center; backdrop-filter: blur(4px); }
        .login-modal-overlay.active { display: flex; }
        .login-modal { background: #fff; border-radius: 20px; padding: 50px 40px; max-width: 420px; width: 90%; position: relative; text-align: center; box-shadow: 0 30px 80px rgba(0,0,0,0.2); }
        .login-modal h2 { font-size: 26px; margin-bottom: 30px; color: var(--text-dark); }
        .close-modal { position: absolute; top: 20px; right: 22px; font-size: 20px; cursor: pointer; color: var(--text-body); transition: 0.3s; }
        .close-modal:hover { color: var(--accent); }
        .login-options { display: flex; flex-direction: column; gap: 14px; }
        .login-opt-btn { display: block; padding: 16px; background: linear-gradient(135deg, var(--primary), var(--primary-light)); color: #fff; border-radius: 12px; font-weight: 700; font-size: 15px; transition: 0.3s; }
        .login-opt-btn:hover { transform: translateY(-3px); box-shadow: 0 12px 30px rgba(35,43,102,0.3); }

        /* ----- FOOTER LEGAL ----- */
        .footer-legal { display: flex; gap: 20px; }
        .footer-legal a { color: rgba(255,255,255,0.4); font-size: 13px; transition: 0.3s; }
        .footer-legal a:hover { color: #fff; }
        @media (max-width: 600px) { .footer-bottom { flex-direction: column; gap: 12px; text-align: center; } .footer-grid { grid-template-columns: 1fr 1fr; } }
        @media (max-width: 400px) { .footer-grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Navbar -->
        <nav class="navbar" id="navbar">
        <a href="Home.aspx" class="logo">
            <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft">
        </a>
        <div class="mobile-toggle" id="mobileToggle">
            <i class="fas fa-bars"></i>
        </div>
        <ul class="nav-links" id="navLinks">
            <li class="nav-menu-header mobile-only">
                <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify">
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
            <li class="active"><a href="Contact.aspx">Contact</a></li>
            <li class="mobile-only" style="margin-top: 25px; width: 100%;">

            </li>
        </ul>
        <div class="nav-btn">

        </div>
    </nav>

        <!-- Hero -->
        <section class="page-hero">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
            <span class="hero-badge" style="color: var(--accent); border-color: rgba(238, 35, 38, 0.4); background: rgba(238, 35, 38, 0.1);">We're Always Listening</span>
            <h1>Let's Build Something <br><span style="color: var(--accent);">Great Together</span></h1>
            <p>Have a project in mind? A question to ask? We'd love to connect. Our team responds within 24 hours.</p>
            <div class="wave-bottom">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                    <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V120H0V95.8C59.71,118.08,130.83,119.2,192.36,108.41Z" class="shape-fill"></path>
                </svg>
            </div>
        </section>

        <!-- Info Cards -->
        <section class="info-section">
            <div class="info-cards">
                <a href="https://maps.app.goo.gl/HT54Ppxeh4vVNE3cA" target="_blank" class="info-card reveal-up" style="text-decoration:none; display:block;">
                    <div class="info-icon"><i class="fas fa-map-marker-alt"></i></div>
                    <h4>Visit Our Office</h4>
                    <p>No. 2B, 1st Floor, 3 & 4 Mogappair Road,<br>Padi, Chennai - 600050, India</p>
                    <span style="color:var(--primary); font-weight:600; font-size:14px;">Open in Maps</span>
                </a>
                <div class="info-card reveal-up" style="transition-delay:0.1s;">
                    <div class="info-icon"><i class="fas fa-envelope-open-text"></i></div>
                    <h4>Send Us an Email</h4>
                    <p>Drop your inquiry anytime - we reply fast.</p>
                    <a href="mailto:itsupport@vivifysoft.in">itsupport@vivifysoft.in</a>
                </div>
                <div class="info-card reveal-up" style="transition-delay:0.2s;">
                    <div class="info-icon"><i class="fas fa-phone-volume"></i></div>
                    <h4>Call Us Directly</h4>
                    <p>Mon-Sat, 9:00 AM - 6:30 PM IST</p>
                    <a href="tel:+918838966643">+91 8838966643</a>
                </div>
            </div>
        </section>

        <!-- Form + Details -->
        <section class="form-section">
            <div class="form-wrapper">
                <div class="form-left reveal-up">
                    <div class="section-label">Get In Touch</div>
                    <h2>Send Us a Message</h2>
                    <p>Fill in the details and one of our specialists will connect with you to discuss your requirements and build the perfect solution.</p>

                    <div class="contact-detail">
                        <div class="c-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <div class="c-text">
                            <h5>Location</h5>
                            <a href="https://maps.app.goo.gl/HT54Ppxeh4vVNE3cA" target="_blank" style="color: inherit; text-decoration: none;">
                                <p>No. 2B, 1st Floor, Mogappair Road, Padi, Chennai - 600050</p>
                            </a>
                        </div>
                    </div>
                    <div class="contact-detail">
                        <div class="c-icon"><i class="fas fa-envelope"></i></div>
                        <div class="c-text">
                            <h5>Email</h5>
                            <a href="mailto:itsupport@vivifysoft.in">itsupport@vivifysoft.in</a>
                        </div>
                    </div>
                    <div class="contact-detail">
                        <div class="c-icon"><i class="fas fa-phone-alt"></i></div>
                        <div class="c-text">
                            <h5>Phone</h5>
                            <a href="tel:+918838966643">+91 8838966643</a>
                        </div>
                    </div>
                    <div class="contact-detail">
                        <div class="c-icon"><i class="fas fa-clock"></i></div>
                        <div class="c-text">
                            <h5>Working Hours</h5>
                            <p>Monday - Saturday: 9:00 AM - 6:30 PM</p>
                        </div>
                    </div>

                    <div class="social-row">
                        <a href="https://www.facebook.com" class="social-btn" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com" class="social-btn" target="_blank"><i class="fab fa-x-twitter"></i></a>
                        <a href="https://www.instagram.com/vivifysoft/" class="social-btn" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/in/vivify-soft-588a813b9/" class="social-btn" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

                <div class="form-card reveal-up" style="transition-delay:0.1s;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-row">
                                <div class="form-grp">
                                    <label>Full Name *</label>
                                    <asp:TextBox ID="txtName" runat="server" placeholder="John Doe"></asp:TextBox>
                                </div>
                                <div class="form-grp">
                                    <label>Email Address *</label>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="john@company.com"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-grp">
                                    <label>Phone Number *</label>
                                    <asp:TextBox ID="txtPhone" runat="server" placeholder="+91 88389 66643"></asp:TextBox>
                                </div>
                                <div class="form-grp">
                                    <label>Service Needed</label>
                                    <asp:DropDownList ID="ddlService" runat="server">
                                        <asp:ListItem>Web Development</asp:ListItem>
                                        <asp:ListItem>Mobile App Development</asp:ListItem>
                                        <asp:ListItem>Custom Enterprise Software</asp:ListItem>
                                        <asp:ListItem>HR &amp; Safety Systems</asp:ListItem>
                                        <asp:ListItem>General Inquiry</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-grp">
                                <label>Subject *</label>
                                <asp:TextBox ID="txtSubject" runat="server" placeholder="How can we help you?"></asp:TextBox>
                            </div>
                            <div class="form-grp">
                                <label>Your Message *</label>
                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" placeholder="Tell us about your project..."></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSend" runat="server" CssClass="submit-btn" Text="Send Message" OnClick="btnSend_Click" />
                            <p style="font-size: 12px; color: #6f6b8f; margin-top: 20px; line-height: 1.6; text-align: left; opacity: 0.8;">
                                *By clicking submit, I agree to the terms &amp; conditions and privacy policy and I am giving my consent to receive updates through SMS/email
                            </p>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </section>

        <!-- Map -->
        <section class="map-section">
            <div class="map-inner reveal-up">
                <h3><a href="https://www.google.com/maps/place/Vivify+Technocrats/@13.0958456,80.1403856,14z/data=!4m6!3m5!1s0x3a5263f43808cb3b:0xf0c1a428643f3e11!8m2!3d13.0958456!4d80.1764345!16s%2Fg%2F11swgfhs_y?entry=tts&g_ep=EgoyMDI2MDMxMS4wIPu8ASoASAFQAw%3D%3D&skid=2f7219e2-2e54-4903-9112-c9e3c8ababc1" target="_blank" style="text-decoration:none; color:inherit;"><i class="fas fa-map-pin" style="color:var(--primary); margin-right:10px;"></i>Our Location - Padi, Chennai <span style="font-size:14px; color:var(--primary); font-weight:400; margin-left:10px;">(View on Google Maps)</span></a></h3>
                <div class="map-frame" style="position: relative;">
                    <a href="https://www.google.com/maps/place/Vivify+Technocrats/@13.0958456,80.1403856,14z/data=!4m6!3m5!1s0x3a5263f43808cb3b:0xf0c1a428643f3e11!8m2!3d13.0958456!4d80.1764345!16s%2Fg%2F11swgfhs_y?entry=tts&g_ep=EgoyMDI2MDMxMS4wIPu8ASoASAFQAw%3D%3D&skid=2f7219e2-2e54-4903-9112-c9e3c8ababc1" target="_blank" style="position: absolute; top:0; left:0; width:100%; height:100%; z-index:10; display:block;"></a>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3885.7609765527475!2d80.17393047590664!3d13.1000764895248!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a5263be5c3c73e9%3A0x7a3f8c7b7c1c0f9!2sPadi%2C%20Chennai%2C%20Tamil%20Nadu%20600050!5e0!3m2!1sen!2sin!4v1710240000000!5m2!1sen!2sin" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" style="pointer-events: none;"></iframe>
                </div>
            </div>
        </section>

        <!-- FAQ -->
        <section class="faq-section">
            <div style="text-align:center; margin-bottom:60px;" class="reveal-up">
                <div class="section-label" style="display:block;">Common Questions</div>
                <h2>Frequently Asked Questions</h2>
                <p style="max-width:550px; margin:10px auto;">Everything you need to know about working with us.</p>
            </div>
            <div class="faq-wrap">
                <div class="faq-item reveal-up">
                    <div class="faq-q" onclick="toggleFaq(this)">How quickly can you start my project? <i class="fas fa-chevron-down"></i></div>
                    <div class="faq-a">We typically begin the discovery phase within 3–5 business days of your first contact. After scoping, development starts immediately with a dedicated sprint team.</div>
                </div>
                <div class="faq-item reveal-up">
                    <div class="faq-q" onclick="toggleFaq(this)">Do you provide post-launch support? <i class="fas fa-chevron-down"></i></div>
                    <div class="faq-a">Absolutely. We offer lifetime post-launch support including bug fixes, feature updates, security patches, and 24/7 monitoring to keep your product running flawlessly.</div>
                </div>
                <div class="faq-item reveal-up">
                    <div class="faq-q" onclick="toggleFaq(this)">What industries do you serve? <i class="fas fa-chevron-down"></i></div>
                    <div class="faq-a">We serve clients across retail, manufacturing, healthcare, logistics, finance, and government sectors. Our solutions are fully custom-built to match your industry's specific needs.</div>
                </div>
                <div class="faq-item reveal-up">
                    <div class="faq-q" onclick="toggleFaq(this)">Can I see a live demo before committing? <i class="fas fa-chevron-down"></i></div>
                    <div class="faq-a">Yes! Please contact us via the form or email to schedule a custom walkthrough session with our engineering team. We'd be happy to show you our solutions in action.</div>
                </div>
            </div>
        </section>

        <!-- Notification Popup -->
        <div id="notify-popup"></div>        <!-- Footer -->
        <footer class="footer">
            <div class="footer-grid">
                <div class="footer-col reveal-up">
                    <div class="footer-logo">
                        <img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft">
                    </div>
                    <p style="color: rgba(255,255,255,0.6); font-size: 15px; line-height: 1.8; margin-top: 15px;">
                        Architecting high-performance digital ecosystems for the modern business landscape.
                    </p>
                </div>
                <div class="footer-col reveal-up">
                    <h4>Nav Links</h4>
                    <ul class="footer-links">
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="AboutUs.aspx">About</a></li>
                        <li><a href="Home.aspx#services">Services</a></li>
                        <li><a href="OurProcess.aspx">Process</a></li>
                    </ul>
                </div>
                <div class="footer-col reveal-up">
                    <h4>Nav Links</h4>
                    <ul class="footer-links">
                        <li><a href="CaseStudy.aspx">Case Study</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>

                    </ul>
                </div>
                <div class="footer-col reveal-up">
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
                    <div class="social-links" style="margin-top: 25px; display: flex; gap: 15px;">
                        <a href="https://x.com/vivifysoft" target="_blank" class="social-btn"><i class="fab fa-x-twitter"></i></a>
                        <a href="https://www.instagram.com/vivifysoft/" target="_blank" class="social-btn"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/in/vivify-soft-588a813b9/" target="_blank" class="social-btn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 Vivify Soft. All Rights Reserved.</p>
                <div class="footer-legal" style="display: flex; gap: 20px; margin-top: 10px;"><a href="Terms.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none;">Terms</a><a href="Privacy.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none;">Privacy</a><a href="Refund.aspx" style="color: rgba(255,255,255,0.6); font-size: 13px; text-decoration: none;">Refund</a></div>
            </div>
        </footer>

        <!-- Login Modal -->
        <div id="loginModal" class="login-modal-overlay">
            <div class="login-modal">
                <i class="fas fa-times close-modal" onclick="closeLoginModal()"></i>
                <h2>Choose Login</h2>
                <div class="login-options">
                    <a href="https://vivifysoft.in/safety/#/AdminLogin" target="_blank" class="login-opt-btn">Safety Tool</a>
                    <a href="https://vivifysoft.in/Login.aspx" target="_blank" class="login-opt-btn">Reimbursement</a>
                    <a href="https://vivifysoft.in/employeehub/" target="_blank" class="login-opt-btn">Employee Hub</a>
                </div>
            </div>
        </div>
    </form>

    <script>
        // Navbar scroll effect
        const navbar = document.getElementById('navbar');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                navbar.classList.add('nav-scrolled');
            } else {
                navbar.classList.remove('nav-scrolled');
            }
        });

        // Hamburger Menu Toggle
        const mobileToggle = document.getElementById('mobileToggle');
        const navLinks = document.getElementById('navLinks');
        
        function toggleMenu() {
            navLinks.classList.toggle('active');
            navbar.classList.toggle('menu-open'); // Add this line to control the navbar's menu-open state
            if (mobileToggle) {
                const icon = mobileToggle.querySelector('i');
                if (icon) { // Added check for icon existence
                    icon.classList.toggle('fa-bars');
                    icon.classList.toggle('fa-times');
                }
            }
        }

        if (mobileToggle) mobileToggle.addEventListener('click', toggleMenu);

        // Close menu when clicking outside
        document.addEventListener('click', (e) => {
            if (navLinks && navLinks.classList.contains('active') && !navLinks.contains(e.target) && !mobileToggle.contains(e.target)) {
                toggleMenu();
            }
        });

        // Intersection Observer for animations
        const observerOptions = { threshold: 0.1 };
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('active');
                }
            });
        }, observerOptions);

        document.querySelectorAll('.reveal-up').forEach(el => observer.observe(el));

        // FAQ toggle
        function toggleFaq(el) {
            el.classList.toggle('open');
            const ans = el.nextElementSibling;
            ans.classList.toggle('open');
        }

        function openLoginModal() {
            document.getElementById('loginModal').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeLoginModal() {
            document.getElementById('loginModal').classList.remove('active');
            document.body.style.overflow = 'auto';
        }

        window.onclick = function(event) {
            const modal = document.getElementById('loginModal');
            if (event.target == modal) { closeLoginModal(); }
        }

            // Mobile Dropdown Toggle Logic
            document.addEventListener('DOMContentLoaded', function() {
                const trigger = document.querySelector('.dropdown-trigger');
                const dropdown = document.querySelector('.dropdown');
                if (trigger && dropdown) {
                    trigger.addEventListener('click', function(e) {
                        if (window.innerWidth <= 991) {
                            e.preventDefault();
                            dropdown.classList.toggle('active');
                            trigger.querySelector('i').classList.toggle('fa-chevron-up');
                            trigger.querySelector('i').classList.toggle('fa-chevron-down');
                        }
                    });
                }
            });
        </script>
</body>
</html>


