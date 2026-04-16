<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mobile Development | Vivify Soft</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&family=Gochi+Hand&display=swap" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --primary-dark: #232b66;
            --primary: #232b66;
            --primary-light: #2d3882;
            --secondary: #ee2326;
            --accent: #ee2326;
            --text-dark: #121420;
            --text-body: #6b6f82;
            --bg-body: #f8faff;
            --android-color: #3DDC84;
            --ios-color: #000000;
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

        .mobile-toggle { color: #1f1b3d !important; display: none; cursor: pointer; font-size: 24px; }
        .navbar.nav-scrolled .mobile-toggle { color: #fff !important; }

        /* ----- NAVBAR BUTTONS ----- */
        .nav-btn { display: flex; align-items: center; gap: 14px; }

        .nav-btn .btn-theme {
            padding: 10px 25px;
            font-size: 13px;
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
            clip-path: polygon(0 0, 90% 0, 100% 100%, 10% 100%);
            padding: 12px 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .navbar.nav-scrolled .nav-btn .btn-theme:last-child {
            background: #ffffff !important;
            color: #232b66 !important;
            box-shadow: 0 8px 30px rgba(255, 255, 255, 0.3);
        }

        .nav-btn .btn-theme:hover {
            transform: translateY(-3px);
            color: #fff !important;
            background: var(--accent) !important;
            border-color: var(--accent) !important;
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
        .mobile-hero { padding: 130px 5% 90px; background: linear-gradient(135deg, #201768, #18114a); color: #fff; text-align: center; position: relative; overflow: hidden; }
        .mobile-hero::before { content: ''; position: absolute; width: 600px; height: 600px; background: rgba(112, 77, 243, 0.2); border-radius: 50%; filter: blur(80px); top: -200px; left: -200px; }
        .mobile-hero::after { content: ''; position: absolute; width: 400px; height: 400px; background: rgba(255, 74, 114, 0.15); border-radius: 50%; filter: blur(80px); bottom: -100px; right: -100px; }
        .mobile-hero-content { position: relative; z-index: 2; max-width: 800px; margin: 0 auto; animation: fadeInUp 1s ease forwards; }
        .mobile-hero h1 { font-size: 52px; font-weight: 800; line-height: 1.1; margin-bottom: 25px; text-transform: uppercase; text-shadow: 0 5px 15px rgba(0,0,0,0.2); }
        .mobile-hero p { font-size: 16px; color: rgba(255,255,255,0.7); line-height: 1.8; margin-bottom: 40px; }

        /* ----- PLATFORM SECTION ----- */
        .platform-section { padding: 50px 5%; background: #ffffff; text-align: center; }
        .platform-header { max-width: 700px; margin: 0 auto 40px; }
        .platform-header h2 { font-size: 38px; color: var(--text-dark); margin-bottom: 20px; font-weight: 700; }
        
        .p-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 40px; max-width: 1000px; margin: 0 auto; }
        
        .p-card { background: #f8fafc; padding: 50px 30px; border-radius: 20px; border: 1px solid #e2e8f0; transition: all 0.4s ease; text-align: center; position: relative; overflow: hidden; }
        .p-card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0,0,0,0.05); border-color: var(--primary-light); }
        
        .p-card h3 { font-size: 26px; color: var(--text-dark); margin-bottom: 25px; font-weight: 700; }
        
        /* Sketchy Logo Style */
        .sketch-logo { width: 120px; height: 120px; margin: 0 auto 30px; display: flex; align-items: center; justify-content: center; position: relative; }
        .sketch-logo i { font-size: 80px; position: relative; z-index: 2; filter: drop-shadow(2px 4px 0px rgba(0,0,0,0.1)); }
        
        .android-sketch { color: var(--android-color); }
        .ios-sketch { color: var(--ios-color); }
        
        /* Hand-drawn circle effect */
        .sketch-bg { position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 3px solid rgba(0,0,0,0.05); border-radius: 45% 55% 52% 48% / 51% 43% 57% 49%; animation: wiggle 4s infinite alternate ease-in-out; }
        .p-card:hover .sketch-bg { border-color: var(--primary-light); opacity: 0.2; }

        @keyframes wiggle {
            0% { border-radius: 45% 55% 52% 48% / 51% 43% 57% 49%; transform: rotate(0deg); }
            100% { border-radius: 54% 46% 41% 59% / 44% 56% 44% 56%; transform: rotate(3deg); }
        }

        /* ----- DETAILS SECTION ----- */
        .mobile-details { padding: 60px 5% 80px; background: var(--bg-body); display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 60px; }
        .md-img-col { flex: 1.2; min-width: 320px; position: relative; }
        .md-img-wrapper { position: relative; z-index: 2; border-radius: 20px; overflow: hidden; box-shadow: 0 30px 60px rgba(0,0,0,0.15); animation: floatSync 6s infinite alternate ease-in-out; }
        .md-img-wrapper img { width: 100%; display: block; }
        .md-backdrop { position: absolute; top: -30px; left: -30px; width: 100%; height: 100%; border: 4px solid var(--accent); border-radius: 20px; z-index: 1; opacity: 0.3; }
        
        .md-text-col { flex: 1; min-width: 320px; }
        .md-text-col h2 { font-size: 40px; color: var(--text-dark); margin-bottom: 25px; line-height: 1.3; font-weight: 700; }
        .md-text-col p { font-size: 16px; color: var(--text-body); line-height: 1.8; margin-bottom: 20px; }
        
        .md-list { list-style: none; margin-bottom: 35px; }
        .md-list li { display: flex; align-items: center; gap: 15px; font-size: 16px; font-weight: 600; color: var(--text-dark); margin-bottom: 12px; }
        .md-list li i { color: var(--accent); font-size: 20px; }

        /* ----- PHONE SHOWCASE (LIVE EXPERIENCE) ----- */
        .phone-showcase { padding: 50px 5%; background: #ffffff; text-align: center; position: relative; }
        .showcase-header { margin-bottom: 40px; }
        .showcase-header h2 { font-size: 36px; font-weight: 700; color: var(--text-dark); }

        .phones-container { display: flex; justify-content: center; align-items: center; gap: 50px; flex-wrap: wrap; max-width: 1200px; margin: 0 auto; perspective: 1500px; }

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
            background: var(--accent);
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(238, 35, 38, 0.3);
        }

        /* The Phone Frame */
        .phone-frame { width: 280px; height: 580px; background: #000; border-radius: 40px; border: 12px solid #1a1a1a; box-shadow: 0 40px 80px rgba(0,0,0,0.2); position: relative; overflow: hidden; transition: all 0.5s ease; }
        .phone-frame.android { transform: rotateY(-10deg) rotateX(5deg); }
        .phone-frame.ios { transform: rotateY(10deg) rotateX(5deg); }
        
        .phone-frame:hover { transform: translateY(-20px) rotateY(0deg) rotateX(0deg); box-shadow: 0 60px 100px rgba(112, 77, 243, 0.2); }

        /* Mock Notch */
        .notch { position: absolute; top: 0; left: 50%; transform: translateX(-50%); width: 120px; height: 30px; background: #1a1a1a; border-radius: 0 0 15px 15px; z-index: 50; }
        .android .notch { width: 10px; height: 10px; border-radius: 50%; top: 15px; }

        /* Screen Content */
        .screen-content { width: 100%; height: 100%; background: #fff; overflow: hidden; position: relative; }
        .sliding-app { position: absolute; top: 0; left: 0; width: 100%; animation: slideApp 15s infinite alternate ease-in-out; }

        @keyframes slideApp {
            0% { transform: translateY(0); }
            100% { transform: translateY(-60%); }
        }

        /* Simulated App Content */
        .app-nav { height: 60px; background: #fff; border-bottom: 1px solid #eee; display: flex; align-items: center; justify-content: space-between; padding: 20px 20px 0; }
        .app-nav i { font-size: 18px; color: var(--primary); }
        .app-user { width: 30px; height: 30px; border-radius: 50%; background: #eee; }

        .app-hero { padding: 30px 20px; background: var(--primary); color: #fff; border-radius: 0 0 30px 30px; }
        .app-hero h4 { font-size: 20px; margin-bottom: 10px; }
        .app-search { background: rgba(255,255,255,0.2); height: 40px; border-radius: 10px; }

        .app-section { padding: 25px 20px; text-align: left; }
        .app-section h5 { font-size: 16px; margin-bottom: 15px; color: var(--text-dark); }
        .app-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .app-item { height: 100px; background: #f8fafc; border-radius: 15px; border: 1px solid #eee; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; }
        .app-item-icon { width: 30px; height: 30px; border-radius: 8px; background: #fff; display: flex; align-items: center; justify-content: center; box-shadow: 0 5px 10px rgba(0,0,0,0.05); }

        .app-wide-card { width: 100%; height: 150px; background: #f8fafc; border-radius: 20px; margin-bottom: 20px; padding: 20px; text-align: left; }
        .app-line { height: 8px; background: #e2e8f0; border-radius: 4px; margin-bottom: 8px; }

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

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ----- FINAL CTA ----- */

        /* ----- FINAL CTA ----- */
        .final-cta { padding: 60px 5%; background: #ffffff; text-align: center; }
        .cta-box { 
            max-width: 950px; 
            margin: 0 auto; 
            background: linear-gradient(135deg, var(--secondary) 0%, var(--primary) 100%); 
            padding: 50px 40px; 
            border-radius: 24px; 
            position: relative; 
            overflow: hidden; 
            box-shadow: 0 20px 40px rgba(255, 74, 114, 0.2);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }
        .cta-box::before { content: ''; position: absolute; bottom: -20%; right: -10%; width: 400px; height: 400px; background: rgba(255,255,255,0.1); border-radius: 50%; filter: blur(40px); }
        .cta-box h2 { font-size: 32px; font-weight: 700; margin-bottom: 0; position: relative; z-index: 2; }
        .cta-box p { font-size: 16px; color: rgba(255,255,255,0.9); margin-bottom: 5px; max-width: 600px; position: relative; z-index: 2; line-height: 1.6; }
        .cta-box .btn-theme { position: relative; z-index: 2; box-shadow: 0 10px 20px rgba(0,0,0,0.1); margin-top: 10px; }

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

            .mobile-hero { padding: 140px 5% 80px !important; text-align: center !important; }
            .mobile-hero h1 { font-size: 28px !important; line-height: 1.2 !important; }
            .mobile-hero p { font-size: 15px !important; }

            .platform-header h2 { font-size: 30px !important; }
            .p-grid { grid-template-columns: 1fr; }
            
            .mobile-details { flex-direction: column; text-align: center; }
            .md-text-col h2 { font-size: 28px !important; }
            .md-list li { justify-content: center; }
            .md-img-wrapper { animation: none !important; }
            .md-backdrop { display: none; }

            .phones-container { gap: 30px; }
            .phone-frame { width: 240px; height: 500px; }
            .phone-frame.android, .phone-frame.ios { transform: none !important; }

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
        <section class="mobile-hero">
            <div class="mobile-hero-content">
                <h1 style="color:#ee2326; font-size:13px; letter-spacing:3px; margin-bottom:15px; font-weight:800;">NEXT-GEN MOBILITY</h1>
                <h1>Premium <span style="color: var(--accent);">App Development</span></h1>
                <p>We transform your visionary ideas into powerful, high-performance mobile applications that dominate the app stores and provide seamless user experiences.</p>
                <a href="#platforms" class="btn-theme" style="background:#ee2326; color:#fff; padding:15px 35px; border-radius:12px;">Explore Platforms</a>
            </div>
        </section>

        <!-- Platforms Section -->
        <section id="platforms" class="platform-section">
            <div class="platform-header">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Native & Hybrid Solutions</h4>
                <h2>Platforms We Master</h2>
            </div>
            
            <div class="p-grid">
                <!-- Android -->
                <div class="p-card">
                    <div class="sketch-bg"></div>
                    <div class="sketch-logo">
                        <i class="fab fa-android android-sketch"></i>
                    </div>
                    <h3>Android Applications</h3>
                    <p>Building high-performance native Android apps using Kotlin and Java, optimized for a vast ecosystem of devices with material design excellence.</p>
                </div>

                <!-- iOS -->
                <div class="p-card">
                    <div class="sketch-bg"></div>
                    <div class="sketch-logo">
                        <i class="fab fa-apple ios-sketch"></i>
                    </div>
                    <h3>IOS Applications</h3>
                    <p>Premium iOS development using Swift and SwiftUI. We focus on Apple's high standards for performance, security, and fluid UI animations.</p>
                </div>
            </div>
        </section>

        <!-- Image & Details Section -->
        <section class="mobile-details">
            <div class="md-img-col">
                <div class="md-backdrop"></div>
                <div class="md-img-wrapper">
                    <!-- Using the high-quality image from the Bing search result as identified -->
                    <img src="assets/img/mobile dev_files/e4df4490aa3285e452fd6b77d78bcb0c.png" alt="Mobile App Development">
                </div>
            </div>
            
            <div class="md-text-col">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Full-Stack Mobility</h4>
                <h2>Empowering Your Business On The Go</h2>
                <div style="width: 60px; height: 3px; background:var(--accent); margin-bottom: 25px;"></div>
                
                <p>Our mobile development team specializes in creating immersive applications that bridge the gap between complex backend logic and intuitive touch interfaces.</p>
                
                <p>Whether it's a native experience or a cross-platform solution using Flutter or React Native, we ensure your app is fast, secure, and ready to scale.</p>
                
                <ul class="md-list">
                    <li><i class="fas fa-check-circle"></i> Biometric Security Integration</li>
                    <li><i class="fas fa-check-circle"></i> Real-time Push Notifications</li>
                    <li><i class="fas fa-check-circle"></i> Offline Synchronization Capabilities</li>
                    <li><i class="fas fa-check-circle"></i> Advanced API & Cloud Integration</li>
                </ul>

                <a href="Home.aspx#contact" class="btn-theme" style="margin-top:15px; background:var(--primary-dark);">Consult An Architect</a>
            </div>
        </section>

        <!-- Phone Showcase (Live Experience) -->
        <section class="phone-showcase">
            <div class="showcase-header">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Live Experience</h4>
                <h2>Modern App Interfaces</h2>
            </div>

            <div class="phones-container">
                <!-- Android Phone -->
                <div class="phone-frame android">
                    <div class="notch"></div>
                    <div class="screen-content">
                        <div class="sliding-app">
                            <div class="app-nav">
                                <div style="display:flex; align-items:center; gap:8px;">
                                    <i class="fas fa-bars" style="font-size:14px;"></i>
                                    <span style="font-size:12px; font-weight:700; color:var(--primary-dark);">V-MOBILE</span>
                                </div>
                                <div class="app-user" style="display:flex; align-items:center; justify-content:center; color:#fff; font-size:10px; font-weight:700; background:var(--primary);">A</div>
                            </div>
                            <div class="app-hero">
                                <h4 style="font-size:18px; margin-bottom:5px;">Welcome Back!</h4>
                                <p style="font-size:10px; opacity:0.8; margin-bottom:15px;">Your mobile infrastructure is healthy and secure.</p>
                                <div class="app-search" style="display:flex; align-items:center; padding:0 15px; font-size:10px; color:rgba(255,255,255,0.6);">Search Analytics...</div>
                            </div>
                            <div class="app-section">
                                <h5 style="font-weight:700; font-size:14px;">Core Features</h5>
                                <div class="app-grid">
                                    <div class="app-item">
                                        <div class="app-item-icon"><i class="fas fa-fingerprint" style="color:#25d366;"></i></div>
                                        <span style="font-size:9px; font-weight:700; margin-top:8px;">Bio-Auth</span>
                                    </div>
                                    <div class="app-item">
                                        <div class="app-item-icon"><i class="fas fa-bolt" style="color:#ffb800;"></i></div>
                                        <span style="font-size:9px; font-weight:700; margin-top:8px;">Real-time</span>
                                    </div>
                                    <div class="app-item">
                                        <div class="app-item-icon"><i class="fas fa-cloud-upload-alt" style="color:#704df3;"></i></div>
                                        <span style="font-size:9px; font-weight:700; margin-top:8px;">Sync</span>
                                    </div>
                                    <div class="app-item">
                                        <div class="app-item-icon"><i class="fas fa-bell" style="color:#ff4a72;"></i></div>
                                        <span style="font-size:9px; font-weight:700; margin-top:8px;">Alerts</span>
                                    </div>
                                </div>
                            </div>
                            <div class="app-section" style="background:#fafafa;">
                                <h5 style="font-weight:700; font-size:14px;">System Health</h5>
                                <div class="app-wide-card" style="box-shadow: 0 5px 15px rgba(0,0,0,0.03); background:#fff;">
                                    <div style="display:flex; justify-content:space-between; margin-bottom:10px;">
                                        <span style="font-size:11px; font-weight:700;">Performance</span>
                                        <span style="font-size:11px; color:var(--accent); font-weight:800;">99.9%</span>
                                    </div>
                                    <div style="width:100%; height:6px; background:#eee; border-radius:3px; overflow:hidden;">
                                        <div style="width:99%; height:100%; background:var(--accent);"></div>
                                    </div>
                                    <p style="font-size:9px; color:var(--text-body); margin-top:10px;">Server response time optimized for global delivery.</p>
                                </div>
                                <div class="app-wide-card" style="background:var(--primary-dark); color:#fff; height:auto; padding:15px;">
                                    <div style="font-size:10px; font-weight:800; text-transform:uppercase; letter-spacing:1px; margin-bottom:5px;">Live User Count</div>
                                    <div style="font-size:24px; font-weight:900;">14,582 <i class="fas fa-caret-up" style="font-size:14px; color:var(--accent);"></i></div>
                                </div>
                            </div>
                            <div class="app-section" style="text-align:center; padding-bottom:50px;">
                                <div style="width:100%; height:1px; background:#eee; margin-bottom:20px;"></div>
                                <p style="font-size:10px; color:var(--text-body);">© 2026 Vivify Mobility System</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- iOS Phone -->
                <div class="phone-frame ios">
                    <div class="notch"></div>
                    <div class="screen-content" style="background:#f1f5f9;">
                        <div class="sliding-app" style="animation-duration: 20s;">
                            <div class="app-nav" style="background:rgba(255,255,255,0.8); backdrop-filter:blur(5px); border:0; position:sticky; top:0; z-index:100;">
                                <span style="font-weight:800; color:#000; font-size:16px;">App Analytics</span>
                                <i class="fas fa-ellipsis-h" style="color:#000;"></i>
                            </div>
                            <div class="app-section">
                                <div class="app-wide-card" style="background:#fff; height:auto; padding:20px; box-shadow:0 10px 25px rgba(0,0,0,0.04); border-radius:24px;">
                                    <div style="display:flex; align-items:center; gap:12px; margin-bottom:15px;">
                                        <div style="width:45px; height:45px; border-radius:14px; background:linear-gradient(135deg, #704df3, #ff4a72); display:flex; align-items:center; justify-content:center; color:#fff; font-size:20px;"><i class="fas fa-chart-line"></i></div>
                                        <div>
                                            <div style="font-size:14px; font-weight:800; color:#000;">Revenue Growth</div>
                                            <div style="font-size:10px; color:var(--text-body);">Updated 2 mins ago</div>
                                        </div>
                                    </div>
                                    <div style="font-size:28px; font-weight:900; color:var(--primary-dark); margin-bottom:5px;">$128,430</div>
                                    <div style="font-size:11px; font-weight:700; color:var(--accent);">+12.5% this month</div>
                                </div>
                                <div class="app-grid">
                                    <div class="app-item" style="background:#fff; height:130px; border-radius:24px; border:0; box-shadow:0 10px 20px rgba(0,0,0,0.03);">
                                        <i class="fas fa-heart" style="color:#ff4a72; font-size:20px;"></i>
                                        <h6 style="color:#000; font-size:12px; font-weight:800; margin-top:10px;">User Love</h6>
                                        <p style="font-size:9px; color:var(--text-body);">4.9/5 Rating</p>
                                    </div>
                                    <div class="app-item" style="background:#000; height:130px; border-radius:24px; border:0; color:#fff;">
                                        <i class="fas fa-star" style="color:#ffb800; font-size:20px;"></i>
                                        <h6 style="color:#fff; font-size:12px; font-weight:800; margin-top:10px;">Premium</h6>
                                        <p style="font-size:9px; color:rgba(255,255,255,0.6);">Exclusive Tier</p>
                                    </div>
                                </div>
                                <br>
                                <div class="app-wide-card" style="background:#fff; height:auto; padding:15px; border-radius:20px;">
                                    <h6 style="font-size:12px; font-weight:800; margin-bottom:15px; color:#000;">Active Sessions</h6>
                                    <div style="display:flex; align-items:center; gap:15px; margin-bottom:12px;">
                                        <div style="width:36px; height:36px; border-radius:50%; background:rgba(112, 77, 243, 0.1); display:flex; align-items:center; justify-content:center; color:var(--primary);"><i class="fas fa-mobile"></i></div>
                                        <div style="flex:1;">
                                            <div style="font-size:11px; font-weight:700; color:#000;">iPhone 15 Pro Max</div>
                                            <div style="font-size:9px; color:var(--text-body);">London, UK</div>
                                        </div>
                                    </div>
                                    <div style="display:flex; align-items:center; gap:15px;">
                                        <div style="width:36px; height:36px; border-radius:50%; background:rgba(37, 211, 102, 0.1); display:flex; align-items:center; justify-content:center; color:var(--accent);"><i class="fas fa-tablet-alt"></i></div>
                                        <div style="flex:1;">
                                            <div style="font-size:11px; font-weight:700; color:#000;">iPad Air M2</div>
                                            <div style="font-size:9px; color:var(--text-body);">New York, USA</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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


