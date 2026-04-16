<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Development | Vivify Soft</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --primary-dark: #232b66;
            --primary: #232b66;
            --primary-light: #2d3882;
            --secondary: #ee2326;
            --accent: #ee2326;
            --text-dark: #1f1b3d;
            --text-body: #6f6b8f;
            --bg-body: #f7f9fc;
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

        .nav-btn .btn-theme:last-child:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(255, 255, 255, 0.4);
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
            box-shadow: 0 15px 25px rgba(112, 77, 243, 0.4);
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
        .web-hero { padding: 180px 5% 120px; background: linear-gradient(135deg, #201768, #18114a); color: #fff; text-align: center; position: relative; overflow: hidden; }
        .web-hero::before { content: ''; position: absolute; width: 600px; height: 600px; background: rgba(112, 77, 243, 0.2); border-radius: 50%; filter: blur(80px); top: -200px; left: -200px; }
        .web-hero::after { content: ''; position: absolute; width: 400px; height: 400px; background: rgba(255, 74, 114, 0.15); border-radius: 50%; filter: blur(80px); bottom: -100px; right: -100px; }
        .web-hero-content { position: relative; z-index: 2; max-width: 800px; margin: 0 auto; animation: fadeInUp 1s ease forwards; }
        .web-hero h1 { font-size: 52px; font-weight: 800; line-height: 1.1; margin-bottom: 25px; text-transform: uppercase; text-shadow: 0 5px 15px rgba(0,0,0,0.2); }
        .web-hero p { font-size: 16px; color: rgba(255,255,255,0.7); line-height: 1.8; margin-bottom: 40px; }

        /* ----- MOCKUPS SECTION ----- */
        .mockups-section { padding: 80px 5%; background: #ffffff; text-align: center; }
        .mockups-header { max-width: 700px; margin: 0 auto 60px; }
        .mockups-header h2 { font-size: 38px; color: var(--text-dark); margin-bottom: 20px; font-weight: 700; }
        .mockups-header p { font-size: 16px; color: var(--text-body); line-height: 1.8; }
        
        .m-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 40px; max-width: 1200px; margin: 0 auto; perspective: 1000px; }
        
        .m-col { display: flex; flex-direction: column; align-items: center; }
        .m-col h3 { font-size: 24px; color: var(--primary-dark); margin-bottom: 30px; font-weight: 600; }

        /* Browser Mockup Box */
        .b-mockup { width: 100%; max-width: 380px; height: 260px; background: #f8fafc; border: 3px solid #e2e8f0; border-radius: 12px; display: flex; flex-direction: column; overflow: hidden; box-shadow: 0 15px 35px rgba(0,0,0,0.05); transition: transform 0.5s ease, box-shadow 0.5s ease, border-color 0.5s ease; position: relative; cursor: pointer; }
        .b-mockup:hover { transform: translateY(-15px) rotateY(5deg); box-shadow: 0 25px 50px rgba(112, 77, 243, 0.15); border-color: var(--primary-light); }
        .b-top { height: 24px; border-bottom: 2px solid #e2e8f0; display: flex; align-items: center; padding: 0 10px; gap: 5px; background: #ffffff; }
        .b-top span { width: 8px; height: 8px; border-radius: 50%; border: 1px solid #cbd5e1; }
        .b-body { flex: 1; padding: 15px; position: relative; }

        /* Wireframe Styles */
        .wf-box { border: 2px solid #cbd5e1; border-radius: 6px; }
        .wf-text { height: 6px; background: #e2e8f0; border-radius: 3px; margin-bottom: 6px; }

        /* Static Site Wireframe */
        .ss-header { height: 30px; width: 30px; margin-bottom: 15px; display:flex; align-items:center; justify-content:center; }
        .ss-header::before, .ss-header::after { content:''; position:absolute; width: 35px; height:2px; background: #cbd5e1; transform: rotate(45deg); }
        .ss-header::after { transform: rotate(-45deg); }
        .ss-banner { height: 40px; width: 100%; margin-bottom: 15px; border-radius: 20px; }
        .ss-banner-2 { height: 20px; width: 100%; border-radius: 10px; }
        
        /* Dynamic Site Wireframe */
        .dyn-layout { display: flex; gap: 10px; height: 100%; }
        .dyn-left { flex: 1; display:flex; flex-direction: column; gap: 10px; }
        .dyn-right { flex: 1.2; display:flex; flex-direction: column; gap: 10px; }
        .dyn-hero { height: 60px; border-color: #f5a623; border-width: 3px; border-radius: 12px; } /* Orange highlight */
        .dyn-box { height: 40px; }
        .dyn-mini-grid { display: flex; gap: 5px; height: 30px; }
        .dyn-mini-box { flex: 1; }

        /* E-Commerce Wireframe */
        .eco-nav { display: flex; gap: 5px; margin-bottom: 10px; }
        .eco-nav-item { flex: 1; height: 12px; }
        .eco-nav-item:last-child { background: var(--text-dark); border-color: var(--text-dark); }
        .eco-hero { height: 50px; margin-bottom: 10px; display:flex; align-items:center; justify-content:center; position:relative; overflow:hidden;}
        .eco-hero::before, .eco-hero::after { content:''; position:absolute; width: 100%; height:2px; background: #cbd5e1; transform: rotate(15deg); }
        .eco-hero::after { transform: rotate(-15deg); }
        .eco-products { display: flex; gap: 5px; }
        .eco-prod { flex: 1; height: 60px; display:flex; flex-direction:column; gap:4px; }
        .eco-prod-img { flex:1; display:flex; align-items:center; justify-content:center; position:relative; overflow:hidden;}
        .eco-prod-img::before, .eco-prod-img::after { content:''; position:absolute; width: 100%; height:2px; background: #cbd5e1; transform: rotate(45deg); }
        .eco-prod-img::after { transform: rotate(-45deg); }
        .eco-prod-btn { height: 6px; width: 60%; margin: 0 auto; }

        /* ----- DETAILS SECTION ----- */
        .dev-details { padding: 60px 5% 80px; background: var(--bg-body); display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 60px; }
        .dd-img-col { flex: 1.2; min-width: 320px; position: relative; }
        .dd-img-wrapper { position: relative; z-index: 2; border-radius: 20px; overflow: hidden; box-shadow: 0 30px 60px rgba(0,0,0,0.15); animation: floatSync 6s infinite alternate ease-in-out; }
        .dd-img-wrapper img { width: 100%; display: block; }
        .dd-backdrop { position: absolute; top: -30px; left: -30px; width: 100%; height: 100%; border: 4px solid var(--primary-light); border-radius: 20px; z-index: 1; opacity: 0.3; }
        
        .dd-text-col { flex: 1; min-width: 320px; }
        .dd-text-col h2 { font-size: 40px; color: var(--text-dark); margin-bottom: 25px; line-height: 1.3; font-weight: 700; }
        .dd-text-col p { font-size: 16px; color: var(--text-body); line-height: 1.8; margin-bottom: 20px; }
        .dd-list { list-style: none; margin-bottom: 35px; }
        .dd-list li { display: flex; align-items: center; gap: 15px; font-size: 16px; font-weight: 600; color: var(--text-dark); margin-bottom: 12px; }
        .dd-list li i { color: var(--secondary); font-size: 20px; }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes floatSync {
            0% { transform: translateY(-10px); }
            100% { transform: translateY(10px); }
        }

        /* ----- FOOTER ----- */



        /* ----- TABLET SHOWCASE ----- */
        .tablet-showcase { padding: 80px 5%; background-color: #f8faff; background-image: radial-gradient(#e2e8f0 1px, transparent 1px); background-size: 30px 30px; position: relative; overflow: hidden; display: flex; flex-direction: column; align-items: center; border-top: 1px solid rgba(0,0,0,0.05); }
        .showcase-header { text-align: center; margin-bottom: 60px; z-index: 5; }
        .showcase-header h2 { font-size: 36px; font-weight: 700; color: var(--text-dark); margin-bottom: 15px; }

        .tablet-container { position: relative; width: 100%; max-width: 900px; margin: 0 auto; perspective: 2000px; z-index: 10; padding-bottom: 50px; }
        
        /* The Tablet Frame */
        .tablet-frame { width: 70%; height: 480px; background: #000; border-radius: 30px; border: 10px solid #1a1a1a; margin: 0 auto; box-shadow: 0 40px 80px rgba(0,0,0,0.25); position: relative; overflow: hidden; transform: rotateX(8deg); transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1); z-index: 5; }
        .tablet-frame:hover { transform: rotateX(4deg) scale(1.03) translateY(-10px); box-shadow: 0 60px 100px rgba(0,0,0,0.3); }

        /* Screen Content with Sliding Animation */
        .screen-container { width: 100%; height: 100%; overflow: hidden; background: #fff; position: relative; }
        .sliding-website { position: absolute; top: 0; left: 0; width: 100%; animation: slideContent 20s ease-in-out infinite; }
        
        @keyframes slideContent {
            0%, 15% { transform: translateY(0); }
            45%, 60% { transform: translateY(-55%); }
            85%, 100% { transform: translateY(0); }
        }

        /* Keyboard Base */
        .keyboard-base { width: 85%; height: 140px; background: #1a1a1a; margin: -35px auto 0; border-radius: 10px 10px 35px 35px; transform: rotateX(55deg); box-shadow: 0 25px 50px rgba(0,0,0,0.3); position: relative; z-index: 2; border-top: 4px solid #222; }
        .key-rows { padding: 15px; display: flex; flex-direction: column; gap: 6px; opacity: 0.15; }
        .k-row { height: 12px; background: #000; border-radius: 3px; }

        /* Stylus & Mouse */
        .stylus { position: absolute; right: 2%; top: 15%; width: 10px; height: 220px; background: linear-gradient(to bottom, #f1f5f9, #cbd5e1, #f1f5f9); border-radius: 5px; box-shadow: 15px 15px 30px rgba(0,0,0,0.08); animation: floatStylus 5s infinite alternate ease-in-out; z-index: 15; }
        .mouse-item { position: absolute; right: 5%; bottom: 10%; width: 50px; height: 75px; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 25px; box-shadow: 5px 10px 20px rgba(0,0,0,0.05); z-index: 15; animation: floatMouse 4s infinite alternate ease-in-out; }
        
        /* Simulated Website Inside - ENHANCED with Real Content */
        .sim-nav { height: 45px; background: #fff; width: 100%; display: flex; justify-content: space-between; align-items: center; padding: 0 20px; position: sticky; top: 0; z-index: 20; border-bottom: 1px solid #f1f5f9; }
        .sim-logo-p { display: flex; align-items: center; gap: 6px; font-weight: 800; color: var(--primary-dark); font-size: 11px; }
        .sim-dot { width: 8px; height: 8px; border-radius: 50%; background: var(--primary); }
        .sim-links { display: flex; gap: 10px; }
        .sim-links span { font-size: 8px; font-weight: 600; color: var(--text-body); }

        .sim-hero-p { background: linear-gradient(135deg, #1e1b4b, #312e81); padding: 40px 20px; color: #fff; text-align: left; }
        .sim-hero-p h3 { font-size: 20px; color: #fff; margin-bottom: 8px; line-height: 1.2; font-weight: 700; }
        .sim-hero-p p { font-size: 9px; color: rgba(255,255,255,0.7); max-width: 90%; line-height: 1.5; margin-bottom: 15px; }
        .sim-btn-p { display: inline-flex; align-items: center; justify-content: center; padding: 8px 15px; background: var(--secondary); border-radius: 4px; color: #fff; font-size: 8px; font-weight: 700; text-transform: uppercase; cursor: pointer; }

        .sim-grid-p { display: flex; gap: 10px; padding: 20px; background: #fff; }
        .sim-card-p { flex: 1; background: #fff; border-radius: 8px; padding: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.03); border: 1px solid #f1f5f9; text-align: left; }
        .sim-c-img { height: 60px; background: #f8fafc; border-radius: 6px; margin-bottom: 10px; display: flex; align-items: center; justify-content: center; font-size: 18px; color: var(--primary-light); }
        .sim-card-p h4 { font-size: 10px; color: var(--text-dark); margin-bottom: 4px; font-weight: 700; }
        .sim-card-p p { font-size: 8px; color: var(--text-body); line-height: 1.4; }

        .sim-stats-p { display: flex; justify-content: space-around; padding: 20px; background: #fafafa; border-top: 1px solid #f1f5f9; border-bottom: 1px solid #f1f5f9; }
        .sim-stat-item { text-align: center; }
        .sim-stat-num { font-size: 14px; font-weight: 800; color: var(--primary); margin-bottom: 2px; }
        .sim-stat-label { font-size: 7px; color: var(--text-body); font-weight: 600; text-transform: uppercase; }

        .sim-bottom-p { padding: 30px 20px; background: #fdfdfd; }
        .sim-b-row { display: flex; gap: 15px; align-items: center; margin-bottom: 25px; }
        .sim-b-i { width: 90px; height: 90px; background: #f1f5f9; border-radius: 8px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; font-size: 24px; color: var(--secondary); }
        .sim-b-t { flex: 1; text-align: left; }
        .sim-b-t h4 { font-size: 14px; color: var(--text-dark); margin-bottom: 6px; }
        .sim-b-t p { font-size: 9px; color: var(--text-body); line-height: 1.6; }

        .sim-testimonials-p { padding: 30px 20px; background: #fff; text-align: center; }
        .sim-t-title { font-size: 14px; font-weight: 700; color: var(--text-dark); margin-bottom: 20px; }
        .sim-t-grid { display: flex; gap: 10px; }
        .sim-t-card { flex: 1; padding: 12px; background: #f8fafc; border-radius: 8px; border: 1px solid #f1f5f9; }
        .sim-t-user { width: 24px; height: 24px; background: #cbd5e1; border-radius: 50%; margin: 0 auto 8px; display: flex; align-items: center; justify-content: center; font-size: 10px; color: #fff; font-weight: 700; }
        .sim-t-card p { font-size: 8px; color: var(--text-body); line-height: 1.4; font-style: italic; }
        .sim-t-name { font-size: 8px; font-weight: 700; color: var(--primary-dark); margin-top: 6px; }

        .sim-footer-p { background: #0f172a; padding: 20px; color: #fff; text-align: center; }
        .sim-f-top { display: flex; justify-content: space-between; margin-bottom: 15px; align-items: center; }
        .sim-f-logo { font-size: 10px; font-weight: 800; color: #fff; opacity: 0.8; }
        .sim-f-links { display: flex; gap: 8px; }
        .sim-f-links i { font-size: 10px; color: rgba(255,255,255,0.3); }
        .sim-f-copy { font-size: 7px; color: rgba(255,255,255,0.4); }

        /* ----- FINAL CTA ----- */

        /* ----- FINAL CTA ----- */
        .final-cta { padding: 60px 5%; background: #ffffff; text-align: center; }
        .cta-box { 
            max-width: 950px; 
            margin: 0 auto; 
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%); 
            padding: 50px 40px; 
            border-radius: 24px; 
            position: relative; 
            overflow: hidden; 
            box-shadow: 0 20px 40px rgba(112, 77, 243, 0.2);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        .cta-box::before { content: ''; position: absolute; top: -50%; left: -50%; width: 100%; height: 100%; background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%); }
        .cta-box h2 { font-size: 32px; font-weight: 700; margin-bottom: 0; position: relative; z-index: 2; }
        .cta-box p { font-size: 16px; color: rgba(255,255,255,0.8); margin-bottom: 5px; max-width: 600px; position: relative; z-index: 2; line-height: 1.6; }
        .cta-box .btn-theme { position: relative; z-index: 2; margin-top: 10px; }

        /* ----- FOOTER ----- */
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

            .web-hero { padding: 140px 5% 80px !important; text-align: center !important; }
            .web-hero h1 { font-size: 28px !important; line-height: 1.2 !important; }
            .web-hero p { font-size: 15px !important; }

            .mockups-header h2 { font-size: 30px !important; }
            .m-grid { grid-template-columns: 1fr; }
            .b-mockup:hover { transform: none !important; }

            .dev-details { flex-direction: column; text-align: center; }
            .dd-text-col h2 { font-size: 28px !important; }
            .dd-list li { justify-content: center; }
            .dd-img-wrapper { animation: none !important; }
            .dd-backdrop { display: none; }

            .tablet-frame { width: 95% !important; height: 350px !important; }
            .keyboard-base { width: 100% !important; }
            .stylus, .mouse-item { display: none; }

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
        <section class="web-hero">
            <div class="web-hero-content">
                <h1 style="color:#ee2326; font-size:13px; letter-spacing:3px; margin-bottom:15px; font-weight:800;">CUSTOM EXCELLENCE</h1>
                <h1 style="color:#fff;">World-Class Web Development</h1>
                <p>We architect stunning, high-performance web applications that convert users, scale elegantly, and represent your brand with absolute supremacy.</p>
                <a href="#solutions" class="btn-theme" style="background:#fff; color:var(--primary-dark); padding:15px 35px;">View Solutions</a>
            </div>
        </section>

        <!-- Mockups Section -->
        <section id="solutions" class="mockups-section">
            <div class="mockups-header">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Targeted Architectures</h4>
                <h2>Solutions We Provide</h2>
                <p>Depending on your business requirements, we structure our web applications into three primary foundational architectures to ensure optimum speed and capability.</p>
            </div>
            
            <div class="m-grid">
                <!-- Static Sites -->
                <div class="m-col">
                    <h3>Static Websites</h3>
                    <div class="b-mockup">
                        <div class="b-top"><span></span><span></span><span></span></div>
                        <div class="b-body">
                            <div class="wf-box ss-header"></div>
                            <div class="wf-text"></div>
                            <div class="wf-text" style="width: 80%;"></div>
                            <br>
                            <div class="wf-box ss-banner"></div>
                            <div class="wf-text" style="width: 60%; margin:0 auto; margin-bottom:20px;"></div>
                            <div class="wf-box ss-banner-2"></div>
                            <div class="wf-box ss-banner-2" style="margin-top:10px;"></div>
                        </div>
                    </div>
                </div>

                <!-- Dynamic Sites -->
                <div class="m-col">
                    <h3>Dynamic Websites</h3>
                    <div class="b-mockup">
                        <div class="b-top"><span></span><span></span><span></span></div>
                        <div class="b-body dyn-layout">
                            <div class="dyn-left">
                                <div class="wf-box ss-header"></div>
                                <div class="wf-text" style="margin-top:10px;"></div>
                                <div class="wf-text" style="width:70%;"></div>
                                <div class="wf-box dyn-box" style="margin-top:20px; border-radius:15px;"></div>
                                <div class="wf-box dyn-box" style="margin-top:10px; border-radius:15px;"></div>
                            </div>
                            <div class="dyn-right">
                                <div class="wf-box dyn-hero"></div>
                                <div class="wf-box dyn-box" style="height:35px; margin-top:5px;"></div>
                                <div class="dyn-mini-grid">
                                    <div class="wf-box dyn-mini-box"></div>
                                    <div class="wf-box dyn-mini-box"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- E-Commerce Sites -->
                <div class="m-col">
                    <h3>E-Commerce Websites</h3>
                    <div class="b-mockup">
                        <div class="b-top"><span></span><span></span><span></span></div>
                        <div class="b-body">
                            <div class="eco-nav">
                                <div class="wf-box eco-nav-item"></div>
                                <div class="wf-box eco-nav-item"></div>
                                <div class="wf-box eco-nav-item"></div>
                                <div class="wf-box eco-nav-item"></div>
                            </div>
                            <div class="wf-box eco-hero"></div>
                            <div class="eco-products">
                                <div class="eco-prod">
                                    <div class="wf-box eco-prod-img"></div>
                                    <div class="wf-text"></div>
                                    <div class="wf-box eco-prod-btn" style="border-color:#f5a623;"></div>
                                </div>
                                <div class="eco-prod">
                                    <div class="wf-box eco-prod-img"></div>
                                    <div class="wf-text"></div>
                                    <div class="wf-box eco-prod-btn"></div>
                                </div>
                                <div class="eco-prod">
                                    <div class="wf-box eco-prod-img"></div>
                                    <div class="wf-text"></div>
                                    <div class="wf-box eco-prod-btn"></div>
                                </div>
                                <div class="eco-prod">
                                    <div class="wf-box eco-prod-img"></div>
                                    <div class="wf-text"></div>
                                    <div class="wf-box eco-prod-btn"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Image & Details Section -->
        <section class="dev-details">
            <div class="dd-img-col">
                <div class="dd-backdrop"></div>
                <div class="dd-img-wrapper">
                    <img src="assets/img/web dev.png" alt="Web Development Capabilities">
                </div>
            </div>
            
            <div class="dd-text-col">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Advanced Web Technologies</h4>
                <h2>Translating Complex Logic Into Beautiful Web Interfaces</h2>
                <div style="width: 60px; height: 3px; background:var(--primary); margin-bottom: 25px;"></div>
                
                <p>We deploy full-cycle development strategies. From initial wireframing to strict backend architecture, our web development pipelines prioritize mobile-first aesthetics, absolute component security, and rapid indexing speeds.</p>
                
                <p>Whether you need a static landing page to generate leads, a dynamic portal with real-time HR & Saftey management synchronization, or an immersive e-commerce funnel, Vivify Soft delivers beyond expectations.</p>
                
                <ul class="dd-list">
                    <li><i class="fas fa-check-circle"></i> Mobile App Development Integration</li>
                    <li><i class="fas fa-check-circle"></i> Custom CRM & Dashboard Interfaces</li>
                    <li><i class="fas fa-check-circle"></i> Scalable Cloud-Native Technologies</li>
                </ul>

                <a href="Home.aspx#contact" class="btn-theme" style="margin-top:15px; background:var(--primary-dark);">Start Your Project Now</a>
            </div>
        </section>

        <!-- Tablet Showcase Gallery -->
        <section class="tablet-showcase">
            <div class="showcase-header">
                <h4 style="color:var(--secondary); text-transform:uppercase; letter-spacing:2px; font-weight:800; font-size:13px; margin-bottom:15px;">Live Experience</h4>
                <h2>Multi-Platform Demonstration</h2>
            </div>

            <div class="tablet-container">
                <!-- Floating Stylus -->
                <div class="stylus"></div>
                <!-- Floating Mouse -->
                <div class="mouse-item"></div>

                <!-- Web Sim Frame -->
                <div class="tablet-frame">
                    <div class="screen-container">
                        <div class="sliding-website">
                            <!-- Nav -->
                            <div class="sim-nav">
                                <div class="sim-logo-p"><div class="sim-dot"></div>VIVIFY SOFT</div>
                                <div class="sim-links">
                                    <span>ABOUT</span>
                                    <span>SERVICES</span>
                                    <span>WORK</span>
                                </div>
                            </div>
                            <!-- Hero Section -->
                            <div class="sim-hero-p">
                                <span class="hero-badge" style="color: var(--accent); border-color: rgba(238, 35, 38, 0.4); background: rgba(238, 35, 38, 0.1);">Future-Proof Engineering</span>
            <h1>Web Architecture <br><span style="color: var(--accent);">Redefined</span></h1>
            <p>From complex enterprise portals to high-performance SaaS platforms, we architect web ecosystems that scale with your ambitions.</p>
                                <div class="sim-btn-p">GET STARTED</div>
                            </div>
                            <!-- Feature Grid -->
                            <div class="sim-grid-p">
                                <div class="sim-card-p">
                                    <div class="sim-c-img" style="background:#eef2ff;"><i class="fas fa-layer-group"></i></div>
                                    <h4>Modern UI/UX</h4>
                                    <p>Stunning designs that prioritize user conversion.</p>
                                </div>
                                <div class="sim-card-p">
                                    <div class="sim-c-img" style="background:#fff1f2;"><i class="fas fa-code"></i></div>
                                    <h4>Clean Code</h4>
                                    <p>Robust backend systems built for speed and security.</p>
                                </div>
                                <div class="sim-card-p">
                                    <div class="sim-c-img" style="background:#f0fdf4;"><i class="fas fa-rocket"></i></div>
                                    <h4>Fast Indexing</h4>
                                    <p>SEO optimized structures for maximum visibility.</p>
                                </div>
                            </div>
                            <!-- Statistics -->
                            <div class="sim-stats-p">
                                <div class="sim-stat-item"><div class="sim-stat-num">500+</div><div class="sim-stat-label">Clients</div></div>
                                <div class="sim-stat-item"><div class="sim-stat-num" style="color:#ff4a72;">12M</div><div class="sim-stat-label">Users</div></div>
                                <div class="sim-stat-item"><div class="sim-stat-num" style="color:#25d366;">24/7</div><div class="sim-stat-label">Support</div></div>
                            </div>
                            <!-- Bottom Detail -->
                            <div class="sim-bottom-p">
                                <div class="sim-b-row">
                                    <div class="sim-b-i"><i class="fas fa-shield-alt"></i></div>
                                    <div class="sim-b-t">
                                        <h4>Enterprise Security</h4>
                                        <p>Our applications utilize military-grade encryption and strict data protocols to ensure your business remains protected against all threats.</p>
                                    </div>
                                </div>
                                <div class="sim-b-row" style="flex-direction:row-reverse;">
                                    <div class="sim-b-i" style="background:#fff; color:var(--primary);"><i class="fas fa-chart-line"></i></div>
                                    <div class="sim-b-t">
                                        <h4>Data Analytics</h4>
                                        <p>Real-time dashboards providing deep insights into your business performance and user behavior patterns across all platforms.</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Testimonials -->
                            <div class="sim-testimonials-p">
                                <div class="sim-t-title">Client Success Stories</div>
                                <div class="sim-t-grid">
                                    <div class="sim-t-card">
                                        <div class="sim-t-user" style="background:var(--primary);">JD</div>
                                        <p>"The scale and performance of the portal exceeded all our expectations."</p>
                                        <div class="sim-t-name">John Doe, CEO</div>
                                    </div>
                                    <div class="sim-t-card">
                                        <div class="sim-t-user" style="background:var(--secondary);">AS</div>
                                        <p>"Perfect execution from initial wireframing to the live launch."</p>
                                        <div class="sim-t-name">Alex Smith, CTO</div>
                                    </div>
                                </div>
                            </div>
                            <!-- Simulated Footer -->
                            <div class="sim-footer-p">
                                <div class="sim-f-top">
                                    <div class="sim-f-logo">VIVIFY SOFT</div>
                                    <div class="sim-f-links">
                                        <i class="fab fa-facebook"></i><i class="fab fa-twitter"></i><i class="fab fa-linkedin"></i>
                                    </div>
                                </div>
                                <div class="sim-f-copy">© 2026 Vivify. Designed for Excellence.</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Keyboard Base -->
                <div class="keyboard-base">
                    <div class="key-rows">
                        <div class="k-row" style="width: 100%;"></div>
                        <div class="k-row" style="width: 95%;"></div>
                        <div class="k-row" style="width: 100%; height: 25px;"></div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Footer -->
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

            // Close modal when clicking outside
            window.onclick = function(event) {
                const modal = document.getElementById('loginModal');
                if (event.target == modal) {
                    closeLoginModal();
                }
            }
        </script>
    </form>
</body>
</html>


