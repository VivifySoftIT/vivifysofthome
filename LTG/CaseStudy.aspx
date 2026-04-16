<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Case Studies | Vivify Soft</title>
    <link href="assets/img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

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
            --gradient-1: linear-gradient(135deg, #232b66 0%, #111536 100%);
            --gradient-2: linear-gradient(135deg, #ee2326 0%, #b81b1d 100%);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { scroll-behavior: smooth; }
        body { font-family: 'Poppins', sans-serif; background: var(--bg-body); color: var(--text-body); overflow-x: hidden; }
        a { text-decoration: none; color: inherit; }

        /* ----- PREMIUM CYBER NAVBAR ----- */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 8px 5%; /* Ultra compact navbar */ /* Moved to corners */
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-bottom: 2px solid transparent;
            border-image: linear-gradient(90deg, var(--primary), var(--accent)) 1; /* Premium gradient border */
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
            height: 70px; /* Significantly increased logo size */
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
        .logo:hover img { transform: scale(1.05); }

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

        .mobile-toggle { color: #1f1b3d !important; }
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

        .navbar.nav-scrolled .nav-btn .btn-theme:hover {
            color: #fff !important;
            border-color: #fff !important;
        }

        .navbar.nav-scrolled .nav-btn .btn-theme:last-child:hover {
            transform: translateY(-3px);
            color: #232b66 !important;
        }

        .btn-theme {
            background: var(--accent);
            color: #fff;
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 15px;
            box-shadow: 0 10px 20px rgba(238, 35, 38, 0.3);
            transition: all 0.3s ease;
            display: inline-block;
        }
        
        .btn-theme:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 25px rgba(238, 35, 38, 0.4);
            color: #fff;
        }

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

        /* HERO SECTION */
        .cs-hero {
            position: relative; background: var(--gradient-1); padding: 180px 5% 100px;
            text-align: center; color: #fff; overflow: hidden;
        }
        .cs-hero::before {
            content: ''; position: absolute; top:0; left:0; width:100%; height:100%;
            background: url('data:image/svg+xml;utf8,<svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"><g fill="rgba(255,255,255,0.03)"><circle cx="10%" cy="20%" r="50"/><circle cx="80%" cy="70%" r="100"/><circle cx="90%" cy="10%" r="30"/></g></svg>');
            pointer-events: none;
        }
        .cs-title {
            font-size: 56px; font-weight: 900; margin-bottom: 20px; position: relative; z-index: 2;
            text-transform: uppercase; letter-spacing: 2px;
        }
        .cs-title span { color: var(--accent); }
        .cs-subtitle {
            font-size: 18px; max-width: 800px; margin: 0 auto; color: rgba(255,255,255,0.8);
            position: relative; z-index: 2; line-height: 1.8;
        }

        /* CASE STUDY CONTENT */
        .cs-section { padding: 100px 5%; background: #f4f7fa; }
        .cs-container { max-width: 1200px; margin: 0 auto; display: flex; flex-direction: column; gap: 120px; }
        .cs-card {
            display: flex; align-items: stretch; gap: 60px; background: #fff;
            border-radius: 30px; padding: 50px; box-shadow: 0 20px 60px rgba(0,0,0,0.05);
            transition: all 0.5s cubic-bezier(0.2, 0.8, 0.2, 1); position: relative; overflow: hidden;
        }
        .cs-card:hover { transform: translateY(-10px); box-shadow: 0 30px 80px rgba(35, 43, 102, 0.15); }
        .cs-card:nth-child(even) { flex-direction: row-reverse; }
        
        .cs-card::before {
            content: ''; position: absolute; top: -50px; right: -50px; width: 200px; height: 200px;
            background: var(--primary); filter: blur(80px); opacity: 0.1; border-radius: 50%; transition: 0.5s;
        }
        .cs-card:hover::before { opacity: 0.2; transform: scale(1.5); }
        .cs-card:nth-child(even)::before { left: -50px; right: auto; background: var(--accent); }
        .cs-card.third::before { background: #8a2be2; }
        .cs-card.fourth::before { background: #25d366; }

        .cs-img-wrap { flex: 1; position: relative; min-width: 350px; display: flex; justify-content: center; align-items: center; }
        .cs-mockup {
            width: 100%; max-width: 450px; height: auto; min-height: 480px;
            background: linear-gradient(135deg, #f0f3fa, #dfe4f2); border-radius: 20px;
            border: 8px solid #fff; box-shadow: 0 15px 40px rgba(0,0,0,0.08);
            position: relative; overflow: hidden; display: flex; flex-direction: column; transition: 0.5s ease;
        }
        .cs-mockup .header { height: 30px; background: #fff; display: flex; align-items: center; padding: 0 15px; gap: 6px; border-bottom: 2px solid rgba(0,0,0,0.05); }
        .cs-mockup .header span { width: 10px; height: 10px; border-radius: 50%; background: #ff5f56; }
        .cs-mockup .header span:nth-child(2) { background: #ffbd2e; }
        .cs-mockup .header span:nth-child(3) { background: #27c93f; }
        .cs-mockup .body { flex: 1; padding: 25px; display: flex; flex-direction: column; gap: 15px; position: relative; z-index: 1; }
        .mock-line { height: 12px; border-radius: 6px; width: 100%; }
        .cs-card:hover .cs-mockup { transform: scale(1.03) rotate(1deg); box-shadow: 0 25px 50px rgba(0,0,0,0.12); }
        .cs-card:nth-child(even):hover .cs-mockup { transform: scale(1.03) rotate(-1deg); }

        .cs-content { flex: 1.2; padding: 20px; display: flex; flex-direction: column; }
        .cs-tags { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
        .cs-tag {
            background: rgba(35, 43, 102, 0.08); color: var(--primary); padding: 8px 18px;
            border-radius: 30px; font-size: 13px; font-weight: 700; letter-spacing: 1px; text-transform: uppercase;
        }
        .cs-card:nth-child(even) .cs-tag { background: rgba(238, 35, 38, 0.08); color: var(--accent); }
        .cs-card.third .cs-tag { background: rgba(138, 43, 226, 0.08); color: #8a2be2; }
        .cs-card.fourth .cs-tag { background: rgba(37, 211, 102, 0.08); color: #10804b; }
        .cs-content h2 { font-size: 38px; color: var(--text-dark); margin-bottom: 15px; font-weight: 800; line-height: 1.2; }
        .cs-subtitle-desc { font-size: 13px; font-weight: 700; color: #8a8d9f; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 25px; display: block; }
        .cs-content p { font-size: 15px; color: var(--text-body); margin-bottom: 20px; line-height: 1.8; }
        .cs-feature-list { list-style: none; margin-bottom: 30px; padding: 0; display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .cs-feature-list li { font-size: 14px; font-weight: 600; color: var(--text-dark); display: flex; align-items: flex-start; gap: 10px; }
        .cs-feature-list i { color: var(--primary); font-size: 14px; margin-top: 3px; }
        .cs-card:nth-child(even) .cs-feature-list i { color: var(--accent); }
        .cs-card.third .cs-feature-list i { color: #8a2be2; }
        .cs-card.fourth .cs-feature-list i { color: #10804b; }
        .cs-btn-wrap { margin-top: auto; }
        .cs-btn {
            display: inline-flex; align-items: center; gap: 10px; padding: 16px 40px;
            background: var(--primary); color: #fff !important; font-weight: 700; font-size: 15px;
            border-radius: 12px; transition: 0.3s; box-shadow: 0 10px 20px rgba(35, 43, 102, 0.2);
        }
        .cs-card:nth-child(even) .cs-btn { background: var(--accent); box-shadow: 0 10px 20px rgba(238, 35, 38, 0.2); }
        .cs-card.third .cs-btn { background: #8a2be2; box-shadow: 0 10px 20px rgba(138, 43, 226, 0.2); }
        .cs-card.fourth .cs-btn { background: #10804b; box-shadow: 0 10px 20px rgba(37, 211, 102, 0.2); }
        .cs-btn:hover { transform: translateY(-3px); box-shadow: 0 15px 30px rgba(0,0,0, 0.2); }
        .cs-btn i { transition: 0.3s; }
        .cs-btn:hover i { transform: translateX(5px); }

        /* Animations */
        @keyframes fadeInDown { from { opacity: 0; transform: translateY(-30px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes modalPop { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }

        /* --- FOOTER --- */
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

        .footer-grid { 
            display: grid; 
            grid-template-columns: repeat(4, 1fr); 
            gap: 40px; 
            max-width: 1300px; 
            margin: 0 auto 60px; 
            text-align: left; 
            align-items: start;
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
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(112, 77, 243, 0.3);
        }

        /* LOGIN MODAL */
        .login-modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 23, 42, 0.9); backdrop-filter: blur(10px);
            z-index: 2000; display: none; align-items: center; justify-content: center;
            opacity: 0; transition: all 0.4s ease;
        }
        .login-modal-overlay.active { display: flex; opacity: 1; }
        .login-modal {
            background: #fff; width: 90%; max-width: 500px; border-radius: 24px;
            padding: 50px 40px; position: relative; text-align: center;
            box-shadow: 0 40px 100px rgba(0,0,0,0.4); animation: modalPop 0.5s cubic-bezier(0.19, 1, 0.22, 1);
        }
        .close-modal { position: absolute; top: 25px; right: 25px; font-size: 20px; color: #94a3b8; cursor: pointer; transition: 0.3s; }
        .close-modal:hover { color: var(--accent); transform: rotate(90deg); }
        .login-modal h2 { font-size: 32px; font-weight: 800; color: #0f172a; margin-bottom: 35px; }
        .login-options { display: flex; flex-direction: column; gap: 15px; }
        .login-opt-btn {
            background: #f8fafc; border: 2px solid #e2e8f0; padding: 18px; border-radius: 12px;
            color: #0f172a; font-weight: 700; transition: 0.3s; display: block; border-left: 5px solid var(--accent);
        }
        .login-opt-btn:hover { background: #fff; border-color: var(--accent); transform: translateX(10px); box-shadow: 0 10px 25px rgba(0,0,0,0.05); }

        /* --- MOBILE SUPPORT --- */
        .mobile-toggle { display: none; }
        .mobile-only { display: none; }
        .nav-menu-header { display: none; }

        @media (max-width: 991px) {
            .navbar { padding: 15px 5%; background: rgba(255, 255, 255, 0.95); }
            .navbar.nav-scrolled { background: var(--primary); }
            .nav-btn { display: none; }
            .mobile-toggle { display: block !important; z-index: 20001; cursor: pointer; font-size: 24px; color: #0f172a; }
            .navbar.nav-scrolled .mobile-toggle { color: #fff; }
            
            .nav-links {
                position: fixed; top: 0; right: -100%; width: 280px; height: 100vh;
                background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
                flex-direction: column; align-items: stretch; padding: 40px 25px; margin: 0;
                transition: 0.5s cubic-bezier(0.77, 0.2, 0.05, 1); box-shadow: -20px 0 50px rgba(0,0,0,0.5);
                z-index: 20000; display: flex !important; overflow-y: auto; gap: 0;
            }
            .navbar.menu-open .mobile-toggle { color: #fff !important; }
            .nav-links.active { right: 0; }
            .nav-menu-header { display: flex !important; align-items: center; justify-content: space-between; width: 100% !important; margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid rgba(255,255,255,0.1); }
            .nav-menu-header img { height: 35px; background: #fff; padding: 5px 12px; border-radius: 6px; }
            .nav-links li { width: 100%; border-bottom: 1px solid rgba(255,255,255,0.05); }
            .nav-links li a { font-size: 14px; display: block; padding: 15px 0 !important; color: rgba(255,255,255,0.7) !important; text-align: left; }
            .nav-links li.active a { color: #fff !important; font-weight: 700; background: rgba(112, 77, 243, 0.1); }
            .mobile-only { display: block !important; }

            .cs-title { font-size: 32px; }
            .cs-subtitle { font-size: 14px; }
            .cs-card { flex-direction: column !important; padding: 30px; gap: 30px; }
            .cs-img-wrap { min-width: auto; }
            .cs-mockup { min-height: 350px; }
            .cs-content h2 { font-size: 26px; }
            .footer-grid { grid-template-columns: 1fr; text-align: center; }
            .footer-col h4::after { left: 50%; transform: translateX(-50%); }
            .footer-logo { margin: 0 auto 20px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                <li class="active"><a href="CaseStudy.aspx">Case Study</a></li>
                <li><a href="Contact.aspx">Contact</a></li>
                <li class="mobile-only" style="margin-top: 25px; width: 100%;">

                </li>
            </ul>
            <div class="nav-btn">

            </div>
        </nav>

        <!-- Hero Section -->
        <header class="cs-hero">
            <h1 class="cs-title">Case <span>Study</span></h1>
            <p class="cs-subtitle">Dive deep into our portfolio of fully developed, elite digital ecosystems. We build platforms that command industry standards from Enterprise HRMS and Safety Compliance networks to high converting eCommerce digital storefronts.</p>
        </header>

        <!-- Case Study Section -->
        <section class="cs-section">
            <div class="cs-container">
                
                <!-- Case Study 1: Vivify Safety -->
                <div class="cs-card">
                    <div class="cs-img-wrap">
                        <div class="cs-mockup" style="background: linear-gradient(135deg, #fcebfa, #f5d0f1); align-items: center; justify-content: center;">
                            <div style="width: 220px; height: 380px; background: #fff; border-radius: 30px; border: 8px solid #333; position: relative; overflow: hidden; display: flex; flex-direction: column;">
                                <div style="background: var(--accent); padding: 25px 20px 15px; color: #fff;">
                                    <div style="font-size: 11px; opacity: 0.8; margin-bottom: 5px;">Good Afternoon,</div>
                                    <div style="font-size: 18px; font-weight: 800;">User</div>
                                </div>
                                <div style="padding: 20px; flex: 1;">
                                    <div style="font-size: 13px; font-weight: 700; color: #333; margin-bottom: 15px;">Safety Checklist</div>
                                    <div style="display:flex; align-items:center; gap: 10px; margin-bottom: 12px;"><div style="width:16px; height:16px; border: 2px solid #ccc; border-radius: 4px;"></div><span style="font-size: 11px; color:#555;">Helmet worn?</span></div>
                                    <div style="display:flex; align-items:center; gap: 10px; margin-bottom: 12px;"><div style="width:16px; height:16px; border: 2px solid #ccc; border-radius: 4px;"></div><span style="font-size: 11px; color:#555;">Gloves equipped?</span></div>
                                    <div style="display:flex; align-items:center; gap: 10px; margin-bottom: 12px;"><div style="width:16px; height:16px; border: 2px solid #ccc; border-radius: 4px;"></div><span style="font-size: 11px; color:#555;">Vest secured?</span></div>
                                    <div style="width: 100%; text-align: center; background: var(--accent); color: #fff; padding: 10px; border-radius: 8px; font-size: 12px; font-weight: 700; margin-top: 20px;">PROCEED</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cs-content">
                        <div class="cs-tags">
                            <span class="cs-tag">Compliance App</span>
                            <span class="cs-tag">Safety Training</span>
                        </div>
                        <h2>Vivify Safety System</h2>
                        <span class="cs-subtitle-desc">Dual-Module Compliance & Training Platform</span>
                        <p>Engineered for high-risk environments like manufacturing, ensuring daily protocol adherence with a strict dual-module architecture.</p>
                        <ul class="cs-feature-list">
                            <li><i class="fas fa-mobile-alt"></i> <span><strong>Mobile App:</strong> Quick daily check-ins.</span></li>
                            <li><i class="fas fa-shield-check"></i> <span><strong>Real-Time:</strong> Live compliance tracking.</span></li>
                            <li><i class="fas fa-desktop"></i> <span><strong>Admin Center:</strong> Protocol management.</span></li>
                            <li><i class="fas fa-chart-bar"></i> <span><strong>Reporting:</strong> Completion rate visualizer.</span></li>
                        </ul>
                        <div class="cs-btn-wrap">
                            <a href="https://vivifysoft.in/safety/#/AdminLogin" target="_blank" class="cs-btn">View Live Project <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Case Study 2: Employee Hub -->
                <div class="cs-card">
                    <div class="cs-img-wrap">
                        <div class="cs-mockup" style="background: linear-gradient(135deg, #e4e7ff, #caced9);">
                            <div class="header"><span></span><span></span><span></span></div>
                            <div class="body">
                                <div style="display: flex; gap: 15px; height: 100%;">
                                    <div style="width: 80px; background: rgba(35, 43, 102, 0.8); border-radius: 12px; padding: 15px 10px; display: flex; flex-direction: column; gap: 15px;">
                                        <div style="height: 30px; width: 30px; background: rgba(255,255,255,0.2); border-radius: 8px; margin: 0 auto;"></div>
                                        <div style="flex:1;"></div>
                                        <div style="height: 20px; background: rgba(255,255,255,0.1); border-radius: 4px;"></div>
                                        <div style="height: 20px; background: rgba(255,255,255,0.1); border-radius: 4px;"></div>
                                        <div style="height: 20px; background: rgba(255,255,255,0.1); border-radius: 4px;"></div>
                                    </div>
                                    <div style="flex: 1; display: flex; flex-direction: column; gap: 15px;">
                                        <div style="height: 40px; background: #fff; border-radius: 12px; display: flex; align-items: center; padding: 0 15px; justify-content: space-between;">
                                            <div style="width: 100px; height: 10px; background: rgba(0,0,0,0.1); border-radius: 5px;"></div>
                                            <div style="width: 30px; height: 30px; background: rgba(0,0,0,0.1); border-radius: 50%;"></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                                            <div style="height: 80px; background: #fff; border-radius: 12px; padding: 15px; display:flex; flex-direction:column; justify-content:center;">
                                                <span style="font-size: 10px; font-weight: 700; color: #888;">HEADCOUNT</span>
                                                <span style="font-size: 24px; font-weight: 900; color: var(--primary);">245</span>
                                            </div>
                                            <div style="height: 80px; background: #fff; border-radius: 12px; padding: 15px; display:flex; flex-direction:column; justify-content:center;">
                                                <span style="font-size: 10px; font-weight: 700; color: #888;">PENDING</span>
                                                <span style="font-size: 24px; font-weight: 900; color: var(--accent);">12</span>
                                            </div>
                                        </div>
                                        <div style="flex: 1; background: #fff; border-radius: 12px; padding: 15px;">
                                            <div style="width: 25%; height: 8px; background: rgba(0,0,0,0.1); border-radius: 4px; margin-bottom: 20px;"></div>
                                            <div style="width: 100%; height: 5px; background: rgba(0,0,0,0.05); border-radius: 3px; margin-bottom: 12px;"></div>
                                            <div style="width: 90%; height: 5px; background: rgba(0,0,0,0.05); border-radius: 3px; margin-bottom: 12px;"></div>
                                            <div style="width: 70%; height: 5px; background: rgba(0,0,0,0.05); border-radius: 3px;"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cs-content">
                        <div class="cs-tags">
                            <span class="cs-tag">Enterprise HRMS</span>
                            <span class="cs-tag">Web Portal</span>
                        </div>
                        <h2>EmployeeHub System</h2>
                        <span class="cs-subtitle-desc">Complete HR Operations & Management Platform</span>
                        <p>Designed to digitize and automate day-to-day HR workflows, EmployeeHub operates as a centralized control room for HR administrators and managers.</p>
                        <ul class="cs-feature-list">
                            <li><i class="fas fa-id-card"></i> <span><strong>Employee Database:</strong> Searchable directory.</span></li>
                            <li><i class="fas fa-calendar-check"></i> <span><strong>Leave & Attendance:</strong> Automated approvals.</span></li>
                            <li><i class="fas fa-file-invoice-dollar"></i> <span><strong>Payroll:</strong> Salary & payslip generation.</span></li>
                            <li><i class="fas fa-chart-line"></i> <span><strong>Performance Tools:</strong> Goal tracking.</span></li>
                        </ul>
                        <div class="cs-btn-wrap">
                            <a href="https://vivifysoft.in/employeehub/#/Emp_Dashboard" target="_blank" class="cs-btn">View Live Project <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Case Study 3: Hari Silks -->
                <div class="cs-card third">
                    <div class="cs-img-wrap">
                        <div class="cs-mockup" style="background: linear-gradient(135deg, #f5eff0, #e6d3d6);">
                            <div class="header"><span></span><span></span><span></span></div>
                            <div class="body" style="padding: 0;">
                                <div style="height: 120px; background: rgba(138,43,226,0.05); display:flex; flex-direction:column; align-items:center; justify-content:center; gap: 5px;">
                                    <h3 style="color: #8a2be2; margin:0; font-family:serif; font-size:20px;">HARI SILKS</h3>
                                    <span style="font-size: 8px; letter-spacing: 1px;">30 Years of Excellence</span>
                                </div>
                                <div style="padding: 20px;">
                                    <div style="font-size: 13px; font-weight: 800; margin-bottom: 12px;">Signature Sarees</div>
                                    <div style="display: flex; gap: 10px;">
                                        <div style="flex:1; height: 160px; background: #fff; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.05);"></div>
                                        <div style="flex:1; height: 160px; background: #fff; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.05);"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cs-content">
                        <div class="cs-tags">
                            <span class="cs-tag">E-Commerce</span>
                            <span class="cs-tag">Retail Engineering</span>
                        </div>
                        <h2>Hari Silks Storefront</h2>
                        <span class="cs-subtitle-desc">Premium E-Commerce Platform for Traditional Silk</span>
                        <p>Briding a 30-year heritage with modern digital retail, driving robust online presence for silk sarees.</p>
                        <ul class="cs-feature-list">
                            <li><i class="fas fa-crown"></i> <span><strong>Heritage:</strong> Brand story focus.</span></li>
                            <li><i class="fas fa-search"></i> <span><strong>Discovery:</strong> Curated products.</span></li>
                            <li><i class="fas fa-shopping-cart"></i> <span><strong>Checkout:</strong> Fast and frictionless.</span></li>
                        </ul>
                        <div class="cs-btn-wrap">
                            <a href="http://harisilks.com/" target="_blank" class="cs-btn">View Live Project <i class="fas fa-arrow-right"></i></a>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- Footer -->
    <footer class="footer">
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
                <div class="social-links" style="margin-top: 25px; display: flex; gap: 15px;">
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
            <p>&copy; <script>document.write(new Date().getFullYear())</script> Vivify Soft Architecture. Engineering Future.</p>
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
</body>

    <script>
        // Navbar Scroll
        const navbar = document.getElementById("navbar");
        const hero = document.querySelector(".cs-hero"); // The page-specific hero
        
        window.addEventListener("scroll", function() {
            const heroHeight = hero ? hero.offsetHeight : 300;
            const scrollPos = window.scrollY;
            if (scrollPos > (heroHeight - 100)) {
                navbar.classList.add("nav-scrolled");
            } else {
                navbar.classList.remove("nav-scrolled");
            }
        });

        // Mobile Menu
        const mobileToggle = document.getElementById('mobileToggle');
        const navLinks = document.getElementById('navLinks');
        if (mobileToggle) {
            mobileToggle.addEventListener('click', () => {
                navLinks.classList.toggle('active');
                const navbar = document.getElementById('navbar');
                navbar.classList.toggle('menu-open');
                const icon = mobileToggle.querySelector('i');
                icon.classList.toggle('fa-bars');
                icon.classList.toggle('fa-times');
            });
        }

        // Login Modal
        function openLoginModal() {
            document.getElementById('loginModal').classList.add('active');
            document.body.style.overflow = 'hidden';
        }
        function closeLoginModal() {
            document.getElementById('loginModal').classList.remove('active');
            document.body.style.overflow = 'auto';
        }
        window.onclick = (e) => {
            const modal = document.getElementById('loginModal');
            if (e.target == modal) closeLoginModal();
        };

        // Mobile Dropdown
        document.addEventListener('DOMContentLoaded', () => {
            const trigger = document.querySelector('.dropdown-trigger');
            const dropdown = document.querySelector('.dropdown');
            if (trigger && dropdown) {
                trigger.addEventListener('click', (e) => {
                    if (window.innerWidth <= 991) {
                        e.preventDefault();
                        dropdown.classList.toggle('active');
                    }
                });
            }
        });
    </script>
</body>
</html>


