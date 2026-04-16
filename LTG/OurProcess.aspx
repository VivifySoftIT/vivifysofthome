<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Strategic Process | Vivify Soft</title>
    <meta name="description" content="Explore Vivify Soft's proven 5-phase SDLC process. From discovery to deployment and lifetime support — every step engineered for excellence.">
    <link href="assets/img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        :root {
            --primary-dark: #232b66;
            --primary: #232b66;
            --primary-light: #2d3882;
            --bg-body: #f7f9fc;
            --bg-white: #ffffff;
            --text-dark: #1f1b3d;
            --text-body: #6f6b8f;
            --accent: #ee2326;
            --secondary: #ee2326;
            --accent-glow: rgba(238, 35, 38, 0.4);
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html { scroll-behavior: smooth; }
        body { font-family: 'Poppins', sans-serif; background: var(--bg-body); color: var(--text-body); overflow-x: hidden; line-height: 1.7; }
        h1,h2,h3,h4,h5,h6 { font-weight: 700; color: var(--text-dark); line-height: 1.25; }
        a { text-decoration: none; color: inherit; }
        img { max-width: 100%; }

        /* ANIMATIONS */
        .reveal { opacity: 0; transform: translateY(40px); transition: opacity 0.8s cubic-bezier(.5,0,0,1), transform 0.8s cubic-bezier(.5,0,0,1); }
        .reveal.active { opacity: 1; transform: translateY(0); }
        
        @keyframes pulse-ring {
            0% { transform: scale(.33); }
            80%, 100% { opacity: 0; }
        }
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }        /* ----- PREMIUM CYBER NAVBAR ----- */
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
            color: var(--primary);
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
            background: var(--primary); transition: width 0.3s ease;
        }
        .navbar.nav-scrolled .nav-links li::after {
            background: #fff;
            box-shadow: 0 0 10px #fff;
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
            background: #232b66 !important;
            border-color: #232b66 !important;
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
            .nav-links li a { font-size: 14px; display: block; padding: 12px 0 !important; color: rgba(255,255,255,0.7) !important; text-align: left; width: 100%; border-bottom: 1px solid rgba(255,255,255,0.05); }
            .nav-links li.active a { color: #fff !important; font-weight: 700; background: rgba(112, 77, 243, 0.1); }
            .mobile-only { display: block !important; }
        }

        /* ====== HERO ====== */
        .page-hero {
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
            padding: 130px 5% 90px; text-align: center; color: #fff;
            position: relative; overflow: hidden;
        }
        .hero-blob { position: absolute; border-radius: 50%; background: rgba(255,255,255,0.06); animation: blob 8s ease-in-out infinite alternate; }
        .hero-blob-1 { width: 300px; height: 300px; top: -50px; left: -50px; }
        .hero-blob-2 { width: 500px; height: 500px; bottom: -100px; right: -100px; animation-delay: 3s; }
        @keyframes blob { 0% { transform: rotate(0deg) scale(1); } 100% { transform: rotate(180deg) scale(1.1); } }
        
        .badge { display: inline-block; background: rgba(255,255,255,0.15); border: 1px solid rgba(255,255,255,0.3); color: rgba(255,255,255,0.9); padding: 8px 25px; border-radius: 30px; font-size: 12px; font-weight: 600; letter-spacing: 2px; text-transform: uppercase; margin-bottom: 25px; }
        .page-hero h1 { font-size: clamp(32px, 5vw, 52px); color: #fff; margin-bottom: 22px; font-weight: 800; line-height: 1.1; }
        .page-hero p { font-size: 16px; color: rgba(255,255,255,0.85); max-width: 750px; margin: 0 auto; }
        
        .wave-divider { position: absolute; bottom: -2px; left: 0; width: 100%; z-index: 5; line-height: 0; }
        .wave-divider svg { display: block; width: calc(100% + 1.3px); height: 80px; fill: var(--bg-body); }

        /* ====== STATS ====== */
        .stats-strip { background: var(--bg-white); padding: 40px 5%; margin-top: -40px; border-radius: 20px 20px 0 0; position: relative; z-index: 10; box-shadow: 0 -10px 40px rgba(0,0,0,0.03); max-width: 1200px; margin-left: auto; margin-right: auto; }
        .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; }
        .stat-item { text-align: center; }
        .stat-number { font-size: 38px; font-weight: 800; color: var(--accent); display: block; }
        .stat-text { font-size: 14px; color: var(--text-body); font-weight: 500; }
        @media (max-width: 768px) { .stats-grid { grid-template-columns: repeat(2, 1fr); } }

        /* ====== SDLC CONTENT ====== */
        .content-section { padding: 50px 5%; }
        .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 40px; align-items: center; max-width: 1200px; margin: 0 auto; }
        @media (max-width: 991px) { .grid-2 { grid-template-columns: 1fr; gap: 50px; } }
        
        .img-box { position: relative; border-radius: 30px; overflow: hidden; box-shadow: 0 30px 60px rgba(0,0,0,0.1); border: 8px solid #fff; }
        .img-box img { width: 100%; display: block; transition: transform 0.6s; }
        .img-box:hover img { transform: scale(1.05); }

        .tagline { color: var(--primary-light); font-weight: 700; text-transform: uppercase; letter-spacing: 3px; font-size: 13px; margin-bottom: 15px; display: block; }
        .content-section h2 { font-size: 40px; margin-bottom: 25px; }
        .content-section p { font-size: 16px; margin-bottom: 20px; color: var(--text-body); }
        .feature-list { list-style: none; }
        .feature-list li { margin-bottom: 15px; display: flex; align-items: center; gap: 15px; font-weight: 500; color: var(--text-dark); }
        .feature-list i { color: var(--accent); background: rgba(238,35,38,0.1); width: 35px; height: 35px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 14px; }

        /* ====== PROFESSIONAL ENTERPRISE TIMELINE ====== */
        .timeline-container { 
            padding: 60px 5%; 
            background: #ffffff; 
            position: relative; 
            overflow: hidden; 
        }
        
        /* The Central Spine */
        .timeline-line { 
            position: absolute; 
            left: 50%; 
            top: 0; 
            bottom: 0; 
            width: 2px; 
            background: #eef1f6;
            transform: translateX(-50%); 
        }
        
        .timeline-line::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(180deg, var(--accent) 0%, var(--secondary) 100%);
            transform: scaleY(0);
            transform-origin: top;
            transition: transform 1.5s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .timeline-container.active .timeline-line::after { transform: scaleY(1); }

        .tl-item { 
            position: relative; 
            margin-bottom: 50px; 
            display: flex; 
            width: 100%;
            align-items: center;
        }
        .tl-item:last-child { margin-bottom: 0; }

        /* The Center Point */
        .tl-node {
            position: absolute; 
            left: 50%; 
            top: 50%; 
            transform: translate(-50%, -50%);
            width: 20px; 
            height: 20px; 
            background: #fff;
            border-radius: 50%; 
            z-index: 20;
            border: 4px solid var(--accent);
            box-shadow: 0 0 0 8px rgba(255,255,255,1);
            transition: all 0.4s ease;
        }
        
        .tl-item:hover .tl-node {
            transform: translate(-50%, -50%) scale(1.5);
            background: var(--primary);
            box-shadow: 0 0 20px rgba(69, 36, 197, 0.4);
        }

        .tl-content-wrapper {
            width: 50%;
            padding: 0 60px;
            display: flex;
        }
        
        .tl-item:nth-child(odd) .tl-content-wrapper { justify-content: flex-end; }
        .tl-item:nth-child(even) .tl-content-wrapper { margin-left: 50%; justify-content: flex-start; }

        .tl-card {
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            border: 1px solid #f0f2f5;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
            position: relative;
            transition: all 0.5s cubic-bezier(0.2, 1, 0.3, 1);
            max-width: 520px;
            opacity: 0;
            transform: translateY(30px);
        }

        .tl-item.active .tl-card {
            opacity: 1;
            transform: translateY(0);
        }

        .tl-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(69, 36, 197, 0.08);
            border-color: rgba(69, 36, 197, 0.1);
        }

        /* Marker for Phase */
        .tl-phase-tag {
            font-size: 11px;
            font-weight: 800;
            color: var(--accent);
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 15px;
            display: block;
            opacity: 0.7;
        }

        .tl-icon-box {
            width: 50px;
            height: 50px;
            background: rgba(238, 35, 38, 0.05);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
            transition: 0.3s;
        }
        .tl-icon-box i { color: var(--primary); font-size: 20px; }
        .tl-card:hover .tl-icon-box { background: var(--primary); }
        .tl-card:hover .tl-icon-box i { color: #fff; }

        .tl-card h3 { 
            font-size: 24px; 
            margin-bottom: 15px; 
            color: #1a1a1a;
            font-weight: 700;
        }
        .tl-card p { 
            font-size: 15px; 
            color: #555; 
            line-height: 1.8;
            margin: 0;
        }

        /* Connector Lines */
        .tl-connector {
            position: absolute;
            top: 50%;
            height: 2px;
            background: #eef1f6;
            width: 40px;
            z-index: 10;
        }
        .tl-item:nth-child(odd) .tl-connector { right: 0; transform: translateX(100%); }
        .tl-item:nth-child(even) .tl-connector { left: 0; transform: translateX(-100%); }

        @media (max-width: 991px) {
            .timeline-line { left: 30px; transform: none; }
            .tl-node { left: 30px; }
            .tl-content-wrapper { width: 100%; padding: 0 0 0 70px; margin-left: 0 !important; justify-content: flex-start !important; }
            .tl-connector { display: none; }
            .tl-card { max-width: 100%; transform: translateX(20px); }
            .tl-item.active .tl-card { transform: translateX(0); }
        }

        /* ====== WHY SECTION ====== */
        .why-section { padding: 70px 5%; background: var(--bg-body); }
        .why-cards { display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; max-width: 1200px; margin: 0 auto; }
        .why-card { background: #fff; padding: 40px; border-radius: 25px; transition: 0.4s; border: 1px solid rgba(0,0,0,0.02); }
        .why-card:hover { transform: translateY(-10px); box-shadow: 0 30px 60px rgba(69,36,197,0.1); }
        .why-card i { font-size: 40px; color: var(--accent); margin-bottom: 20px; display: block; }
        .why-card h4 { font-size: 20px; margin-bottom: 15px; }
        .why-card p { font-size: 14px; }
        @media (max-width: 991px) { .why-cards { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 600px) { .why-cards { grid-template-columns: 1fr; } }

        /* ====== CTA ====== */
        .cta { padding: 70px 5%; text-align: center; background: linear-gradient(135deg, var(--accent), #d11e21); color: #fff; border-radius: 50px; margin: 40px 5%; overflow: hidden; position: relative; }
        .cta h2 { color: #fff; font-size: 45px; margin-bottom: 20px; }
        .cta p { font-size: 18px; margin-bottom: 40px; opacity: 0.9; }
        .btn-white { background: #fff; color: var(--primary); padding: 15px 45px; border-radius: 50px; font-weight: 700; display: inline-block; transition: 0.3s; }
        .btn-white:hover { transform: scale(1.05); box-shadow: 0 10px 30px rgba(0,0,0,0.2); }

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
        .login-modal h2 { color: #000; font-size: 28px; font-weight: 900; margin-bottom: 35px; }
        .close-modal { position: absolute; top: 25px; right: 25px; font-size: 22px; color: #666; cursor: pointer; }
        .login-options { display: flex; flex-direction: column; gap: 15px; }
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
        .login-opt-btn:hover { background: #1a204d; transform: translateY(-3px); box-shadow: 0 10px 20px rgba(35, 43, 102, 0.3); }
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
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropdown-trigger">Services <i class="fas fa-chevron-down" style="font-size: 10px; margin-left: 5px; opacity: 0.5;"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="WebDevelopment.aspx"><i class="fas fa-desktop"></i> Web Development</a></li>
                    <li><a href="MobileDevelopment.aspx"><i class="fas fa-mobile-alt"></i> Mobile Development</a></li>
                    <li><a href="CustomDevelopment.aspx"><i class="fas fa-cogs"></i> Custom Development</a></li>
                </ul>
            </li>
            <li class="active"><a href="OurProcess.aspx">Process</a></li>
            <li><a href="CaseStudy.aspx">Case Study</a></li>
            <li><a href="Contact.aspx">Contact</a></li>
            <li class="mobile-only" style="margin-top: 25px; width: 100%;">

            </li>
        </ul>
        <div class="nav-btn">

        </div>
    </nav>

    <!-- Hero -->
    <section class="page-hero" id="process-hero">
        <div class="hero-blob hero-blob-1"></div>
        <div class="hero-blob hero-blob-2"></div>
        <div class="reveal">
            <span class="badge">Our Methodology</span>
            <h1><span style="color: var(--accent);">Precision Planning</span>,<br>Perfect Execution</h1>
            <p>We combine agile flexibility with industrial-grade precision to deliver software that doesn't just work it excels.</p>
        </div>
        <div class="wave-divider">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V120H0V95.8C59.71,118.08,130.83,119.2,192.36,108.41Z"/>
            </svg>
        </div>
    </section>

    <!-- Stats Strip -->
    <div class="stats-strip reveal">
        <div class="stats-grid">
            <div class="stat-item"><span class="stat-number">100+</span><span class="stat-text">Projects Finished</span></div>
            <div class="stat-item"><span class="stat-number">98%</span><span class="stat-text">Success Rate</span></div>
            <div class="stat-item"><span class="stat-number">5</span><span class="stat-text">Lifecycle Phases</span></div>
            <div class="stat-item"><span class="stat-number">24/7</span><span class="stat-text">System Support</span></div>
        </div>
    </div>

    <!-- Section 1: Intro with Gears Image -->
    <section class="content-section">
        <div class="grid-2">
            <div class="reveal">
                <span class="tagline">What makes us different</span>
                <h2>SDLC Engineering with a Human Touch</h2>
                <p>Our Software Development Life Cycle (SDLC) is a disciplined framework designed to produce high-quality software that meets or exceeds customer expectations, reaches completion within times and cost estimates.</p>
                <ul class="feature-list">
                    <li><i class="fas fa-check"></i> Weekly progress demos and feedback loops</li>
                    <li><i class="fas fa-check"></i> Security-first architecture in every build</li>
                    <li><i class="fas fa-check"></i> Dedicated project manager for your success</li>
                </ul>
            </div>
            <div class="img-box reveal" style="transition-delay: 0.2s;">
                <img src="assets/img/sdlc sec 2_files/d-render-illustration-software-development-life-cycle-process-sdlc-color-icons-gears-d-render-illustration-software-246364702.jpg" alt="SDLC Gears Animation">
            </div>
        </div>
    </section>

    <!-- Animated Oval Timeline -->
    <section class="timeline-container">
        <div class="timeline-line"></div>
        <div style="text-align: center; margin-bottom: 100px;" class="reveal">
            <span class="tagline">How it works</span>
            <h2>Our 5-Phase Process</h2>
        </div>

        <!-- Phase 1 -->
        <div class="tl-item">
            <div class="tl-node"></div>
            <div class="tl-content-wrapper">
                <div class="tl-card">
                    <div class="tl-connector"></div>
                    <span class="tl-phase-tag">Phase 01</span>
                    <div class="tl-icon-box"><i class="fas fa-chess-knight"></i></div>
                    <h3>Planning</h3>
                    <p>We define the project scope, identify technical requirements, and architect a strategic roadmap to ensure your vision is built on a solid foundation.</p>
                </div>
            </div>
        </div>

        <!-- Phase 2 -->
        <div class="tl-item">
            <div class="tl-node"></div>
            <div class="tl-content-wrapper">
                <div class="tl-card">
                    <div class="tl-connector"></div>
                    <span class="tl-phase-tag">Phase 02</span>
                    <div class="tl-icon-box"><i class="fas fa-pencil-ruler"></i></div>
                    <h3>Designing</h3>
                    <p>Our design team creates intuitive UI/UX layouts and interactive wireframes to visualize the user experience before development starts.</p>
                </div>
            </div>
        </div>

        <!-- Phase 3 -->
        <div class="tl-item">
            <div class="tl-node"></div>
            <div class="tl-content-wrapper">
                <div class="tl-card">
                    <div class="tl-connector"></div>
                    <span class="tl-phase-tag">Phase 03</span>
                    <div class="tl-icon-box"><i class="fas fa-code"></i></div>
                    <h3>Developing</h3>
                    <p>High-quality, scalable code is written using the latest technologies, following agile methodologies for transparency and rapid progress.</p>
                </div>
            </div>
        </div>

        <!-- Phase 4 -->
        <div class="tl-item">
            <div class="tl-node"></div>
            <div class="tl-content-wrapper">
                <div class="tl-card">
                    <div class="tl-connector"></div>
                    <span class="tl-phase-tag">Phase 04</span>
                    <div class="tl-icon-box"><i class="fas fa-vial"></i></div>
                    <h3>Testing</h3>
                    <p>Rigorous quality assurance and security testing are performed to ensure your software is bug-free, performant, and ready for deployment.</p>
                </div>
            </div>
        </div>

        <!-- Phase 5 -->
        <div class="tl-item">
            <div class="tl-node"></div>
            <div class="tl-content-wrapper">
                <div class="tl-card">
                    <div class="tl-connector"></div>
                    <span class="tl-phase-tag">Phase 05</span>
                    <div class="tl-icon-box"><i class="fas fa-rocket"></i></div>
                    <h3>Launch & Maintenance</h3>
                    <p>We handle the final deployment and provide ongoing support and maintenance to ensure your system remains up-to-date and optimized.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Section 2: Visual with Cycle Image (FIXED PATH) -->
    <section class="content-section" style="background: var(--bg-body);">
        <div class="grid-2">
            <div class="img-box reveal">
                <!-- REDIRECTED TO CORRECT DIRECTORY -->
                <img src="assets/img/sdlc sec 2_files/software-development-cycle-768x398.png" alt="Software Development Lifecycle Cycle">
            </div>
            <div class="reveal" style="transition-delay: 0.2s;">
                <span class="tagline">The Vivify Advantage</span>
                <h2>Why Every Phase Matters</h2>
                <p>Each phase of our SDLC is not a formality — it is a carefully engineered checkpoint that de-risks your investment and accelerates your time-to-market.</p>
                <div style="margin-top: 30px;">
                    <div style="display:flex; gap:20px; margin-bottom:20px;">
                        <i class="fas fa-eye" style="font-size:24px; color:var(--primary);"></i>
                        <div>
                            <h5 style="font-size:16px; margin-bottom:5px;">Full Transparency</h5>
                            <p style="font-size:13px; margin:0;">Weekly demos and live dashboards keep you in total control.</p>
                        </div>
                    </div>
                    <div style="display:flex; gap:20px; margin-bottom:20px;">
                        <i class="fas fa-bolt" style="font-size:24px; color:var(--primary);"></i>
                        <div>
                            <h5 style="font-size:16px; margin-bottom:5px;">Rapid Delivery</h5>
                            <p style="font-size:13px; margin:0;">Agile sprints cut your time-to-market without cutting corners.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Section -->
    <section class="why-section">
        <div style="text-align: center; margin-bottom: 70px;" class="reveal">
            <span class="tagline">Built for scale</span>
            <h2>Why Clients Choose Our Process</h2>
        </div>
        <div class="why-cards">
            <div class="why-card reveal">
                <i class="fas fa-puzzle-piece"></i>
                <h4>Custom Tailored</h4>
                <p>Everything we build is architected specifically for your business logic, never repurposed templates.</p>
            </div>
            <div class="why-card reveal" style="transition-delay: 0.1s;">
                <i class="fas fa-lock"></i>
                <h4>Security First</h4>
                <p>Enterprise-grade security is baked into the code from day one, not bolted on as an afterthought.</p>
            </div>
            <div class="why-card reveal" style="transition-delay: 0.2s;">
                <i class="fas fa-infinity"></i>
                <h4>Future Ready</h4>
                <p>We use scalable cloud architectures that grow with you, handling thousands of users with ease.</p>
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

</form>

<script>
    const navbar = document.getElementById('navbar');
    const hero = document.getElementById('process-hero');
    
    window.addEventListener('scroll', () => {
        const heroHeight = hero.offsetHeight;
        if (window.scrollY > (heroHeight - 100)) {
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

    // Intersection Observer for animations
    const observerOptions = { threshold: 0.1, rootMargin: '0px 0px -50px 0px' };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
            }
        });
    }, observerOptions);

    document.querySelectorAll('.reveal, .tl-item, .timeline-container').forEach(el => observer.observe(el));
    
    // Ensure top elements are visible if already in viewport
    setTimeout(() => {
        document.querySelectorAll('.reveal').forEach(el => {
            const rect = el.getBoundingClientRect();
            if (rect.top < window.innerHeight) {
                el.classList.add('active');
            }
        });
    }, 100);

    // Login Modal Functions
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
        if (event.target == modal) closeLoginModal();
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
                    const icon = trigger.querySelector('i');
                    if (icon) {
                        icon.classList.toggle('fa-chevron-up');
                        icon.classList.toggle('fa-chevron-down');
                    }
                }
            });
        }
    });
</script>
</body>
</html>


