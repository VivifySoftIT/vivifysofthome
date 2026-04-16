<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="Vivify.AboutUs" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Vivify Soft | Our Story, Mission & Team</title>
    <meta name="description" content="Learn about Vivify Soft — our story, mission, values, and the passionate team behind our industry-leading IT solutions.">
    <link href="assets/img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
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
        body { font-family: 'Poppins', sans-serif; background-color: var(--bg-body); color: var(--text-body); overflow-x: hidden; line-height: 1.7; }
        h1,h2,h3,h4,h5,h6 { font-weight: 700; color: var(--text-dark); line-height: 1.2; }
        ul { list-style: none; }
        a { text-decoration: none; color: inherit; }

        /* Scroll reveal */
        .reveal-up { opacity: 0; transform: translateY(40px); transition: all 0.8s cubic-bezier(0.5, 0, 0, 1); }
        .reveal-up.active { opacity: 1; transform: translateY(0); }

        /* ----- NAVBAR ----- */
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
        .logo:hover img { transform: scale(1.05); box-shadow: 0 8px 30px rgba(112, 77, 243, 0.25); }

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

        .mobile-toggle, .mobile-only { color: #1f1b3d !important; display: none; cursor: pointer; font-size: 24px; }
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

        .btn-outline-au:hover { background: rgba(255,255,255,0.1); border-color: #fff; }

        /* ---- STATS BAR ---- */
        .stats-bar {
            background: #fff; padding: 40px 5%;
            box-shadow: 0 10px 60px rgba(0,0,0,0.05);
        }
        .stats-grid {
            display: grid; grid-template-columns: repeat(4, 1fr);
            gap: 40px; max-width: 1100px; margin: 0 auto; text-align: center;
        }
        .stat-item { padding: 20px; }
        .stat-number { font-size: 52px; font-weight: 800; color: var(--accent); line-height: 1; margin-bottom: 10px; }
        .stat-label { font-size: 14px; font-weight: 600; color: var(--text-body); text-transform: uppercase; letter-spacing: 1.5px; }

        /* ---- OUR STORY ---- */
        .our-story {
            padding: 50px 5%; background: var(--bg-body);
        }
        .story-container {
            max-width: 1200px; margin: 0 auto;
            display: flex; align-items: center; gap: 80px; flex-wrap: wrap;
        }
        .story-img-col { flex: 1; min-width: 320px; position: relative; }
        .story-img-main {
            width: 100%; border-radius: 20px; overflow: hidden;
            box-shadow: 0 30px 80px rgba(0,0,0,0.12);
        }
        .story-img-main img { width: 100%; display: block; }
        .story-badge-card {
            position: absolute; bottom: -30px; right: -30px;
            background: var(--accent); color: #fff; padding: 25px 30px;
            border-radius: 16px; box-shadow: 0 20px 40px rgba(238,35,38,0.3);
            text-align: center;
        }
        .story-badge-card .big-num { font-size: 40px; font-weight: 800; line-height: 1; }
        .story-badge-card p { font-size: 12px; font-weight: 600; opacity: 0.85; margin-top: 5px; }
        .story-text-col { flex: 1.2; min-width: 320px; }
        .section-eyebrow { font-size: 13px; font-weight: 700; color: var(--accent); text-transform: uppercase; letter-spacing: 3px; margin-bottom: 15px; }
        .story-text-col h2 { font-size: 44px; color: var(--text-dark); margin-bottom: 25px; line-height: 1.2; }
        .story-text-col p { font-size: 16px; color: var(--text-body); line-height: 1.9; margin-bottom: 20px; }
        .story-divider { width: 50px; height: 3px; background: var(--accent); margin: 25px 0; }

        /* ---- MISSION & VISION ---- */
        .mission-vision { padding: 50px 5%; background: #fff; }
        .mv-container { max-width: 1100px; margin: 0 auto; }
        .mv-header { text-align: center; margin-bottom: 40px; }
        .mv-header h2 { font-size: 44px; color: var(--text-dark); }
        .mv-header p { font-size: 16px; max-width: 600px; margin: 20px auto 0; }
        .mv-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 40px; }
        .mv-card {
            background: var(--bg-body); padding: 50px 40px; border-radius: 20px;
            position: relative; overflow: hidden; transition: all 0.4s ease;
            border: 1px solid rgba(0,0,0,0.04);
        }
        .mv-card::before {
            content: ''; position: absolute; top: 0; left: 0; right: 0; height: 4px;
            background: linear-gradient(to right, var(--accent), var(--secondary));
        }
        .mv-card:hover { transform: translateY(-8px); box-shadow: 0 30px 60px rgba(0,0,0,0.08); }
        .mv-icon {
            width: 70px; height: 70px; background: linear-gradient(135deg, var(--accent), var(--secondary));
            border-radius: 18px; display: flex; align-items: center; justify-content: center;
            margin-bottom: 30px; font-size: 28px; color: #fff;
        }
        .mv-card h3 { font-size: 26px; color: var(--text-dark); margin-bottom: 20px; }
        .mv-card p { font-size: 15px; color: var(--text-body); line-height: 1.9; }

        /* ---- CORE VALUES ---- */
        .core-values { padding: 80px 5%; background: linear-gradient(135deg, #0f172a, #1e1b4b); color: #fff; }
        .cv-header { text-align: center; margin-bottom: 40px; }
        .cv-header h2 { font-size: 44px; color: #fff; }
        .cv-header p { font-size: 16px; color: rgba(255,255,255,0.6); max-width: 600px; margin: 20px auto 0; }
        .cv-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; max-width: 1100px; margin: 0 auto; }
        .cv-card {
            background: rgba(255,255,255,0.04); border: 1px solid rgba(255,255,255,0.08);
            border-radius: 20px; padding: 40px 35px; text-align: center;
            transition: all 0.4s ease; backdrop-filter: blur(10px);
        }
        .cv-card:hover { background: rgba(238,35,38,0.2); border-color: rgba(238,35,38,0.4); transform: translateY(-8px); }
        .cv-num { font-size: 60px; font-weight: 800; color: rgba(238,35,38,0.3); line-height: 1; margin-bottom: 15px; }
        .cv-card h3 { font-size: 22px; color: #fff; margin-bottom: 15px; }
        .cv-card p { font-size: 14px; color: rgba(255,255,255,0.6); line-height: 1.8; }

        /* ---- WHY CHOOSE ---- */
        .why-section { padding: 80px 5%; background: var(--bg-body); }
        .why-container { max-width: 1100px; margin: 0 auto; display: flex; gap: 40px; flex-wrap: wrap; align-items: center; }
        .why-text { flex: 1; min-width: 320px; }
        .why-text h2 { font-size: 44px; margin-bottom: 30px; }
        .why-text p { font-size: 16px; line-height: 1.9; color: var(--text-body); margin-bottom: 40px; }
        .why-list { display: flex; flex-direction: column; gap: 20px; }
        .why-item { display:flex; align-items: flex-start; gap: 20px; }
        .why-item-icon {
            width: 50px; height: 50px; border-radius: 12px; flex-shrink: 0;
            background: linear-gradient(135deg, var(--accent), var(--secondary));
            display: flex; align-items: center; justify-content: center;
            color: #fff; font-size: 18px;
        }
        .why-item-text h4 { font-size: 17px; color: var(--text-dark); margin-bottom: 5px; }
        .why-item-text p { font-size: 14px; color: var(--text-body); }
        .why-img { flex: 1; min-width: 320px; }
        .why-img img { width: 100%; border-radius: 20px; box-shadow: 0 30px 80px rgba(0,0,0,0.1); }

        /* ---- CTA ---- */
        .about-cta {
            padding: 80px 5%; background: #fff; text-align: center;
        }
        .cta-inner {
            max-width: 900px; margin: 0 auto;
            background: linear-gradient(135deg, var(--accent) 0%, #d11e21 100%);
            padding: 80px 60px; border-radius: 30px; position: relative; overflow: hidden;
            box-shadow: 0 30px 80px rgba(238,35,38,0.25);
        }
        .cta-inner::before {
            content: ''; position: absolute; top: -50%; left: -50%;
            width: 200%; height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.08) 0%, transparent 60%);
        }
        .cta-inner h2 { font-size: 32px; color: #fff; margin-bottom: 20px; position: relative; font-weight: 700; }
        .cta-inner p { font-size: 15px; color: rgba(255,255,255,0.8); margin-bottom: 40px; position: relative; }
        .cta-btns { display: flex; gap: 20px; justify-content: center; position: relative; flex-wrap: wrap; }
        .btn-white { padding: 18px 45px; background: #fff; color: var(--accent); border-radius: 50px; font-weight: 800; font-size: 15px; transition: all 0.3s; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .btn-white:hover { transform: translateY(-3px); box-shadow: 0 20px 40px rgba(0,0,0,0.15); }
        .btn-ghost { padding: 18px 45px; border: 2px solid rgba(255,255,255,0.5); color: #fff; border-radius: 50px; font-weight: 700; font-size: 15px; transition: all 0.3s; }
        .btn-ghost:hover { background: rgba(255,255,255,0.1); border-color: #fff; }

        /* ---- FOOTER ---- */
        footer {
            background: #202b61; padding: 100px 5% 40px; color: #fff;
            position: relative; overflow: hidden;
        }
        footer::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 1px;
            background: linear-gradient(to right, transparent, var(--primary), transparent);
        }
        .footer-logo {
            background: #f8f9fa !important; padding: 10px 20px !important;
            border-radius: 8px !important; display: inline-flex;
            align-items: center; margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .footer-logo img { height: 45px; filter: none !important; }
        .footer-grid {
            display: grid; grid-template-columns: repeat(4, 1fr);
            gap: 40px; max-width: 1300px; margin: 0 auto 80px; text-align: left;
            align-items: start;
        }
        .footer-col h4 {
            color: #fff; font-size: 18px; font-weight: 800;
            margin-bottom: 30px; text-transform: uppercase;
            letter-spacing: 2px; position: relative;
        }
        .footer-col h4::after {
            content: ''; position: absolute; bottom: -10px; left: 0;
            width: 30px; height: 2px; background: var(--primary);
        }
        .footer-links { list-style: none; padding: 0; margin: 0; }
        .footer-links li { margin-bottom: 15px; }
        .footer-links li a { color: rgba(255,255,255,0.6); transition: all 0.3s ease; font-size: 15px; display: inline-block; }
        .footer-links li a:hover { color: #fff; transform: translateX(8px); text-shadow: 0 0 10px rgba(112,77,243,0.5); }
        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.05); padding-top: 40px;
            font-size: 13px; color: rgba(255,255,255,0.4);
            display: flex; justify-content: space-between; align-items: center;
            max-width: 1300px; margin: 0 auto;
        }
        .social-links { display: flex; gap: 15px; }
        .social-btn {
            width: 40px; height: 40px; background: rgba(255,255,255,0.05);
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1);
        }
        .social-btn:hover { background: var(--accent); transform: translateY(-5px); box-shadow: 0 10px 20px rgba(238,35,38,0.3); }

        /* ----- MOBILE RESPONSIVE ----- */
        /* Mobile Base Styles (Hidden by default) */
        .mobile-toggle { display: none; }
        .mobile-only { display: none; }
        .nav-menu-header { display: none; }

        @media (max-width: 991px) {
            .navbar { padding: 15px 5%; background: rgba(255, 255, 255, 0.95); }
            .navbar.nav-scrolled { background: var(--primary); }
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
            .nav-links li a { font-size: 14px; display: block; padding: 12px 0 !important; color: rgba(255,255,255,0.7) !important; text-align: left; width: 100%; border-bottom: 1px solid rgba(255,255,255,0.05); }
            .nav-links li.active a { color: #fff !important; font-weight: 700; background: rgba(112, 77, 243, 0.1); }
            .mobile-only { display: block !important; }

            .au-hero { padding: 140px 5% 140px !important; }
            .au-hero h1 { font-size: 32px !important; }
            .au-hero p { font-size: 15px !important; }

            .stats-grid { grid-template-columns: repeat(2, 1fr) !important; gap: 20px !important; }
            .stat-number { font-size: 36px !important; }

            .story-container { flex-direction: column; gap: 40px !important; text-align: center; }
            .story-text-col h2 { font-size: 30px !important; }
            .story-divider { margin: 20px auto !important; }
            .story-badge-card { position: relative !important; right: 0 !important; bottom: 0 !important; margin-top: 20px; display: inline-block; }

            .mv-grid { grid-template-columns: 1fr !important; }
            .mv-header h2 { font-size: 30px !important; }

            .cv-grid { grid-template-columns: 1fr !important; }
            .cv-header h2 { font-size: 30px !important; }

            .why-container { flex-direction: column; text-align: center; }
            .why-text h2 { font-size: 30px !important; }
            .why-item { flex-direction: column; align-items: center; text-align: center; }

            .cta-inner { padding: 50px 30px !important; }
            .cta-inner h2 { font-size: 28px !important; }

            .footer-grid { grid-template-columns: 1fr 1fr !important; gap: 40px !important; }
        }

        @media (max-width: 768px) {
            .footer-grid { grid-template-columns: 1fr !important; text-align: center; }
            .footer-col h4::after { left: 50%; transform: translateX(-50%); }
            .footer-bottom { flex-direction: column; gap: 20px; text-align: center; }
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
            color: var(--accent);
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
            .navbar .logo img { height: 35px; } /* Fixes massive logo issue on desktop */
            .mobile-only { display: none; }
            .nav-menu-header { display: none; }

            .navbar { padding: 15px 5%; }
            .nav-btn { display: none; }
            .mobile-toggle { display: block !important; z-index: 1100; color: #0f172a; }
            .navbar.nav-scrolled .mobile-toggle { color: #fff; }
            .nav-links {
                position: fixed; top: 0; right: -100%; width: 280px; height: 100vh;
                background: #0f172a; flex-direction: column; align-items: stretch; padding: 40px 25px; margin: 0;
                transition: 0.5s; z-index: 1000; display: flex !important;
            }
            .nav-links.active { right: 0; }
            .mobile-only { display: block !important; }
            .nav-menu-header { display: flex !important; align-items: center; justify-content: center; margin-bottom: 30px; }
            .nav-menu-header img { height: 40px; background: #fff; padding: 5px 12px; border-radius: 6px; }
            .nav-links li a { color: rgba(255,255,255,0.7) !important; padding: 15px 0; border-bottom: 1px solid rgba(255,255,255,0.05); }

            .dropdown-menu { position: static !important; width: 100%; opacity: 1; visibility: visible; transform: none; background: rgba(255,255,255,0.05) !important; box-shadow: none; padding: 10px 0 10px 20px; display: none; border: none; }
            .dropdown.active .dropdown-menu { display: block !important; }
            .dropdown-menu li a { color: rgba(255,255,255,0.7) !important; padding: 12px 0 !important; }
            .dropdown-menu li a i { background: rgba(255,255,255,0.1); color: #fff; }
        }

        /* ----- LOGIN MODAL ----- */
        .login-modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.8); backdrop-filter: blur(10px);
            display: none; justify-content: center; align-items: center; z-index: 9999;
        }
        .login-modal-overlay.active { display: flex; }
        .login-modal {
            background: #fff; width: 90%; max-width: 450px; padding: 50px 40px;
            border-radius: 24px; position: relative; text-align: center;
            animation: modalPop 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        @keyframes modalPop { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }
        .login-modal h2 { color: #000; font-size: 28px; font-weight: 900; margin-bottom: 35px; }
        .close-modal { position: absolute; top: 25px; right: 25px; font-size: 22px; color: #666; cursor: pointer; }
        .login-options { display: flex; flex-direction: column; gap: 15px; }
        .login-opt-btn {
            display: flex; align-items: center; justify-content: center; gap: 12px; padding: 16px;
            background: #232b66; color: #fff !important; border-radius: 12px;
            font-weight: 700; font-size: 17px; transition: 0.3s; text-decoration: none;
        }
        .login-opt-btn:hover { background: #1a204d; transform: translateY(-3px); box-shadow: 0 10px 20px rgba(35, 43, 102, 0.3); }
        /* ----- HERO SECTION ----- */
        .au-hero {
            position: relative;
            padding: 180px 5% 140px;
            background: linear-gradient(135deg, #232b66 0%, #1a204d 100%);
            color: #fff;
            text-align: center;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 70vh;
        }

        .au-hero::before {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: radial-gradient(circle at 70% 30%, rgba(238, 35, 38, 0.1), transparent 50%);
            pointer-events: none;
        }

        .au-hero-content {
            max-width: 900px;
            position: relative;
            z-index: 10;
        }

        .au-hero h1 {
            font-size: 56px;
            font-weight: 800;
            color: #fff;
            margin-bottom: 25px;
            line-height: 1.1;
            letter-spacing: -1px;
        }

        .au-hero h1 span {
            color: var(--accent);
        }

        .au-hero p {
            font-size: 18px;
            color: rgba(255, 255, 255, 0.8);
            max-width: 750px;
            margin: 0 auto 40px;
            line-height: 1.8;
        }

        .au-hero-btns {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .hero-wave {
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            z-index: 5;
            line-height: 0;
        }

        .hero-wave svg {
            height: 100px;
            width: 100%;
        }

        .hero-wave svg path {
            fill: var(--bg-body);
        }

        .btn-theme-outline {
            padding: 16px 40px;
            font-size: 14px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #fff;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn-theme-outline:hover {
            border-color: #fff;
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-3px);
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
            <li class="active"><a href="AboutUs.aspx">About</a></li>
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
            <li class="mobile-only" style="margin-top: 25px; width: 100%;">

            </li>
        </ul>
        <div class="nav-btn">

        </div>
    </nav>

    <!-- HERO SECTION -->
    <section class="au-hero">
        <div class="au-hero-content reveal-up">
            <h1>We Build <span>NEXT-GEN MOBILITY</span> Together</h1>
            <p>Founded in Chennai, Vivify Soft is a passionate team of engineers, designers, and strategists dedicated to transforming the way businesses operate through innovative technology.</p>
            <div class="au-hero-btns">
                <a href="#story" class="btn-theme-outline" style="background: var(--accent); border-color: var(--accent);">Discover Our Journey</a>
                <a href="Home.aspx#contact" class="btn-theme-outline">Get In Touch</a>
            </div>
        </div>
        <div class="hero-wave">
            <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V120H0V95.8C59.71,118.08,130.83,119.2,192.36,108.41Z"></path>
            </svg>
        </div>
    </section>

    <!-- Stats Bar -->
    <section class="stats-bar">
        <div class="stats-grid">
            <div class="stat-item reveal-up">
                <div class="stat-number">50+</div>
                <div class="stat-label">Clients Served</div>
            </div>
            <div class="stat-item reveal-up" style="transition-delay:0.1s;">
                <div class="stat-number">25+</div>
                <div class="stat-label">Projects Delivered</div>
            </div>
            <div class="stat-item reveal-up" style="transition-delay:0.2s;">
                <div class="stat-number">5+</div>
                <div class="stat-label">Industries Covered</div>
            </div>
            <div class="stat-item reveal-up" style="transition-delay:0.3s;">
                <div class="stat-number">100%</div>
                <div class="stat-label">Client Satisfaction</div>
            </div>
        </div>
    </section>

    <!-- Our Story -->
    <section class="our-story" id="story">
        <div class="story-container">
            <div class="story-img-col reveal-up">
                <div class="story-img-main">
                    <img src="assets/img/about-image 3.png" alt="Vivify Soft Team">
                </div>
                <div class="story-badge-card">
                    <div class="big-num">2024</div>
                    <p>Year Founded</p>
                </div>
            </div>

            <div class="story-text-col reveal-up" style="transition-delay:0.2s;">
                <p class="section-eyebrow">Our Story</p>
                <h2>From Idea to Industry Leader</h2>
                <div class="story-divider"></div>
                <p>
                    Vivify Soft was born from a simple but powerful belief: technology should empower people, not complicate their lives. Founded in 2024 and headquartered in Chennai, India, we set out to build software solutions that are elegant, efficient, and impactful.
                </p>
                <p>
                    Today, we serve clients across multiple industries — from safety and retail to HR management — helping businesses of all sizes harness the power of modern web and mobile technology. Our products are trusted by companies across the region, and our reputation speaks for itself.
                </p>
                <p>
                    Every product we build reflects our commitment to quality, speed, and innovation. Our skilled team of engineers and designers works tirelessly to deliver applications that don't just function, but truly delight.
                </p>
            </div>
        </div>
    </section>

    <!-- Mission & Vision -->
    <section class="mission-vision" id="mission">
        <div class="mv-container">
            <div class="mv-header reveal-up">
                <p class="section-eyebrow">What Drives Us</p>
                <h2>Our Mission & Vision</h2>
                <p>Every decision we make is guided by a clear purpose and an ambitious vision for the future.</p>
            </div>
            <div class="mv-grid">
                <div class="mv-card reveal-up">
                    <div class="mv-icon"><i class="fas fa-rocket"></i></div>
                    <h3>Our Mission</h3>
                    <p>To empower businesses with cutting-edge, reliable, and scalable technology solutions that drive measurable growth, enhance operational efficiency, and deliver exceptional user experiences across web and mobile platforms.</p>
                </div>
                <div class="mv-card reveal-up" style="transition-delay:0.15s;">
                    <div class="mv-icon"><i class="fas fa-eye"></i></div>
                    <h3>Our Vision</h3>
                    <p>To become the most trusted technology partner for businesses across South Asia and beyond — a company recognized for its innovation, integrity, and unwavering commitment to transforming the digital landscape.</p>
                </div>
                <div class="mv-card reveal-up" style="transition-delay:0.2s;">
                    <div class="mv-icon"><i class="fas fa-handshake"></i></div>
                    <h3>Our Promise</h3>
                    <p>We promise to listen first, build with precision, and deliver beyond expectations. Your success is our success, and we are committed to supporting you at every stage of your digital journey.</p>
                </div>
                <div class="mv-card reveal-up" style="transition-delay:0.3s;">
                    <div class="mv-icon"><i class="fas fa-users"></i></div>
                    <h3>Our Team</h3>
                    <p>Our diverse team of engineers, designers, and strategists brings deep expertise and a shared passion for creating great software. We collaborate, innovate, and grow together to deliver results that matter.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Values -->
    <section class="core-values" id="values">
        <div style="max-width:1100px; margin:0 auto;">
            <div class="cv-header reveal-up">
                <p class="section-eyebrow" style="color: var(--primary-light);">What We Stand For</p>
                <h2>Our Core Values</h2>
                <p>These principles are the foundation of everything we do, from how we write code to how we treat our clients.</p>
            </div>
            <div class="cv-grid">
                <div class="cv-card reveal-up">
                    <div class="cv-num">01</div>
                    <h3>Innovation First</h3>
                    <p>We embrace emerging technologies and creative thinking to solve complex problems in ways that set our clients apart from the competition.</p>
                </div>
                <div class="cv-card reveal-up" style="transition-delay:0.1s;">
                    <div class="cv-num">02</div>
                    <h3>Quality Without Compromise</h3>
                    <p>Every line of code, every design decision, and every feature we build is crafted with the highest standards of quality and attention to detail.</p>
                </div>
                <div class="cv-card reveal-up" style="transition-delay:0.2s;">
                    <div class="cv-num">03</div>
                    <h3>Client Partnership</h3>
                    <p>We believe in deep, long-term partnerships with our clients. We listen carefully, communicate transparently, and deliver with integrity.</p>
                </div>
                <div class="cv-card reveal-up" style="transition-delay:0.3s;">
                    <div class="cv-num">04</div>
                    <h3>Continuous Growth</h3>
                    <p>We are committed to constant learning and improvement — always staying ahead of industry trends to bring our clients the best solutions.</p>
                </div>
                <div class="cv-card reveal-up" style="transition-delay:0.4s;">
                    <div class="cv-num">05</div>
                    <h3>Speed & Reliability</h3>
                    <p>We deliver on time, every time. Our agile processes and disciplined team ensure fast turnarounds without sacrificing reliability.</p>
                </div>
                <div class="cv-card reveal-up" style="transition-delay:0.5s;">
                    <div class="cv-num">06</div>
                    <h3>Security & Trust</h3>
                    <p>We bake security into every layer of our solutions. Your data, your users, and your business are safe in our hands.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section class="why-section">
        <div class="why-container">
            <div class="why-text reveal-up">
                <p class="section-eyebrow">Why Vivify Soft</p>
                <h2>Built for Businesses That Mean Business</h2>
                <p>We don't just write code — we engineer solutions that transform the way companies operate. Here's why leading businesses choose Vivify Soft.</p>
                <div class="why-list">
                    <div class="why-item">
                        <div class="why-item-icon"><i class="fas fa-bolt"></i></div>
                        <div class="why-item-text">
                            <h4>Lightning-Fast Delivery</h4>
                            <p>Our agile methodology ensures rapid development cycles without sacrificing quality.</p>
                        </div>
                    </div>
                    <div class="why-item">
                        <div class="why-item-icon"><i class="fas fa-shield-alt"></i></div>
                        <div class="why-item-text">
                            <h4>Enterprise-Grade Security</h4>
                            <p>Industry-leading security protocols protect your data and your users at every level.</p>
                        </div>
                    </div>
                    <div class="why-item">
                        <div class="why-item-icon"><i class="fas fa-headset"></i></div>
                        <div class="why-item-text">
                            <h4>Dedicated Support</h4>
                            <p>Our team is available around the clock to ensure your systems run flawlessly.</p>
                        </div>
                    </div>
                    <div class="why-item">
                        <div class="why-item-icon"><i class="fas fa-chart-line"></i></div>
                        <div class="why-item-text">
                            <h4>Proven Results</h4>
                            <p>Our clients see real, measurable improvements in revenue, efficiency, and user satisfaction.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="why-img reveal-up" style="transition-delay:0.2s;">
                <img src="assets/img/vs-about.png" alt="Why Choose Vivify Soft" onerror="this.style.display='none'">
                <div style="background: linear-gradient(135deg, #f0f4ff, #e8f0fe); border-radius: 20px; padding: 60px; text-align: center; display: none;" id="why-fallback">
                    <i class="fas fa-building" style="font-size: 80px; color: var(--primary); opacity: 0.2;"></i>
                </div>
            </div>
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
                <a href="https://vivifysoft.in/safety/#/AdminLogin" target="_blank" class="login-opt-btn">
                    Safety Tool
                </a>
                <a href="https://vivifysoft.in/Login.aspx" target="_blank" class="login-opt-btn">
                    Reimbursement
                </a>
                <a href="https://vivifysoft.in/employeehub/" target="_blank" class="login-opt-btn">
                    Employee Hub
                </a>
            </div>
        </div>
    </div>

    <script>
        // Navbar scroll effect
        document.addEventListener("DOMContentLoaded", function () {
            const navbar = document.getElementById("navbar");
            window.addEventListener("scroll", function () {
                if (window.scrollY > 50) {
                    navbar.classList.add("nav-scrolled");
                } else {
                    navbar.classList.remove("nav-scrolled");
                }
            });

            // Scroll reveal
            const reveals = document.querySelectorAll(".reveal-up");
            const obs = new IntersectionObserver((entries) => {
                entries.forEach(e => {
                    if (e.isIntersecting) { e.target.classList.add("active"); }
                });
            }, { threshold: 0.1 });
            reveals.forEach(el => obs.observe(el));

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
            const trigger = document.querySelector('.dropdown-trigger');
            const dropdown = document.querySelector('.dropdown');
            if (trigger && dropdown) {
                trigger.addEventListener('click', function (e) {
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
        window.onclick = function (event) {
            const modal = document.getElementById('loginModal');
            if (event.target == modal) { closeLoginModal(); }
        }
    </script>
</form>
</body>
</html>


