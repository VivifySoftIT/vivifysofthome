<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Development | Vivify Soft</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- FontAwesome -->
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
            --white: #ffffff;
            --monitor-bg: #1e293b;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #ffffff; color: var(--text-body); overflow-x: hidden; scroll-behavior: smooth; }
        a { text-decoration: none; color: inherit; }

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
            border-image: linear-gradient(90deg, #232b66, #ee2326) 1;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
        }

        .navbar.nav-scrolled {
            padding: 10px 5%;
            background: #232b66; /* Brand Blue */
            border-image: linear-gradient(90deg, #fff, #ee2326) 1;
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
            color: #ee2326;
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
            background: #ee2326; transition: width 0.3s ease;
        }
        .navbar.nav-scrolled .nav-links li::after {
            background: #ee2326;
            box-shadow: 0 0 10px #ee2326;
        }
        .nav-links li.active::after, .nav-links li:hover::after { width: 100%; }

        .mobile-toggle { color: #1f1b3d !important; cursor: pointer; font-size: 24px; }
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
            text-decoration: none;
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

        /* ----- LOGIN MODAL ----- */
        .login-modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .login-modal-overlay.active { display: flex; }

        .login-modal {
            background: #fff;
            width: 90%;
            max-width: 450px;
            padding: 50px 40px;
            border-radius: 24px;
            position: relative;
            text-align: center;
            animation: modalPop 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        @keyframes modalPop {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .login-modal h2 {
            color: #000;
            font-size: 28px;
            font-weight: 900;
            margin-bottom: 35px;
        }

        .close-modal {
            position: absolute;
            top: 25px;
            right: 25px;
            font-size: 22px;
            color: #666;
            cursor: pointer;
        }

        .login-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .login-opt-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            padding: 16px;
            background: #232b66;
            color: #fff !important;
            border-radius: 12px;
            font-weight: 700;
            font-size: 17px;
            text-decoration: none;
            transition: 0.3s;
        }

        .login-opt-btn:hover {
            background: #1a204d;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(35, 43, 102, 0.3);
        }

        /* ----- HERO SECTION ----- */
        .custom-hero { padding: 130px 5% 90px; background: linear-gradient(135deg, #201768, #18114a); color: #fff; text-align: center; position: relative; overflow: hidden; }
        .custom-hero::before { content: ''; position: absolute; width: 600px; height: 600px; background: rgba(112, 77, 243, 0.15); border-radius: 50%; filter: blur(80px); top: -200px; left: -200px; }
        .custom-hero-content { position: relative; z-index: 2; max-width: 900px; margin: 0 auto; animation: fadeInUp 1s ease forwards; }
        .custom-hero h1 { font-size: 52px; font-weight: 800; line-height: 1.1; margin-bottom: 25px; text-transform: uppercase; text-shadow: 0 5px 15px rgba(0,0,0,0.2); }
        .custom-hero p { font-size: 16px; color: rgba(255,255,255,0.7); line-height: 1.8; margin-bottom: 40px; }

        /* ----- SOLUTIONS SECTION ----- */
        .solutions-section { padding: 50px 5%; background: #ffffff; text-align: center; }
        .solutions-header { max-width: 700px; margin: 0 auto 40px; }
        .solutions-header h2 { font-size: 38px; color: var(--text-dark); margin-bottom: 20px; font-weight: 700; }
        
        .s-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 30px; max-width: 1200px; margin: 0 auto; }
        
        .s-card { background: #f8fafc; padding: 40px 30px; border-radius: 20px; border: 1px solid #e2e8f0; transition: all 0.3s ease; text-align: left; }
        .s-card:hover { transform: translateY(-10px); background: #fff; box-shadow: 0 20px 40px rgba(0,0,0,0.05); border-color: var(--primary-light); }
        
        .s-icon { width: 60px; height: 60px; background: #fff; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 24px; color: var(--primary); margin-bottom: 25px; box-shadow: 0 10px 20px rgba(0,0,0,0.03); }
        .s-card:hover .s-icon { background: var(--primary); color: #fff; }
        
        .s-card h3 { font-size: 22px; color: var(--text-dark); margin-bottom: 15px; font-weight: 700; }
        .s-card p { font-size: 15px; color: var(--text-body); line-height: 1.6; }

        /* ----- DETAILS SECTION ----- */
        .custom-details { padding: 60px 5% 80px; background: var(--bg-body); display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 60px; }
        .cd-img-col { flex: 1.2; min-width: 320px; position: relative; }
        .cd-img-wrapper { position: relative; z-index: 2; border-radius: 20px; overflow: hidden; box-shadow: 0 30px 60px rgba(0,0,0,0.15); }
        .cd-img-wrapper img { width: 100%; display: block; }
        .cd-backdrop { position: absolute; top: 30px; right: -30px; width: 100%; height: 100%; border: 4px solid var(--secondary); border-radius: 20px; z-index: 1; opacity: 0.2; }
        
        .cd-text-col { flex: 1; min-width: 320px; }
        .cd-text-col h2 { font-size: 40px; color: var(--text-dark); margin-bottom: 25px; line-height: 1.3; font-weight: 700; }
        .cd-text-col p { font-size: 16px; color: var(--text-body); line-height: 1.8; margin-bottom: 25px; }
        
        .cd-list { list-style: none; margin-bottom: 35px; }
        .cd-list li { display: flex; align-items: center; gap: 15px; font-size: 16px; font-weight: 600; color: var(--text-dark); margin-bottom: 15px; }
        .cd-list li i { color: var(--accent); font-size: 20px; }

        /* ----- DASHBOARD SHOWCASE (LIVE EXPERIENCE) ----- */
        .dashboard-showcase { padding: 50px 5%; background: #ffffff; text-align: center; }
        .showcase-header { margin-bottom: 40px; }
        .showcase-header h2 { font-size: 36px; font-weight: 700; color: var(--text-dark); }

        .monitor-container { width: 100%; max-width: 1000px; margin: 0 auto; position: relative; perspective: 2000px; }
        
        /* The Monitor Frame */
        .monitor-frame { width: 100%; height: 550px; background: #000; border: 12px solid #334155; border-radius: 20px; box-shadow: 0 40px 80px rgba(0,0,0,0.3); position: relative; overflow: hidden; transform: rotateX(5deg); transition: transform 0.5s ease; }
        .monitor-frame:hover { transform: rotateX(0deg) scale(1.02); }
        
        .monitor-stand { width: 120px; height: 80px; background: #334155; margin: -5px auto 0; border-radius: 0 0 10px 10px; }
        .monitor-base { width: 250px; height: 10px; background: #1e293b; margin: 0 auto; border-radius: 5px; }

        /* ----- FOOTER ----- */
        footer {
            background: #202b61;
            padding: 60px 5% 40px;
            color: #fff;
            position: relative;
            overflow: hidden;
            text-align: left;
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
            margin: 0 auto 80px; 
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

        /* Dashboard Content */
        .dash-content { width: 100%; height: 100%; background: #f1f5f9; display: flex; flex-direction: column; overflow: hidden; }
        
        /* Sidebar */
        .dash-sidebar { width: 180px; background: #1e293b; height: 100%; padding: 20px; color: #fff; position: absolute; left: 0; top: 0; z-index: 10; }
        .dash-side-item { height: 10px; background: rgba(255,255,255,0.1); border-radius: 5px; margin-bottom: 15px; }
        .dash-side-item.active { background: var(--primary); }

        /* Main Dash Area */
        .dash-main { flex: 1; margin-left: 180px; padding: 25px; overflow-y: auto; text-align: left; }
        .dash-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; border-bottom: 1px solid #e2e8f0; padding-bottom: 15px; }
        .dash-user { display: flex; align-items: center; gap: 10px; }
        .dash-avatar { width: 35px; height: 35px; border-radius: 50%; background: #cbd5e1; }

        .dash-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px; }
        .dash-stat-card { background: #fff; padding: 20px; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.02); }
        .dash-stat-val { font-size: 24px; font-weight: 800; color: var(--text-dark); margin-bottom: 5px; }
        .dash-stat-label { font-size: 12px; color: var(--text-body); font-weight: 600; }

        .dash-chart-row { display: grid; grid-template-columns: 2fr 1fr; gap: 20px; }
        .dash-chart-card { background: #fff; padding: 25px; border-radius: 15px; height: 260px; position: relative; }
        
        /* Bar chart simulation */
        .bar-container { display: flex; align-items: flex-end; gap: 15px; height: 150px; margin-top: 30px; }
        .bar { flex: 1; background: var(--primary-light); border-radius: 4px 4px 0 0; animation: barGrow 2s infinite alternate ease-in-out; }

        @keyframes barGrow {
            0% { height: 30%; }
            100% { height: 90%; }
        }

        .dash-list-card { background: #fff; padding: 20px; border-radius: 15px; display: flex; flex-direction: column; gap: 12px; }
        .dash-list-item { display: flex; align-items: center; gap: 10px; }
        .dash-icon-box { width: 32px; height: 32px; border-radius: 8px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; font-size: 14px; }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ----- FINAL CTA ----- */
        .final-cta { padding: 40px 5%; background: #ffffff; text-align: center; }
        .cta-box { 
            max-width: 950px; 
            margin: 0 auto; 
            background: linear-gradient(135deg, #0f172a 0%, var(--primary-dark) 100%); 
            padding: 50px 40px; 
            border-radius: 24px; 
            position: relative; 
            overflow: hidden; 
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.2);
            border: 1px solid rgba(255,255,255,0.05);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }
        .cta-box::after { content: ''; position: absolute; top: -100px; right: -100px; width: 300px; height: 300px; background: var(--primary); opacity: 0.1; border-radius: 50%; filter: blur(60px); }
        .cta-box h2 { font-size: 32px; font-weight: 700; margin-bottom: 0; position: relative; z-index: 2; }
        .cta-box p { font-size: 16px; color: rgba(255,255,255,0.8); margin-bottom: 5px; max-width: 600px; position: relative; z-index: 2; line-height: 1.6; }
        .cta-box .btn-theme { position: relative; z-index: 2; margin-top: 10px; }

        /* Mobile Base Styles (Hidden by default) */
        .mobile-toggle { display: none; }
        .mobile-only { display: none; }
        .nav-menu-header { display: none; }

        @media (max-width: 991px) {
            .navbar { padding: 15px 5%; background: rgba(255, 255, 255, 0.95); }
            .navbar.nav-scrolled { background: #232b66; }
            .nav-btn { display: none; }
            .mobile-toggle { display: block !important; z-index: 1100; cursor: pointer; font-size: 24px; color: #0f172a; }
            .navbar.nav-scrolled .mobile-toggle { color: #fff; }
            .navbar.menu-open .mobile-toggle { color: #fff !important; }
            
            .nav-links {
                position: fixed; top: 0; right: -100%; width: 280px; height: 100vh;
                background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
                flex-direction: column; align-items: stretch; padding: 40px 25px; margin: 0;
                transition: 0.5s cubic-bezier(0.77, 0.2, 0.05, 1); box-shadow: -20px 0 50px rgba(0,0,0,0.5);
                z-index: 1000; display: flex !important; overflow-y: auto; gap: 0;
            }
            .nav-links.active { right: 0; }
            .nav-menu-header { display: flex !important; align-items: center; justify-content: space-between; width: 100% !important; margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid rgba(255,255,255,0.1); }
            .nav-menu-header img { height: 35px; background: #fff; padding: 5px 12px; border-radius: 6px; }
            .nav-links li { width: 100%; }
            .nav-links li a { font-size: 14px; display: block; padding: 12px 0 !important; color: rgba(255,255,255,0.7) !important; text-align: left; width: 100%; border-bottom: 1px solid rgba(255,255,255,0.05); text-transform: none; letter-spacing: normal; }
            .nav-links li.active a { color: #fff !important; font-weight: 700; background: rgba(112, 77, 243, 0.1); }
            .mobile-only { display: block !important; }

            .custom-hero { padding: 140px 5% 80px !important; text-align: center !important; }
            .custom-hero h1 { font-size: 28px !important; line-height: 1.2 !important; }
            .custom-hero p { font-size: 15px !important; }

            .solutions-header h2 { font-size: 30px !important; }
            .s-grid { grid-template-columns: 1fr; }
            
            .custom-details { flex-direction: column; text-align: center; }
            .cd-text-col h2 { font-size: 28px !important; }
            .cd-list li { justify-content: center; }
            .cd-img-wrapper { animation: none !important; }
            .cd-backdrop { display: none; }

            .monitor-frame { height: 400px !important; }
            .dash-sidebar { display: none; }
            .dash-main { margin-left: 0 !important; }
            .dash-grid { grid-template-columns: 1fr !important; }
            .dash-chart-row { grid-template-columns: 1fr !important; }

            .footer-grid { grid-template-columns: 1fr 1fr; gap: 40px; }
        }

        @media (max-width: 768px) {
            .footer-grid { grid-template-columns: 1fr; text-align: center; }
            .footer-col h4::after { left: 50%; transform: translateX(-50%); }
            .footer-bottom { flex-direction: column; gap: 20px; }
            .cta-box h2 { font-size: 24px !important; }
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
                <li class="dropdown active">
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
                <li class="mobile-only" style="margin-top: 25px; width: 100%;">

                </li>
            </ul>
            <div class="nav-btn">

            </div>
        </nav>

        <!-- Hero Section -->
        <section class="custom-hero">
            <div class="custom-hero-content">
                <h4 style="color:var(--accent); text-transform:uppercase; letter-spacing:4px; font-weight:800; font-size:14px; margin-bottom:20px;">ENGINEERED FOR COMPLEXITY</h4>
                <h1>Software & <span style="color: var(--accent);">Custom Solutions</span></h1>
                <p>We solve unique business challenges by building custom software from the ground up. No templates, no limits—just pure code engineered for your specific operational needs.</p>
                <a href="#solutions" class="btn-theme" style="background:#fff; color:var(--primary-dark); padding:15px 40px;">Explore Capabilities</a>
            </div>
        </section>

        <!-- Solutions Section -->
        <section id="solutions" class="solutions-section">
            <div class="solutions-header">
                <h4 style="color:#ee2326; text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Tailored Excellence</h4>
                <h2>Custom Architectures</h2>
            </div>
            
            <div class="s-grid">
                <!-- HR Management -->
                <div class="s-card">
                    <div class="s-icon"><i class="fas fa-users-cog"></i></div>
                    <h3>HR Management Systems</h3>
                    <p>Streamline your workforce with custom portals for employee tracking, performance reviews, and automated payroll synchronization.</p>
                </div>

                <!-- Inventory -->
                <div class="s-card">
                    <div class="s-icon"><i class="fas fa-boxes"></i></div>
                    <h3>Inventory & Logistics</h3>
                    <p>Real-time stock management with predictive analytics, multi-warehouse support, and seamless supply chain integration.</p>
                </div>

                <!-- Advanced Logic -->
                <div class="s-card">
                    <div class="s-icon"><i class="fas fa-microchip"></i></div>
                    <h3>Advanced Logic Engines</h3>
                    <p>Bespoke algorithms designed for high-speed data processing, complex mathematical modeling, and automated decision making.</p>
                </div>

            </div>
        </section>

        <!-- Image & Details Section -->
        <section class="custom-details">
            <div class="cd-img-col">
                <div class="cd-backdrop"></div>
                <div class="cd-img-wrapper">
                    <img src="assets/img/custom dev.jpg" alt="Custom Software Development">
                </div>
            </div>
            
            <div class="cd-text-col">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Beyond the Standard</h4>
                <h2>Enterprise-Grade Custom Software</h2>
                <div style="width: 60px; height: 3px; background:var(--primary); margin-bottom: 25px;"></div>
                
                <p>Most business problems can't be solved with off-the-shelf software. We bridge the gap by building highly specialized tools that integrate directly with your existing workflows.</p>
                
                <p>Our "Custom-First" approach ensures that every line of code serves a purpose, every database query is optimized, and every user interface is built for high-stakes productivity.</p>
                
                <ul class="cd-list">
                    <li><i class="fas fa-check-circle"></i> Proprietary Logic Integration</li>
                    <li><i class="fas fa-check-circle"></i> High-Performance Scalability</li>
                    <li><i class="fas fa-check-circle"></i> 24/7 Enterprise Support</li>
                    <li><i class="fas fa-check-circle"></i> End-to-End Security Audits</li>
                </ul>

                <a href="Home.aspx#contact" class="btn-theme" style="margin-top:15px; background:var(--primary-dark);">Consult An Architect</a>
            </div>
        </section>

        <!-- Dashboard Showcase (Live Experience) -->
        <section class="dashboard-showcase">
            <div class="showcase-header">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Live Experience</h4>
                <h2>Real-Time Management Console</h2>
            </div>

            <div class="monitor-container">
                <div class="monitor-frame">
                    <div class="dash-content">
                        <!-- Sidebar -->
                        <div class="dash-sidebar">
                            <div style="font-weight:900; font-size:14px; margin-bottom:40px; letter-spacing:1px; color:#fff;">VIVIFY ADMIN</div>
                            <div class="dash-side-item active"></div>
                            <div class="dash-side-item"></div>
                            <div class="dash-side-item"></div>
                            <div class="dash-side-item" style="margin-top:50px;"></div>
                            <div class="dash-side-item"></div>
                        </div>

                        <!-- Main Screen -->
                        <div class="dash-main">
                            <div class="dash-header">
                                <div style="font-size:18px; font-weight:700; color:var(--text-dark);">Operational Overview</div>
                                <div class="dash-user">
                                    <span style="font-size:12px; color:var(--text-body);">System Administrator</span>
                                    <div class="dash-avatar"></div>
                                </div>
                            </div>

                            <div class="dash-grid">
                                <div class="dash-stat-card">
                                    <div class="dash-stat-val">102.4k</div>
                                    <div class="dash-stat-label">Daily Transactions</div>
                                </div>
                                <div class="dash-stat-card">
                                    <div class="dash-stat-val" style="color:var(--accent);">99.98%</div>
                                    <div class="dash-stat-label">Success Rate</div>
                                </div>
                                <div class="dash-stat-card">
                                    <div class="dash-stat-val" style="color:var(--secondary);">12.5ms</div>
                                    <div class="dash-stat-label">Avg. Latency</div>
                                </div>
                            </div>

                            <div class="dash-chart-row">
                                <div class="dash-chart-card">
                                    <div style="font-size:14px; font-weight:700; color:var(--text-dark);">Resource Allocation</div>
                                    <div class="bar-container">
                                        <div class="bar" style="height:40%; animation-delay: 0.1s;"></div>
                                        <div class="bar" style="height:60%; animation-delay: 0.3s; background:var(--primary);"></div>
                                        <div class="bar" style="height:85%; animation-delay: 0.5s;"></div>
                                        <div class="bar" style="height:55%; animation-delay: 0.2s; background:var(--secondary);"></div>
                                        <div class="bar" style="height:70%; animation-delay: 0.4s;"></div>
                                        <div class="bar" style="height:30%; animation-delay: 0.6s;"></div>
                                        <div class="bar" style="height:95%; animation-delay: 0.1s; background:var(--accent);"></div>
                                    </div>
                                </div>
                                <div class="dash-list-card">
                                    <div style="font-size:12px; font-weight:800; margin-bottom:10px;">RECENT EVENTS</div>
                                    <div class="dash-list-item">
                                        <div class="dash-icon-box"><i class="fas fa-check" style="color:var(--accent);"></i></div>
                                        <div style="font-size:10px; color:var(--text-body);">Batch Process Complete</div>
                                    </div>
                                    <div class="dash-list-item">
                                        <div class="dash-icon-box"><i class="fas fa-sync" style="color:var(--primary);"></i></div>
                                        <div style="font-size:10px; color:var(--text-body);">Database Synced</div>
                                    </div>
                                    <div class="dash-list-item">
                                        <div class="dash-icon-box"><i class="fas fa-shield-alt" style="color:var(--secondary);"></i></div>
                                        <div style="font-size:10px; color:var(--text-body);">Security Audit Clear</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Monitor Extras -->
                <div class="monitor-stand"></div>
                <div class="monitor-base"></div>
            </div>
        </section>




        <!-- Footer -->
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

        <script>
            // Navbar scroll effect
            const navbar = document.getElementById('navbar');
            window.addEventListener('scroll', () => {
                const scrollPos = window.scrollY;
                if (scrollPos > 80) {
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
                navbar.classList.toggle('menu-open');
                if (mobileToggle) {
                    const icon = mobileToggle.querySelector('i');
                    if (icon) {
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

            // Mobile Dropdown Toggle Logic
            document.addEventListener('DOMContentLoaded', function() {
                const trigger = document.querySelector('.dropdown-trigger');
                const dropdown = document.querySelector('.dropdown');
                if (trigger && dropdown) {
                    trigger.addEventListener('click', function(e) {
                        if (window.innerWidth <= 991) {
                            e.preventDefault();
                            dropdown.classList.toggle('active');
                            const icon = trigger.querySelector('i');
                            if (icon) {
                                icon.classList.toggle('fa-chevron-up');
                                icon.classList.toggle('fa-chevron-down');
                            }
                        }
                    });
                }
            });

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
        </script>
    </form>
</body>
</html>
