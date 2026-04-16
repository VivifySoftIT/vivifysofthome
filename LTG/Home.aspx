<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vivify.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vivify Soft | Innovation in Motion</title>
    <link href="assets/img/favicon.ico" rel="icon">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!-- Prefetch for faster redirect -->
    <link rel="prefetch" href="WebDevelopment.aspx">
    <link rel="prefetch" href="MobileDevelopment.aspx">
    <link rel="prefetch" href="CustomDevelopment.aspx">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    
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
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-body);
            color: var(--text-body);
            overflow-x: hidden;
            line-height: 1.7;
        }

        h1, h2, h3, h4, h5, h6 {
            font-weight: 700;
            color: var(--text-dark);
            line-height: 1.2;
        }

        ul {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* ----- CUSTOM SCROLL & UTILITIES ----- */
        .reveal-up {
            opacity: 0;
            transform: translateY(50px);
            transition: opacity 0.9s ease, transform 0.9s cubic-bezier(0.22, 1, 0.36, 1);
        }
        .reveal-up.active {
            opacity: 1;
            transform: translateY(0);
        }

        .reveal-left {
            opacity: 0;
            transform: translateX(-60px);
            transition: opacity 0.9s ease, transform 0.9s cubic-bezier(0.22, 1, 0.36, 1);
        }
        .reveal-left.active {
            opacity: 1;
            transform: translateX(0);
        }

        .reveal-right {
            opacity: 0;
            transform: translateX(60px);
            transition: opacity 0.9s ease, transform 0.9s cubic-bezier(0.22, 1, 0.36, 1);
        }
        .reveal-right.active {
            opacity: 1;
            transform: translateX(0);
        }

        .reveal-scale {
            opacity: 0;
            transform: scale(0.88);
            transition: opacity 0.9s ease, transform 0.9s cubic-bezier(0.22, 1, 0.36, 1);
        }
        .reveal-scale.active {
            opacity: 1;
            transform: scale(1);
        }

        /* ----- FLOATING ANIMATION ----- */
        @keyframes floatUp {
            0%   { transform: translateY(0px); }
            50%  { transform: translateY(-18px); }
            100% { transform: translateY(0px); }
        }
        .floating {
            animation: floatUp 4s ease-in-out infinite;
        }

        /* ----- SCROLL PROGRESS BAR ----- */
        .page-scroll-indicator {
            position: fixed;
            top: 50%;
            right: 25px;
            transform: translateY(-50%);
            width: 4px;
            height: 140px;
            background: rgba(35, 43, 102, 0.15);
            border-radius: 10px;
            z-index: 9999;
            overflow: hidden;
        }
        .scroll-progress-fill {
            width: 100%;
            height: 0%;
            background: var(--accent);
            border-radius: 10px;
            transition: height 0.12s ease-out;
            box-shadow: 0 0 12px rgba(238, 35, 38, 0.6);
        }
        @media (max-width: 768px) {
            .page-scroll-indicator { display: none; }
        }

        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }
        .section-title h2 {
            font-size: 40px;
            margin-bottom: 20px;
        }
        .section-title p {
            font-size: 16px;
            max-width: 600px;
            margin: 0 auto;
        }

        /* ----- NAVBAR ----- */
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
            border-image: linear-gradient(90deg, var(--primary), var(--secondary)) 1; /* Premium gradient border */
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
            background: #007bff;
            color: #fff !important;
            border-radius: 12px;
            font-weight: 700;
            font-size: 17px;
            text-decoration: none;
            transition: 0.3s;
        }

        .login-opt-btn:hover {
            background: #0056b3;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 123, 255, 0.3);
        }

        /* ----- HERO SECTION ----- */
        .hero {
            position: relative;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 120px 5% 60px;
            overflow: hidden;
            color: white;
        }

        /* Animated Particles/Blobs in Hero */
        .hero-shapes {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            z-index: 0;
            pointer-events: none;
        }
        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            animation: float 8s infinite alternate ease-in-out;
        }
        .shape-1 { width: 150px; height: 150px; top: 15%; left: 5%; animation-delay: 0s; }
        .shape-2 { width: 300px; height: 300px; top: 50%; right: -5%; animation-delay: 2s; }
        .shape-3 { width: 80px; height: 80px; bottom: 20%; left: 30%; animation-delay: 4s; }

        @keyframes float {
            0% { transform: translateY(0px) scale(1.0); }
            100% { transform: translateY(-30px) scale(1.1); }
        }

        .hero-content {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            z-index: 10;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .hero-text {
            flex: 1.5;
            min-width: 350px;
            padding-right: 40px;
            z-index: 2;
        }
        .hero-image {
            flex: 1; /* Keeping image container narrower */
            display: flex;
            justify-content: flex-end;
            min-width: 300px;
        }

        .hero-text h1 {
            color: #fff;
            font-size: 44px; /* Reduced from 52px for a more compact, premium look */
            font-weight: 800;
            margin-bottom: 25px;
            line-height: 1.2; /* Improved readability */
            text-shadow: 0 5px 15px rgba(0,0,0,0.2);
            animation: slideUpFade 1s 0.2s forwards;
            opacity: 0;
            transform: translateY(30px);
            width: 100%;
        }

        .hero-text p {
            color: rgba(255, 255, 255, 0.85);
            font-size: 15px; /* Slightly more compact */
            margin-bottom: 40px;
            animation: slideUpFade 1s 0.4s forwards;
            opacity: 0;
            transform: translateY(30px);
            line-height: 1.6;
            max-width: 550px;
        }

        .hero-btns {
            animation: slideUpFade 1s 0.6s forwards;
            opacity: 0;
            transform: translateY(30px);
        }

        .hero-image {
            flex: 0.8; /* Further reduced template container */
            min-width: 300px;
            position: relative;
            z-index: 2;
            animation: floatImage 4s infinite alternate ease-in-out;
            display: flex;
            justify-content: center;
        }

        .hero-image img, .hero-image .template-box {
            width: 100%;
            max-width: 380px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
        }

        @media (max-width: 480px) {
            .hero-image img, .hero-image .template-box {
                max-width: 100%;
            }
        }

        @keyframes floatImage {
            0% { transform: translateY(0); }
            100% { transform: translateY(-20px); }
        }

        @keyframes slideUpFade {
            to { opacity: 1; transform: translateY(0); }
        }

        /* Wave Bottom Divider */
        .wave-bottom {
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            line-height: 0;
            z-index: 5;
        }
        .wave-bottom svg {
            display: block;
            width: calc(100% + 1.3px);
            height: 120px;
        }
        @media (max-width: 768px) {
            .wave-bottom svg { height: 60px; }
        }
        .wave-bottom .shape-fill {
            fill: var(--bg-body);
        }

        /* ----- MARQUEE / TECH STACK ----- */
        .tech-stack {
            padding: 80px 0;
            background: var(--bg-body);
            overflow: hidden;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .marquee-wrapper {
            display: flex;
            white-space: nowrap;
            overflow: hidden;
        }

        .marquee-track {
            display: flex;
            gap: 80px;
            padding-left: 80px;
            animation: marquee 20s linear infinite;
        }

        .tech-item {
            font-size: 24px;
            font-weight: 700;
            color: #8a8d9f; /* Darker grey to be highly visible against light background */
            text-transform: uppercase;
            letter-spacing: 2px;
            display: flex;
            align-items: center;
            gap: 15px;
            transition: all 0.3s;
        }

        .tech-item:hover {
            color: var(--accent);
            transform: scale(1.1);
        }
        .tech-item i { font-size: 30px; }

        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        /* ----- AMAZING FEATURES ----- */
        .amazing-features {
            padding: 80px 5%;
            background: #ffffff;
            position: relative;
        }

        .amz-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 60px;
        }

        .amz-left {
            flex: 1;
            min-width: 320px;
            display: flex;
            justify-content: center;
            position: relative;
        }

        .amz-right {
            flex: 1.5;
            min-width: 350px;
        }

        .amz-header {
            margin-bottom: 40px;
        }
        .amz-header h2 {
            font-size: 40px;
            color: var(--text-dark);
            margin-bottom: 15px;
        }
        .amz-line {
            width: 40px;
            height: 3px;
            background: var(--accent);
            margin-bottom: 25px;
        }
        .amz-header p {
            color: var(--text-body);
            font-size: 15px;
            max-width: 500px;
            line-height: 1.8;
        }

        .amz-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }

        .amz-card {
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.04);
            transition: all 0.4s ease;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            border: 1px solid rgba(0,0,0,0.03);
        }

        .amz-icon {
            font-size: 35px;
            color: var(--accent);
            margin-bottom: 25px;
            transition: color 0.4s ease;
        }

        .amz-card h3 {
            font-size: 20px;
            margin-bottom: 15px;
            color: var(--text-dark);
            transition: color 0.4s ease;
        }

        .amz-card p {
            font-size: 14px;
            color: var(--text-body);
            line-height: 1.8;
            transition: color 0.4s ease;
        }

        .amz-card:hover {
            background: var(--accent);
            box-shadow: 0 15px 40px rgba(238, 35, 38, 0.4);
            transform: translateY(-5px);
            border-color: var(--accent);
        }
        .amz-card:hover .amz-icon,
        .amz-card:hover h3,
        .amz-card:hover p {
            color: #ffffff;
        }

        /* Amazing Features Floating Image */
        .amz-float-img-wrap {
            position: relative;
            display: inline-block;
        }
        .amz-float-img {
            width: 100%;
            max-width: 480px;
            border-radius: 24px;
            box-shadow: 0 40px 80px rgba(69, 36, 197, 0.18), 0 10px 30px rgba(0,0,0,0.10);
            animation: floatMobile 4s infinite alternate ease-in-out;
            display: block;
        }

        /* Mobile Mockup Animation & Styling */
        .mobile-mockup {
            width: 300px;
            height: 600px;
            background: #ffffff;
            border-radius: 40px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.1);
            position: relative;
            padding: 12px;
            animation: floatMobile 4s infinite alternate ease-in-out;
            border: 2px solid #f4f5f9;
        }
        .mobile-mockup::before {
            content: '';
            position: absolute;
            top: 12px; left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 25px;
            background: #ffffff;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            z-index: 10;
        }
        .mobile-screen {
            width: 100%;
            height: 100%;
            background: #fdfdfd;
            border-radius: 28px;
            overflow: hidden;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .screen-top {
            display: flex;
            justify-content: space-between;
            padding: 12px 20px;
            font-size: 11px;
            color: #000;
            font-weight: 600;
            z-index: 10;
        }
        .status-icons {
            display: flex;
            gap: 5px;
        }
        .mockup-content {
            flex: 1;
            position: relative;
            padding: 20px;
            background: url('data:image/svg+xml;utf8,<svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"><circle cx="20" cy="50" r="10" fill="%23f4f5fa"/><circle cx="280" cy="150" r="8" fill="%23f4f5fa"/></svg>') transparent;
        }
        .m-badge {
            position: absolute;
            top: 20px; right: 20px;
            background: rgba(238, 35, 38, 0.1);
            color: var(--accent);
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 9px;
            font-weight: 700;
        }
        .m-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.06);
            padding: 20px;
            margin-top: 60px;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }
        .m-line {
            height: 8px;
            background: #e4e7ff;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        .m-line.short { width: 50%; }
        .m-line.long { width: 85%; }
        .m-bars {
            display: flex;
            gap: 10px;
            align-items: flex-end;
            height: 50px;
            margin-top: 20px;
        }
        .m-bars span {
            flex: 1;
            background: #e4e7ff;
            border-radius: 3px;
        }
        .m-bars span:nth-child(2) { height: 70%; background: var(--accent); }
        .m-bars span:nth-child(4) { height: 100%; background: var(--primary); }

        .mockup-bottom {
            background: var(--primary-dark);
            height: 220px;
            color: #fff;
            padding: 30px 25px;
            text-align: center;
            position: relative;
        }
        .mockup-bottom::before {
            content: '';
            position: absolute;
            top: -30px; left: 0; width: 100%; height: 50px;
            background: var(--primary-dark);
            border-radius: 40px 40px 0 0;
            transform: scaleY(1.5);
        }
        .mockup-bottom-content {
            position: relative;
            z-index: 2;
            margin-top: 15px;
        }
        .mockup-bottom-content h4 {
            color: #fff;
            margin-bottom: 12px;
            font-size: 18px;
        }
        .mockup-bottom-content p {
            font-size: 12px;
            opacity: 0.8;
            line-height: 1.6;
            margin-bottom: 25px;
        }
        .m-dots {
            display: flex;
            justify-content: center;
            gap: 6px;
        }
        .m-dots span {
            width: 6px; height: 6px;
            background: #fff;
            border-radius: 50%;
            opacity: 0.3;
        }
        .m-dots span:first-child { opacity: 1; width: 8px; height: 8px; }
        
        @keyframes floatMobile {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-25px); }
        }

        /* ----- OUR VERTICAL PROCESS TIMELINE ----- */
        .process-section {
            padding: 100px 5%;
            background: #fdfdfd;
            position: relative;
        }

        .process-container {
            max-width: 900px;
            margin: 0 auto;
            position: relative;
        }

        .process-line {
            position: absolute;
            top: 20px;
            bottom: 20px;
            left: 50%;
            width: 4px;
            background: #e4e7ff;
            transform: translateX(-50%);
            border-radius: 2px;
            z-index: 0;
        }

        .process-item {
            display: flex;
            width: 100%;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 50px;
            position: relative;
            z-index: 1;
        }

        .process-item:nth-child(even) {
            flex-direction: row-reverse;
        }

        .process-content {
            width: 42%;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            text-align: right;
            border: 1px solid rgba(0,0,0,0.03);
            transition: all 0.4s ease;
        }

        .process-item:nth-child(even) .process-content {
            text-align: left;
        }

        .process-empty {
            width: 42%;
        }

        .process-number {
            width: 70px;
            height: 70px;
            background: #fff;
            border: 4px solid #e4e7ff;
            color: var(--primary-dark);
            font-size: 26px;
            font-weight: 700;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.4s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
        }

        .process-item:hover .process-content {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(238, 35, 38, 0.15);
        }

        .process-item:hover .process-number {
            border-color: var(--accent);
            background: var(--accent);
            color: #fff;
            transform: translateX(-50%) scale(1.15);
            box-shadow: 0 10px 25px rgba(238, 35, 38, 0.4);
        }

        .process-content h4 {
            font-size: 20px;
            margin-bottom: 10px;
            color: var(--primary-dark);
        }
        
        .process-content p {
            font-size: 15px;
            color: var(--text-body);
            margin: 0;
        }

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

        .footer-text {
            color: rgba(255,255,255,0.7);
            font-size: 15px;
            margin-bottom: 30px;
        }

        @media(max-width: 900px) {
            .nav-links { display: none; }
            .hero-text h1 { font-size: 32px; line-height: 1.2; } /* Reduced from 40px */
            .hero-text, .hero-image, .amz-left, .amz-right, .about-img, .about-text, .resp-img-col, .resp-text-col, .st-text-col, .st-img-col, .flt-text, .flt-mockups {
                min-width: 0 !important;
                width: 100% !important;
                padding-right: 0 !important;
                text-align: center !important;
            }
            .hero-content, .amz-container, .about-section, .responsive-section, .save-time-section, .floating-templates-section {
                flex-direction: column !important;
                text-align: center !important;
                padding: 60px 4% !important;
            }
            .process-line { left: 35px; }
            .process-item { flex-direction: row !important; align-items: center; gap: 20px; margin-bottom: 40px; }
            .process-number { position: relative; left: 0; transform: none !important; margin-bottom: 0; min-width: 70px; }
            .amz-header h2 { font-size: 32px; }
            .amz-grid, .why-us-grid, .services-grid {
                grid-template-columns: 1fr !important;
            }
            .amz-card, .why-card, .service-card {
                text-align: center !important;
                align-items: center !important;
            }
            .amz-header p { margin: 0 auto; }
            .about-section { padding: 60px 5% !important; }
            .responsive-section { text-align: center; }
            .resp-img-backdrop { width: 300px; height: 300px; }
            .flt-mockups { height: 350px; width: 100%; }
            .flt-web-mockup { width: 280px; height: 180px; left: 5%; }
            .flt-mobile-mockup { width: 140px; height: 300px; right: 5%; }
            .floating-templates-section { padding: 60px 5%; }
            .flt-text .amz-line { margin: 0 auto 25px !important; }
            .flt-text div[style*="align-items: center"] { justify-content: center; flex-wrap: wrap; }
        }

        /* ----- ABOUT US ----- */
        .about-section { padding: 40px 5%; background: #ffffff; display: flex; align-items: center; justify-content: space-between; gap: 50px; flex-wrap: wrap; }
        .about-img { flex: 1; min-width: 300px; display: flex; justify-content: center; position: relative; }
        .about-img-inner { width: 100%; max-width: 500px; height: 500px; background: linear-gradient(135deg, rgba(112, 77, 243, 0.05) 0%, rgba(69, 36, 197, 0.05) 100%); border-radius: 30px; position: relative; overflow: hidden; display:flex; align-items:center; justify-content:center; }
        .about-text { flex: 1; min-width: 320px; }
        .about-text h4 { color: var(--accent); font-size: 16px; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px; }
        .about-text h2 { font-size: 40px; margin-bottom: 25px; color: var(--text-dark); }
        .about-text p { font-size: 16px; color: var(--text-body); margin-bottom: 20px; line-height: 1.8; }
        
        /* ----- WHY CHOOSE US ----- */
        .why-us-section { padding: 40px 5%; background: var(--bg-body); }
        .why-us-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 30px; max-width: 1200px; margin: 0 auto; }
        .why-card { background: #fff; padding: 40px 30px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.03); transition: all 0.4s ease; border-bottom: 3px solid transparent; }
        .why-card:hover { transform: translateY(-10px); box-shadow: 0 15px 40px rgba(238, 35, 38, 0.1); border-color: var(--accent); }
        .wc-icon { font-size: 40px; color: var(--accent); margin-bottom: 25px; transition: transform 0.4s ease;}
        .why-card:hover .wc-icon { transform: scale(1.1); }
        .why-card h3 { font-size: 22px; margin-bottom: 15px; color: var(--text-dark); }
        
        /* ----- LIFETIME COMMITMENT ----- */
        .lifetime-section { padding: 60px 5%; background: linear-gradient(135deg, var(--primary-dark), var(--primary)); color: #fff; text-align: center; position: relative; overflow: hidden; }
        .lifetime-content { position: relative; z-index: 2; max-width: 800px; margin: 0 auto; }
        .lifetime-content h2 { color: #fff; font-size: 35px; margin-bottom: 25px; }
        .lifetime-content p { font-size: 18px; color: rgba(255,255,255,0.8); line-height: 1.8; }
        
        /* ----- RESPONSIVE & RETINA READY ----- */
        .responsive-section { padding: 80px 5%; background: var(--bg-body); display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 60px; overflow: hidden; }
        .resp-img-col { flex: 1.2; min-width: 300px; position: relative; display: flex; justify-content: center; align-items: center; }
        .resp-img-backdrop { position: absolute; width: 450px; height: 450px; background: #f0f3fd; border-radius: 50%; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 0; }
        .resp-img-dots { position: absolute; bottom: 0; right: 10%; width: 120px; height: 120px; background-image: radial-gradient(var(--primary-light) 2px, transparent 2px); background-size: 15px 15px; opacity: 0.3; z-index: 1; }
        .resp-img { position: relative; z-index: 2; max-width: 100%; animation: floatImage 4s infinite alternate ease-in-out; }
        .resp-text-col { flex: 1; min-width: 320px; z-index: 3; }
        .resp-text-col h2 { font-size: 42px; color: var(--text-dark); margin-bottom: 20px; line-height: 1.3; font-weight: 600; }
        .resp-text-col p { font-size: 16px; color: var(--text-body); line-height: 1.8; }
        
        /* ----- SAVE YOUR TIME IN ANY PLATFORM ----- */
        .save-time-section { padding: 80px 5%; background: #ffffff; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap-reverse; gap: 60px; overflow: hidden; }
        .st-text-col { flex: 1; min-width: 320px; z-index: 3; }
        .st-text-col h2 { font-size: 42px; color: var(--text-dark); margin-bottom: 20px; line-height: 1.3; font-weight: 600; }
        .st-text-col p { font-size: 16px; color: var(--text-body); line-height: 1.8; margin-bottom: 20px; }
        .st-features { margin-top: 30px; display: flex; flex-direction: column; gap: 15px; }
        .st-feature-item { display: flex; align-items: center; gap: 15px; font-size: 18px; color: var(--text-dark); font-weight: 600; }
        .st-icon-box { min-width: 45px; height: 45px; background: rgba(238, 35, 38, 0.1); color: var(--accent); border-radius: 50%; display: flex; justify-content: center; align-items: center; font-size: 18px; }
        .st-img-col { flex: 1.2; min-width: 300px; position: relative; display: flex; justify-content: center; align-items: center; }
        .st-img-backdrop { position: absolute; width: 450px; height: 450px; background: #eef2ff; border-radius: 30px; transform: rotate(10deg); z-index: 0; }
        .st-img { position: relative; z-index: 2; max-width: 100%; box-shadow: 0 40px 80px rgba(0,0,0,0.1); border-radius: 12px; animation: floatImage 5s infinite alternate ease-in-out; }
        
        /* ----- SERVICES ----- */
        .services-section { padding: 40px 5%; background: #ffffff; }
        .services-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 30px; max-width: 1200px; margin: 0 auto; }
        .service-card { 
            background: var(--bg-body); 
            padding: 50px 30px; 
            border-radius: 15px; 
            text-align: center; 
            transition: all 0.4s ease; 
            border: 1px solid rgba(0,0,0,0.03); 
            border-bottom: 3px solid transparent; /* Border bottom like why choose us */
        }
        .service-card:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 20px 40px rgba(238, 35, 38, 0.1); 
            background: #ffffff; 
            border-bottom-color: var(--accent); 
        }
        .sc-icon { font-size: 50px; color: var(--accent); margin-bottom: 25px; transition: transform 0.4s ease; }
        .service-card:hover .sc-icon { transform: scale(1.1); color: var(--accent); }
        .service-card h3 { font-size: 24px; margin-bottom: 20px; color: var(--text-dark); }
        .service-card p { font-size: 15px; color: var(--text-body); line-height: 1.8; }
        
        /* ----- FLOATING TEMPLATES ----- */
        .floating-templates-section { padding: 80px 5%; background: linear-gradient(135deg, #0f0a1f, #1e1b4b); color: #fff; overflow: hidden; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap; gap: 60px; position: relative; }
        .flt-text { flex: 1; min-width: 320px; z-index: 2; }
        .flt-text h2 { color: #fff; font-size: 42px; margin-bottom: 25px; line-height: 1.2; font-weight: 700; }
        .flt-text p { color: rgba(255,255,255,0.7); font-size: 16px; margin-bottom: 30px; line-height: 1.8; }
        
        .flt-mockups { flex: 1.2; min-width: 300px; position: relative; height: 500px; display: flex; justify-content: center; align-items: center; z-index: 2; perspective: 1000px; }
        
        /* Floating Web Template */
        .flt-web-mockup { width: 550px; height: 350px; background: #0b0b12; border-radius: 12px; box-shadow: 0 40px 80px rgba(0,0,0,0.6), 0 0 0 1px rgba(255,255,255,0.05); position: absolute; left: -5%; top: 50%; transform: translateY(-50%) rotateY(5deg) scale(0.95); animation: floatSync 6s infinite alternate ease-in-out; display: flex; flex-direction: column; overflow: hidden; border: 4px solid #1a1b26; }
        .flt-web-top { background: #1f2335; height: 20px; display: flex; align-items: center; padding: 0 10px; gap: 6px; }
        .flt-web-top span { width: 8px; height: 8px; border-radius: 50%; }
        .flt-web-top span:nth-child(1) { background: #ff5f56; }
        .flt-web-top span:nth-child(2) { background: #ffbd2e; }
        .flt-web-top span:nth-child(3) { background: #27c93f; }
        .flt-web-body { flex: 1; background: linear-gradient(135deg, #13112b, #0f0a1f); position: relative; padding: 20px; }
        .flt-web-content { width: 100%; height: 100%; display: flex; gap: 20px; }
        .flt-sidebar { width: 40px; background: rgba(255,255,255,0.03); border-radius: 8px; }
        .flt-main { flex: 1; display: flex; flex-direction: column; gap: 15px; }
        .flt-header { height: 30px; background: rgba(255,255,255,0.03); border-radius: 6px; }
        .flt-graph { flex: 1; background: url('data:image/svg+xml;utf8,<svg width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"><path d="M0,50 Q40,10 80,40 T160,20 T240,60 T320,10" fill="none" stroke="%23704df3" stroke-width="4"/></svg>') no-repeat center; border-radius: 8px; position: relative; overflow: hidden; }
        .flt-cirlce-glow { position: absolute; right: 20%; top: 20%; width: 60px; height: 60px; background: radial-gradient(circle, var(--accent) 0%, transparent 70%); border-radius: 50%; opacity: 0.5; filter: blur(10px); }

        /* Floating Mobile Template */
        .flt-mobile-mockup { width: 200px; height: 400px; background: #0f0f15; border-radius: 35px; box-shadow: -20px 30px 60px rgba(0,0,0,0.8), 0 0 0 1px rgba(255,255,255,0.1); position: absolute; right: 5%; top: 50%; transform: translateY(-40%) rotate(-5deg); border: 8px solid #1a1a24; animation: floatSyncReverse 5.5s infinite alternate ease-in-out; overflow: hidden; z-index: 10; }
        .flt-mobile-notch { position: absolute; top: 0; left: 50%; transform: translateX(-50%); width: 80px; height: 20px; background: #1a1a24; border-bottom-left-radius: 12px; border-bottom-right-radius: 12px; z-index: 11; }
        .flt-mobile-body { background: linear-gradient(135deg, #181534, #0b0f19); width: 100%; height: 100%; padding: 35px 15px 15px; position: relative; }
        .flt-m-hero { width: 100%; height: 120px; background: linear-gradient(to top, rgba(112,77,243,0.8), transparent 80%), url('assets/img/ferenc-almasi-eYpcLDXHVb0-unsplash.jpg') center/cover; border-radius: 10px; margin-bottom: 15px; }
        .flt-m-row { display: flex; gap: 8px; margin-bottom: 10px; }
        .flt-m-box { flex: 1; height: 60px; background: rgba(255,255,255,0.05); border-radius: 8px; overflow: hidden; position: relative; }
        .flt-audio-wave { position: absolute; bottom: 10px; left: 10px; width: 80%; height: 15px; background: repeating-linear-gradient(90deg, var(--accent), var(--accent) 2px, transparent 2px, transparent 4px); opacity: 0.5; }

        @keyframes floatSync {
            0% { transform: translateY(-50%) rotateY(5deg) scale(0.95); }
            100% { transform: translateY(-55%) rotateY(8deg) scale(0.95); }
        }
        @keyframes floatSyncReverse {
            0% { transform: translateY(-40%) rotate(-5deg); }
            100% { transform: translateY(-35%) rotate(-2deg); }
        }

        /* ----- AI TECHNOLOGY ----- */
        .ai-tech-section { padding: 80px 5%; background: #ffffff; display: flex; align-items: center; justify-content: center; text-align: center; position: relative; overflow: hidden; }
        .login-opt-btn { display: flex; align-items: center; justify-content: center; gap: 12px; padding: 16px; background: #232b66; color: #fff !important; border-radius: 12px; font-weight: 700; font-size: 17px; text-decoration: none; transition: 0.3s; }
        .login-opt-btn:hover { background: #1a2150; transform: translateY(-3px); box-shadow: 0 10px 20px rgba(35,43,102,0.3); }
        .ai-content { max-width: 800px; z-index: 2; }
        .ai-icon-wrap { width: 100px; height: 100px; background: rgba(238, 35, 38, 0.1); border-radius: 50%; display: flex; justify-content: center; align-items: center; margin: 0 auto 30px; font-size: 45px; color: var(--accent); animation: pulseGlow 2s infinite alternate; }
        @keyframes pulseGlow {
            0% { box-shadow: 0 0 10px rgba(238, 35, 38, 0.2); transform: scale(1); }
            100% { box-shadow: 0 0 40px rgba(238, 35, 38, 0.6); transform: scale(1.05); }
        }
        .ai-content h2 { font-size: 40px; margin-bottom: 25px; color: var(--text-dark); }
        .ai-content p { font-size: 16px; color: var(--text-body); line-height: 1.8; margin-bottom: 20px; }
        
        /* ----- GALLERY ----- */
        .gallery-section { padding: 40px 5%; background: var(--bg-body); }
        .gallery-grid { column-count: 3; column-gap: 20px; max-width: 1200px; margin: 0 auto; }
        @media (max-width: 900px) { .gallery-grid { column-count: 2; } }
        @media (max-width: 600px) { .gallery-grid { column-count: 1; } }
        .gallery-item { position: relative; border-radius: 12px; overflow: hidden; cursor: pointer; background: #dedede; z-index: 1; box-shadow: 0 10px 30px rgba(0,0,0,0.05); break-inside: avoid; margin-bottom: 20px; }
        .g-img { width: 100%; height: auto; transition: transform 0.6s ease; display: block; border-radius: 12px; }
        .gallery-item:hover .g-img { transform: scale(1.1); }
        /* Removed gallery hover overlay and text info */
        /* ----- RESULTS & PRINCIPLES ----- */
        .results-section { padding: 90px 5% 100px; background: linear-gradient(135deg, #201768, #18114a); color: #fff; text-align: center; position: relative; overflow: hidden; border-top: 1px solid rgba(255,255,255,0.05); }
        .results-header { max-width: 700px; margin: 0 auto 40px; position: relative; z-index: 2; }
        .results-header h4 { font-size: 13px; color: var(--accent); text-transform: uppercase; letter-spacing: 3px; margin-bottom: 20px; font-weight: 800; }
        .results-header h2 { font-size: 34px; line-height: 1.4; font-weight: 600; color: rgba(255, 255, 255, 0.4); }
        /* MEGA TYPOGRAPHY LIST STYLES */
        .mega-results-list { max-width: 1200px; margin: 0 auto; text-align: left; position: relative; z-index: 2; }
        .mega-row { display: flex; align-items: center; justify-content: space-between; border-top: 1px solid rgba(255,255,255,0.15); padding: 50px 20px; position: relative; cursor: pointer; transition: all 0.5s ease; overflow: hidden; }
        .mega-row:last-child { border-bottom: 1px solid rgba(255,255,255,0.15); }
        .m-hover-bg { position: absolute; left: 0; bottom: 0; width: 100%; height: 0%; background: linear-gradient(to right, rgba(255,74,114,0.1), rgba(39,18,123,0.3)); z-index: 0; transition: height 0.5s cubic-bezier(0.4, 0, 0.2, 1); }
        .mega-row:hover .m-hover-bg { height: 100%; }
        .m-flex-left, .m-flex-right { position: relative; z-index: 2; }
        .m-flex-left { display: flex; align-items: flex-start; gap: 30px; flex: 1.2; }
        .m-number { font-size: 18px; font-weight: 400; color: rgba(255,255,255,0.4); letter-spacing: 2px; margin-top: 15px; font-family: monospace; transition: color 0.4s; }
        .mega-row:hover .m-number { color: #fff; }
        .m-flex-left h3 { font-size: 36px; font-weight: 600; color: #fff; margin: 0; line-height: 1.1; display:flex; flex-direction:column; transition: transform 0.4s; }
        .m-text-huge { font-size: 70px; color: transparent; -webkit-text-stroke: 1px rgba(255,255,255,0.4); font-weight: 900; margin-bottom: 10px; transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1); text-transform: uppercase; line-height: 1; }
        .mega-row:hover .m-text-huge { color: var(--accent); -webkit-text-stroke: 0px; transform: scale(1.05); transform-origin: left center; text-shadow: 0 10px 30px rgba(238, 35, 38, 0.4); }
        .mega-row:hover .m-flex-left h3 { transform: translateX(20px); }
        .m-flex-right { display: flex; align-items: center; justify-content: space-between; flex: 1; padding-left: 50px; border-left: 1px solid rgba(255,255,255,0.1); transition: border-color 0.4s; }
        .mega-row:hover .m-flex-right { border-left-color: rgba(255,74,114,0.4); }
        .m-flex-right p { font-size: 16px; color: rgba(255,255,255,0.6); line-height: 1.8; max-width: 350px; margin: 0; transition: color 0.4s; }
        .mega-row:hover .m-flex-right p { color: rgba(255,255,255,0.9); }
        .m-icon-huge { font-size: 70px; color: rgba(255,255,255,0.03); transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1); transform: translateX(30px); margin-left:20px; }
        .mega-row:hover .m-icon-huge { color: #ff4a72; transform: translateX(0) scale(1.1); filter: drop-shadow(0 0 15px rgba(255,74,114,0.4)); }
        
        .mega-row:nth-child(2):hover .m-text-huge { color: #f5a623; text-shadow: 0 10px 30px rgba(245,166,35,0.4); }
        .mega-row:nth-child(2):hover .m-icon-huge { color: #f5a623; filter: drop-shadow(0 0 15px rgba(245,166,35,0.4)); }
        .mega-row:nth-child(2):hover .m-hover-bg { background: linear-gradient(to right, rgba(245,166,35,0.1), rgba(39,18,123,0.3)); }
        .mega-row:nth-child(2):hover .m-flex-right { border-left-color: rgba(245,166,35,0.4); }

        .mega-row:nth-child(3):hover .m-text-huge { color: #25d366; text-shadow: 0 10px 30px rgba(37,211,102,0.4); }
        .mega-row:nth-child(3):hover .m-icon-huge { color: #25d366; filter: drop-shadow(0 0 15px rgba(37,211,102,0.4)); }
        .mega-row:nth-child(3):hover .m-hover-bg { background: linear-gradient(to right, rgba(37,211,102,0.1), rgba(39,18,123,0.3)); }
        .mega-row:nth-child(3):hover .m-flex-right { border-left-color: rgba(37,211,102,0.4); }

        .mega-row:nth-child(4):hover .m-text-huge { color: #00e5ff; text-shadow: 0 10px 30px rgba(0,229,255,0.4); }
        .mega-row:nth-child(4):hover .m-icon-huge { color: #00e5ff; filter: drop-shadow(0 0 15px rgba(0,229,255,0.4)); }
        .mega-row:nth-child(4):hover .m-hover-bg { background: linear-gradient(to right, rgba(0,229,255,0.1), rgba(39,18,123,0.3)); }
        .mega-row:nth-child(4):hover .m-flex-right { border-left-color: rgba(0,229,255,0.4); }

        @media(max-width: 900px) {
            .mega-row { flex-direction: column; align-items: flex-start; gap: 30px; padding: 40px 10px; }
            .m-flex-right { border-left: none; padding-left: 0; padding-top: 20px; border-top: 1px solid rgba(255,255,255,0.1); width: 100%; }
            .m-flex-left h3 { font-size: 28px; }
            .m-text-huge { font-size: 45px; }
            .mega-row:hover .m-flex-left h3 { transform: translateX(10px); }
            .m-icon-huge { font-size: 40px; }
        }
        
        /* ----- CONTACT SECTION ----- */
        .contact-section { padding: 70px 5%; background: #ffffff; }
        .contact-container { max-width: 1000px; margin: 0 auto; display: flex; gap: 0; flex-wrap: wrap; background: #fff; border-radius: 20px; box-shadow: 0 20px 60px rgba(0,0,0,0.08); overflow: hidden; border: 1px solid rgba(0,0,0,0.05); }
        .contact-info { flex: 1; min-width: 300px; background: var(--primary-dark); color: #fff; padding: 50px; position: relative; }
        .c-info-item { display: flex; gap: 20px; margin-bottom: 30px; }
        .c-icon { font-size: 24px; color: var(--accent); }
        .c-info-text h4 { color: #fff; font-size: 18px; margin-bottom: 5px; }
        .c-info-text p { color: rgba(255,255,255,0.7); font-size: 15px; }
        .contact-form { flex: 1.5; min-width: 320px; padding: 50px; }
        .form-group { margin-bottom: 25px; }
        .form-control { width: 100%; padding: 15px; border: 1px solid rgba(0,0,0,0.1); border-radius: 8px; font-family: 'Poppins', sans-serif; font-size: 15px; background: var(--bg-body); transition: all 0.3s; }
        .form-control:focus { outline: none; border-color: var(--primary-light); box-shadow: 0 0 0 3px rgba(112, 77, 243, 0.1); }
        
        /* ----- FOOTER UPDATES ----- */
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

        /* ----- AI STATS SECTION ----- */
        .ai-stats-section {
            padding: 70px 5%;
            background: linear-gradient(135deg, #0d0b1e 0%, #1a1245 50%, #0d0b1e 100%);
            position: relative;
            overflow: hidden;
        }
        .ai-stats-section::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"><circle cx="1" cy="1" r="1" fill="rgba(112,77,243,0.15)"/></svg>') repeat;
            opacity: 0.5;
        }
        .ai-stats-header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }
        .ai-stats-header .ai-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(112, 77, 243, 0.2);
            border: 1px solid rgba(112, 77, 243, 0.4);
            color: #a78bfa;
            padding: 8px 20px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 25px;
        }
        .ai-stats-header h2 {
            font-size: 42px;
            color: #fff;
            margin-bottom: 20px;
        }
        .ai-stats-header h2 span { color: #a78bfa; }
        .ai-stats-header p {
            color: rgba(255,255,255,0.6);
            font-size: 16px;
            max-width: 600px;
            margin: 0 auto;
        }
        .ai-stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto 40px;
            position: relative;
            z-index: 2;
        }
        .ai-stat-card {
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(112, 77, 243, 0.2);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        .ai-stat-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 2px;
            background: linear-gradient(90deg, transparent, var(--primary-light), transparent);
            opacity: 0;
            transition: opacity 0.4s;
        }
        .ai-stat-card:hover {
            border-color: rgba(112, 77, 243, 0.6);
            transform: translateY(-8px);
            background: rgba(112, 77, 243, 0.08);
            box-shadow: 0 20px 50px rgba(112, 77, 243, 0.2);
        }
        .ai-stat-card:hover::before { opacity: 1; }
        .ai-stat-icon {
            font-size: 36px;
            margin-bottom: 20px;
            display: block;
        }
        .ai-stat-number {
            font-size: 52px;
            font-weight: 900;
            color: #fff;
            line-height: 1;
            margin-bottom: 12px;
            font-family: 'Poppins', sans-serif;
        }
        .ai-stat-number .suffix { font-size: 32px; color: #a78bfa; }
        .ai-stat-label {
            font-size: 15px;
            color: rgba(255,255,255,0.6);
            font-weight: 500;
            line-height: 1.5;
        }
        /* AI Typing Ticker */
        .ai-ticker-wrap {
            max-width: 900px;
            margin: 0 auto;
            background: rgba(255,255,255,0.03);
            border: 1px solid rgba(112, 77, 243, 0.25);
            border-radius: 16px;
            padding: 25px 35px;
            display: flex;
            align-items: center;
            gap: 20px;
            position: relative;
            z-index: 2;
            backdrop-filter: blur(10px);
        }
        .ai-ticker-dot {
            width: 10px;
            height: 10px;
            background: #25d366;
            border-radius: 50%;
            flex-shrink: 0;
            box-shadow: 0 0 10px #25d366;
            animation: blink 1.5s infinite;
        }
        @keyframes blink {
            0%, 100% { opacity: 1; } 50% { opacity: 0.3; }
        }
        .ai-ticker-label {
            font-size: 13px;
            font-weight: 700;
            color: #a78bfa;
            text-transform: uppercase;
            letter-spacing: 2px;
            flex-shrink: 0;
        }
        .ai-ticker-text {
            font-size: 15px;
            color: rgba(255,255,255,0.8);
            flex: 1;
            min-height: 22px;
        }
        .ai-ticker-cursor {
            display: inline-block;
            width: 2px;
            height: 18px;
            background: #a78bfa;
            margin-left: 3px;
            vertical-align: middle;
            animation: blink 0.8s infinite;
        }

        /* ----- AI CHATBOT WIDGET ----- */
        .ai-chat-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 65px;
            height: 65px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 26px;
            color: #fff;
            cursor: pointer;
            box-shadow: 0 10px 35px rgba(112, 77, 243, 0.55);
            z-index: 9000;
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            border: none;
            outline: none;
        }
        .ai-chat-btn:hover {
            transform: scale(1.12) rotate(-5deg);
            box-shadow: 0 15px 45px rgba(112, 77, 243, 0.7);
        }
        .ai-chat-btn .chat-pulse {
            position: absolute;
            top: -4px; right: -4px;
            width: 18px; height: 18px;
            background: #ff4a72;
            border-radius: 50%;
            border: 2px solid #fff;
            font-size: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 700;
        }
        .ai-chat-popup {
            position: fixed;
            bottom: 110px;
            right: 30px;
            width: 380px;
            max-height: 560px;
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 30px 80px rgba(0,0,0,0.2), 0 0 0 1px rgba(112,77,243,0.1);
            display: flex;
            flex-direction: column;
            z-index: 8999;
            overflow: hidden;
            transform: scale(0.7) translateY(30px);
            opacity: 0;
            pointer-events: none;
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            transform-origin: bottom right;
        }
        .ai-chat-popup.open {
            transform: scale(1) translateY(0);
            opacity: 1;
            pointer-events: all;
        }
        .ai-chat-header {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary));
            padding: 20px 25px;
            display: flex;
            align-items: center;
            gap: 15px;
            flex-shrink: 0;
        }
        .ai-chat-avatar {
            width: 46px; height: 46px;
            background: rgba(255,255,255,0.15);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 22px;
            flex-shrink: 0;
        }
        .ai-chat-header-info { flex: 1; }
        .ai-chat-header-info h4 {
            color: #fff;
            font-size: 16px;
            margin: 0 0 4px;
        }
        .ai-chat-header-info span {
            font-size: 12px;
            color: rgba(255,255,255,0.7);
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .ai-status-dot {
            width: 7px; height: 7px;
            background: #25d366;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 0 6px #25d366;
        }
        .ai-close-chat {
            background: rgba(255,255,255,0.1);
            border: none;
            color: #fff;
            width: 32px; height: 32px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.2s;
        }
        .ai-close-chat:hover { background: rgba(255,255,255,0.25); }
        .ai-chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 14px;
            background: #f8f9ff;
        }
        .ai-chat-messages::-webkit-scrollbar { width: 4px; }
        .ai-chat-messages::-webkit-scrollbar-track { background: transparent; }
        .ai-chat-messages::-webkit-scrollbar-thumb { background: rgba(112,77,243,0.2); border-radius: 10px; }
        .chat-msg {
            display: flex;
            gap: 10px;
            align-items: flex-end;
            max-width: 85%;
        }
        .chat-msg.bot { align-self: flex-start; }
        .chat-msg.user { align-self: flex-end; flex-direction: row-reverse; }
        .chat-bubble {
            padding: 12px 16px;
            border-radius: 18px;
            font-size: 14px;
            line-height: 1.6;
            color: #333;
            word-break: break-word;
        }
        .chat-msg.bot .chat-bubble {
            background: #fff;
            border-bottom-left-radius: 4px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        }
        .chat-msg.user .chat-bubble {
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: #fff;
            border-bottom-right-radius: 4px;
        }
        .chat-mini-avatar {
            width: 30px; height: 30px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-dark), var(--primary));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #fff;
            flex-shrink: 0;
        }
        .chat-quick-btns {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 5px;
        }
        .chat-quick-btn {
            background: rgba(112,77,243,0.08);
            border: 1px solid rgba(112,77,243,0.2);
            color: var(--primary);
            padding: 7px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            font-family: 'Poppins', sans-serif;
        }
        .chat-quick-btn:hover {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
            transform: translateY(-2px);
        }
        .chat-typing {
            display: flex;
            gap: 5px;
            padding: 12px 16px;
            background: #fff;
            border-radius: 18px;
            border-bottom-left-radius: 4px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            align-items: center;
            width: fit-content;
        }
        .chat-typing span {
            width: 7px; height: 7px;
            background: #a78bfa;
            border-radius: 50%;
            animation: typingDot 1.2s infinite;
        }
        .chat-typing span:nth-child(2) { animation-delay: 0.2s; }
        .chat-typing span:nth-child(3) { animation-delay: 0.4s; }
        @keyframes typingDot {
            0%, 60%, 100% { transform: translateY(0); opacity: 0.4; }
            30% { transform: translateY(-6px); opacity: 1; }
        }
        .ai-chat-input-area {
            padding: 15px 20px;
            border-top: 1px solid rgba(0,0,0,0.06);
            display: flex;
            gap: 10px;
            align-items: center;
            background: #fff;
            flex-shrink: 0;
        }
        .ai-chat-input {
            flex: 1;
            border: 1.5px solid rgba(112,77,243,0.15);
            border-radius: 25px;
            padding: 10px 18px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            outline: none;
            transition: border-color 0.3s;
            color: #333;
            background: #f8f9ff;
        }
        .ai-chat-input:focus { border-color: var(--primary-light); }
        .ai-chat-send {
            width: 40px; height: 40px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            border: none;
            border-radius: 50%;
            color: #fff;
            cursor: pointer;
            font-size: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
            flex-shrink: 0;
        }
        .ai-chat-send:hover {
            transform: scale(1.1) rotate(10deg);
            box-shadow: 0 5px 15px rgba(112,77,243,0.4);
        }

        /* ----- SMART CONTACT FORM AI SUGGESTION ----- */
        .ai-suggest-btn {
            background: linear-gradient(135deg, rgba(112,77,243,0.1), rgba(69,36,197,0.1));
            border: 1.5px dashed rgba(112,77,243,0.4);
            color: var(--primary);
            padding: 12px 20px;
            border-radius: 10px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.3s;
            margin-bottom: 20px;
        }
        .ai-suggest-btn:hover {
            background: linear-gradient(135deg, rgba(112,77,243,0.2), rgba(69,36,197,0.2));
            border-style: solid;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(112,77,243,0.15);
        }
        .ai-suggest-btn i { animation: pulseGlow 2s infinite alternate; }
        .ai-suggestion-box {
            background: linear-gradient(135deg, rgba(112,77,243,0.05), rgba(69,36,197,0.05));
            border: 1px solid rgba(112,77,243,0.2);
            border-radius: 12px;
            padding: 18px;
            margin-bottom: 20px;
            display: none;
        }
        .ai-suggestion-box.show { display: block; animation: fadeIn 0.4s ease; }
        @keyframes fadeIn { from { opacity:0; transform:translateY(-10px); } to { opacity:1; transform:translateY(0); } }
        .ai-suggestion-item {
            padding: 10px 14px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 13px;
            color: var(--primary-dark);
            font-weight: 600;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 6px;
        }
        .ai-suggestion-item:last-child { margin-bottom: 0; }
        .ai-suggestion-item:hover {
            background: rgba(112,77,243,0.1);
            color: var(--primary);
            transform: translateX(5px);
        }
        .ai-suggestion-item i { color: var(--primary-light); font-size: 12px; }

        /* Mobile Base Styles (Hidden by default) */
        .mobile-toggle { display: none; }
        .mobile-only { display: none; }
        .nav-menu-header { display: none; }

        @media (max-width: 991px) {
            .navbar { padding: 15px 5%; background: rgba(255, 255, 255, 0.95); }
            .navbar.nav-scrolled { background: var(--primary); }
            .nav-btn { display: none; }
            .mobile-toggle { display: block !important; z-index: 20001; cursor: pointer; font-size: 24px; color: #0f172a; }
            .navbar.nav-scrolled .mobile-toggle { color: #fff; }
            .navbar.menu-open .mobile-toggle { color: #fff !important; }
            
            .nav-links {
                position: fixed; top: 0; right: -100%; width: 280px; height: 100vh;
                background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
                flex-direction: column; align-items: stretch; padding: 40px 25px; margin: 0;
                transition: 0.5s cubic-bezier(0.77, 0.2, 0.05, 1); box-shadow: -20px 0 50px rgba(0,0,0,0.5);
                z-index: 20000; display: flex !important; overflow-y: auto; gap: 0;
            }
            .nav-links.active { right: 0; }
            .nav-menu-header { display: flex !important; align-items: center; justify-content: space-between; width: 100% !important; margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid rgba(255,255,255,0.1); }
            .nav-menu-header img { height: 35px; background: #fff; padding: 5px 12px; border-radius: 6px; }
            .nav-links li { width: 100%; }
            .nav-links li a { font-size: 14px; display: block; padding: 12px 0 !important; color: rgba(255,255,255,0.7) !important; text-align: left; width: 100%; border-bottom: 1px solid rgba(255,255,255,0.05); }
            .nav-links li.active a { color: #fff !important; font-weight: 700; background: rgba(112, 77, 243, 0.1); }
            .mobile-only { display: block !important; }

            .hero { padding: 120px 5% 50px !important; text-align: center !important; min-height: auto !important; }
            .hero-content { flex-direction: column !important; gap: 20px !important; align-items: center !important; }
            .hero-text { padding: 0 !important; width: 100% !important; display: flex !important; flex-direction: column !important; align-items: center !important; }
            .hero-text h1 { font-size: 26px !important; line-height: 1.2 !important; margin: 0 auto 15px !important; }
            .hero-text p { font-size: 14px !important; margin: 0 auto 25px !important; }
            .hero-image { display: none !important; }
            
            .services-grid { grid-template-columns: 1fr !important; gap: 20px !important; }
            .service-card { padding: 35px 20px !important; }
            
            .about-section { text-align: center !important; flex-direction: column !important; padding: 60px 5% !important; }
            .about-text { width: 100% !important; }
            .about-img { width: 100% !important; margin-top: 30px; }
            
            .resp-text-col, .st-text-col { text-align: center !important; padding: 0 !important; }
            .st-features { align-items: center !important; }
            
            .flt-text { text-align: center !important; }
            .flt-mockups { height: 300px !important; }
            .flt-web-mockup { width: 100% !important; height: 180px !important; left: 0 !important; top: 10% !important; transform: none !important; animation: none !important; }
            .flt-mobile-mockup { width: 100px !important; height: 180px !important; right: 5% !important; top: 30% !important; transform: none !important; animation: none !important; }
            
            .gallery-grid { column-count: 2 !important; }
            .footer-grid { grid-template-columns: 1fr !important; gap: 40px !important; text-align: center !important; }
            
            .resp-text-col h2, .st-text-col h2, .flt-text h2, .ai-content h2, .amz-header h2 { font-size: 26px !important; }
            
            .m-text-huge { font-size: 32px !important; }
        }

        @media (max-width: 768px) {
            .section-title h2 { font-size: 30px; }
            .contact-container { flex-direction: column; }
            .contact-info, .contact-form { padding: 30px; }
            .footer-grid { grid-template-columns: 1fr; text-align: center; }
            .footer-col h4::after { left: 50%; transform: translateX(-50%); }
            .footer-logo { margin: 0 auto 25px; }
            .footer-bottom { flex-direction: column; gap: 20px; text-align: center; }
            
            .ai-stats-header h2 { font-size: 28px; }
            .ai-stat-number { font-size: 36px; }
            .ai-ticker-wrap { flex-direction: column; text-align: center; padding: 20px; }
            
            .process-line { left: 20px; }
            .process-item, .process-item:nth-child(even) { flex-direction: row; align-items: flex-start; gap: 20px; }
            .process-content, .process-empty { width: calc(100% - 70px); text-align: left !important; }
            .process-empty { display: none; }
            .process-number { position: static; transform: none; width: 50px; height: 50px; font-size: 18px; flex-shrink: 0; }

            .ai-chat-popup { width: calc(100vw - 40px); right: 20px; bottom: 100px; height: calc(100vh - 120px); max-height: none; }
            .ai-chat-btn { right: 20px; bottom: 20px; width: 55px; height: 55px; }
        }

        @media (max-width: 480px) {
            .hero-text h1 { font-size: 28px; }
            .about-text h2, .amz-header h2 { font-size: 28px; }
            .gallery-grid { column-count: 1; }
            .mega-row h3 { font-size: 20px; }
            .m-text-huge { font-size: 32px; }
        }
        /* ----- PROFESSIONAL COOKIE CONSENT BAR ----- */
        .cookie-banner {
            position: fixed;
            bottom: -100%;
            left: 0;
            width: 100%;
            background: #ffffff;
            border-top: 1px solid #eef2ff;
            padding: 20px 5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
            z-index: 10000;
            box-shadow: 0 -10px 40px rgba(0, 0, 0, 0.05);
            transition: all 0.6s cubic-bezier(0.19, 1, 0.22, 1);
        }
        .cookie-banner.show {
            bottom: 0;
        }
        .cookie-content {
            display: flex;
            align-items: center;
            gap: 20px;
            flex: 1;
        }
        .cookie-content i {
            font-size: 24px;
            color: var(--primary);
            background: rgba(35, 43, 102, 0.05);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        .cookie-text h4 {
            color: var(--text-dark);
            font-size: 16px;
            margin-bottom: 4px;
            font-weight: 700;
        }
        .cookie-text p {
            color: var(--text-body);
            font-size: 13px;
            line-height: 1.5;
            margin: 0;
        }
        .cookie-btns {
            display: flex;
            gap: 12px;
            flex-shrink: 0;
        }
        .btn-cookie {
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1.5px solid transparent;
            text-transform: uppercase;
            letter-spacing: 1px;
            white-space: nowrap;
        }
        .btn-allow {
            background: var(--primary);
            color: #fff;
        }
        .btn-allow:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(35, 43, 102, 0.2);
        }
        .btn-deny {
            background: transparent;
            border-color: #e2e8f0;
            color: var(--text-body);
        }
        .btn-deny:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
            color: var(--text-dark);
        }

        @media (max-width: 768px) {
            .cookie-banner {
                flex-direction: column;
                text-align: center;
                gap: 20px;
                padding: 25px 5%;
            }
            .cookie-content {
                flex-direction: column;
                gap: 15px;
            }
            .cookie-btns {
                width: 100%;
            }
            .btn-cookie {
                flex: 1;
            }
        }

        @media (max-width: 768px) {
            .cookie-banner {
                flex-direction: column;
                text-align: center;
                padding: 35px 25px;
                bottom: -100%;
                left: 5%;
                right: 5%;
                transform: none;
                width: 90%;
            }
            .cookie-banner.show {
                bottom: 20px;
            }
            .cookie-content h4, .cookie-content p {
                text-align: center;
                justify-content: center;
            }
            .cookie-btns {
                width: 100%;
                flex-direction: column;
            }
            .btn-cookie {
                width: 100%;
            }
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

        /* ===== LIVE EXPERIENCE: SHARED ===== */
        .le-label {
            font-size: 12px; font-weight: 800; letter-spacing: 3px;
            color: var(--accent); text-transform: uppercase; margin-bottom: 14px;
        }
        .le-sub {
            font-size: 16px; color: var(--text-body); max-width: 600px;
            margin: 10px auto 0; text-align: center;
        }

        /* ===== MULTI-PLATFORM DEMO SECTION ===== */
        .live-demo-section {
            padding: 100px 5% 80px;
            background: #f7f9fc;
        }
        .live-demo-inner { max-width: 1100px; margin: 0 auto; }
        .live-demo-header { text-align: center; margin-bottom: 60px; }
        .live-demo-header h2 { font-size: 42px; color: var(--text-dark); }

        /* Tablet Device */
        .tablet-mockup-wrap { display: flex; justify-content: center; }
        .tablet-device {
            width: 100%; max-width: 760px;
            background: #1a1a2e;
            border-radius: 24px;
            padding: 18px 18px 30px;
            box-shadow: 0 40px 100px rgba(0,0,0,0.25);
            border: 2px solid #333;
            position: relative;
        }
        .tablet-top-bar {
            display: flex; justify-content: center; align-items: center;
            height: 28px; margin-bottom: 12px;
        }
        .tablet-cam {
            width: 8px; height: 8px; background: #444;
            border-radius: 50%;
        }
        .tablet-screen {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            min-height: 380px;
            display: flex; flex-direction: column;
        }
        .tablet-home-btn {
            width: 36px; height: 36px; background: #333; border-radius: 50%;
            margin: 12px auto 0; border: 2px solid #444;
        }
        /* Tablet App UI */
        .tab-app-header {
            display: flex; align-items: center; gap: 20px;
            padding: 12px 20px; background: #232b66; color: #fff;
        }
        .tab-logo {
            background: var(--accent); color: #fff; font-size: 13px;
            font-weight: 800; padding: 6px 10px; border-radius: 8px;
        }
        .tab-nav { display: flex; gap: 20px; }
        .tab-nav span { font-size: 12px; color: rgba(255,255,255,0.6); cursor: pointer; }
        .tab-nav-active { color: #fff !important; border-bottom: 2px solid var(--accent); padding-bottom: 2px; }
        .tab-app-body { display: flex; flex: 1; gap: 0; }
        .tab-left-panel {
            width: 45%; padding: 20px; border-right: 1px solid #f0f0f0;
            background: #fff;
        }
        .tab-right-panel { flex: 1; padding: 20px; background: #fafafa; }
        .tab-section-title {
            font-size: 13px; font-weight: 700; color: var(--text-dark);
            margin-bottom: 12px;
        }
        .tab-security-item, .tab-analytics-row {
            display: flex; align-items: center; gap: 12px;
            padding: 10px; background: #f7f9fc; border-radius: 10px;
        }
        .tab-s-icon {
            width: 36px; height: 36px; border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
            color: #fff; font-size: 14px; flex-shrink: 0;
        }
        .tab-a-icon {
            width: 36px; height: 36px; background: #232b66; border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
            color: #fff; font-size: 14px; flex-shrink: 0;
        }
        .tab-s-name { font-size: 12px; font-weight: 700; color: var(--text-dark); }
        .tab-s-desc { font-size: 10px; color: #9ca3af; margin-top: 2px; }
        .tab-testimonial-grid { display: flex; flex-direction: column; gap: 12px; }
        .tab-testimonial {
            background: #fff; border-radius: 10px; padding: 14px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06);
        }
        .tab-avatar {
            width: 32px; height: 32px; border-radius: 50%; color: #fff;
            font-size: 11px; font-weight: 700; display: flex;
            align-items: center; justify-content: center; margin-bottom: 8px;
        }
        .tab-quote { font-size: 11px; color: #6b7280; font-style: italic; margin-bottom: 6px; }
        .tab-testimonial strong { font-size: 11px; color: var(--text-dark); }
        .tab-app-footer {
            background: #232b66; color: rgba(255,255,255,0.5); font-size: 10px;
            text-align: center; padding: 8px;
        }

        /* ===== MODERN APP INTERFACES SECTION ===== */
        .modern-app-section {
            padding: 100px 5% 80px;
            background: linear-gradient(160deg, #f0f4ff 0%, #f7f9fc 100%);
        }
        .mod-app-header { text-align: center; margin-bottom: 60px; }
        .mod-app-header h2 { font-size: 42px; color: var(--text-dark); }
        .mod-phones-wrap {
            display: flex; justify-content: center; align-items: flex-end;
            gap: 40px; flex-wrap: wrap;
        }
        .mod-phone { display: flex; justify-content: center; }
        .mod-phone-front { margin-bottom: -30px; }
        .mod-phone-device {
            width: 280px;
            background: #1a1a2e;
            border-radius: 36px;
            padding: 18px 14px;
            box-shadow: 0 40px 80px rgba(0,0,0,0.2);
            border: 2px solid #333;
            position: relative;
        }
        .mod-phone-notch {
            width: 70px; height: 20px; background: #1a1a2e;
            border-radius: 0 0 14px 14px; margin: 0 auto 8px;
        }
        .mod-phone-screen {
            background: #fff; border-radius: 24px; overflow: hidden;
            min-height: 480px;
        }
        .mod-feature-grid {
            display: grid; grid-template-columns: 1fr 1fr; gap: 10px;
        }
        .mod-feat-card {
            background: #f7f9fc; border-radius: 12px; padding: 14px 10px;
            display: flex; flex-direction: column; align-items: center; gap: 8px;
            font-size: 10px; font-weight: 600; color: var(--text-dark);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .mod-feat-card:hover { transform: translateY(-3px); box-shadow: 0 6px 20px rgba(0,0,0,0.1); }
        .mod-health-bar {
            width: 100%; height: 8px; background: #e5e7eb; border-radius: 10px; overflow: hidden;
        }
        .mod-health-fill { height: 100%; border-radius: 10px; }

        @media (max-width: 768px) {
            .tab-app-body { flex-direction: column; }
            .tab-left-panel { width: 100%; border-right: none; border-bottom: 1px solid #f0f0f0; }
            .mod-phone-device { width: 260px; }
            .live-demo-header h2, .mod-app-header h2 { font-size: 30px; }
            .mod-phones-wrap { gap: 40px; }
        }
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
                <li class="active"><a href="#home">Home</a></li>
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
                <li class="mobile-only" style="margin-top: 25px; width: 100%;">

                </li>
            </ul>
            <div class="nav-btn">

            </div>
        </nav>

        <!-- Hero Section -->
        <section id="home" class="hero">

            <div class="hero-shapes">
                <div class="px-accent shape shape-1" data-speed="0.2"></div>
                <div class="px-accent shape shape-2" data-speed="0.1"></div>
                <div class="px-accent shape shape-3" data-speed="0.3"></div>
            </div>
            
            <div class="hero-content">
                <div class="hero-text">
                    <p style="text-transform:uppercase; font-size:14px; font-weight:600; letter-spacing:2px; margin-bottom:15px; color:var(--accent); animation: heroFadeSlide 0.8s 0.1s both;">IT Solutions and Services Company</p>
                    <h1 style="animation: heroFadeSlide 0.9s 0.3s both;">
                        Innovative Products &amp; <br />
                        IT Solutions for Your Business
                    </h1>
                    <p style="animation: heroFadeSlide 1s 0.5s both;">Software developer specializing in developing web and mobile application  </p>
                    <div class="hero-btns" style="animation: heroFadeSlide 1s 0.7s both;">
                        <a href="#services" class="btn-theme btn-red" style="padding: 15px 35px;">Explore Services</a>
                    </div>
                     <style>
                        @keyframes heroFadeSlide {
                            from { opacity: 0; transform: translateY(35px); }
                            to   { opacity: 1; transform: translateY(0); }
                        }
                        .btn-red {
                            background: #ee2326 !important;
                            border: none !important;
                            box-shadow: 0 10px 25px rgba(238, 35, 38, 0.4);
                        }
                        .btn-red:hover {
                            background: #d11e21 !important;
                            box-shadow: 0 15px 30px rgba(238, 35, 38, 0.5) !important;
                            transform: translateY(-3px);
                        }
                        .reveal-up { opacity: 0; transform: translateY(40px); transition: all 1s cubic-bezier(0.19, 1, 0.22, 1); }
                        .reveal-left { opacity: 0; transform: translateX(-40px); transition: all 1s cubic-bezier(0.19, 1, 0.22, 1); }
                        .reveal-right { opacity: 0; transform: translateX(40px); transition: all 1s cubic-bezier(0.19, 1, 0.22, 1); }
                        .reveal-visible { opacity: 1 !important; transform: translate(0,0) !important; }

        /* Restored Section Styles */
        .stats-section { padding: 80px 5%; background: #0f172a; color: #fff; position: relative; overflow: hidden; }
        .stats-grid { max-width: 1200px; margin: 0 auto; display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; position: relative; z-index: 2; }
        .stat-card { text-align: center; padding: 40px 20px; border-radius: 20px; background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.05); transition: 0.4s; }
        .stat-card:hover { background: rgba(255,255,255,0.06); transform: translateY(-10px); border-color: var(--accent); }
        .stat-val { font-size: 52px; font-weight: 900; color: #fff; margin-bottom: 5px; display: block; }
        .stat-label { font-size: 13px; text-transform: uppercase; letter-spacing: 2px; color: rgba(255,255,255,0.5); font-weight: 700; }

        .super-service-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 25px; max-width: 1200px; margin: 50px auto; }
        .super-service-card { 
            background: #fff; padding: 40px; border-radius: 24px; box-shadow: 0 15px 40px rgba(0,0,0,0.05);
            transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1); cursor: pointer; border: 1px solid rgba(0,0,0,0.03);
            position: relative; overflow: hidden;
        }
        .super-service-card:hover { transform: translateY(-15px) scale(1.02); box-shadow: 0 30px 70px rgba(35, 43, 102, 0.15); border-color: var(--accent); }
        .super-service-card i { font-size: 38px; color: var(--primary); margin-bottom: 25px; transition: 0.4s; }
        .super-service-card:hover i { color: var(--accent); transform: scale(1.1) rotate(-5deg); }
        .super-service-card h3 { font-size: 22px; color: #0f172a; margin-bottom: 15px; font-weight: 800; }

        .three-container {
            position: relative; width: 100%; height: 800px;
            background: radial-gradient(circle at center, #101830 0%, #000 100%);
            overflow: hidden; display: flex; flex-direction: column;
            align-items: center; justify-content: center; text-align: center; padding: 0 5%;
        }
        @media (max-width: 768px) {
            .three-container { height: 600px; }
            .three-content h2 { font-size: 32px !important; line-height: 1.2; }
            .three-content p { font-size: 14px !important; }
        }
        .three-canvas { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; }
        .three-content { z-index: 2; max-width: 800px; padding-top: 50px; }
        .three-content h2 { font-size: 58px; font-weight: 900; color: #fff; margin-bottom: 20px; text-transform: uppercase; letter-spacing: -2px; }
        .three-content h2 span { color: var(--accent); }
        .three-content p { font-size: 20px; color: rgba(255,255,255,0.7); line-height: 1.6; max-width: 600px; margin: 0 auto; }
        .three-glow {
            position: absolute; width: 600px; height: 600px;
            background: radial-gradient(circle, rgba(238,35,38,0.15) 0%, transparent 70%);
            filter: blur(50px); z-index: 0; border-radius: 50%; pointer-events: none;
        }



        /* ===== NEON DATA PIPELINE PROCESS ===== */
        .workflow-3d {
            padding: 120px 0;
            background: #070b19; /* Deep tech dark blue */
            overflow: hidden;
            text-align: center;
        }
        .wf-header h2 { font-size: 50px; font-weight: 900; color: #fff; text-transform: uppercase; margin-bottom: 20px;}
        .wf-header span { color: #00e5ff; text-shadow: 0 0 20px rgba(0,229,255,0.4); } 
        .wf-header p { color: rgba(255,255,255,0.7); font-size: 18px; margin-bottom: 80px; }
        
        @media (max-width: 768px) {
            .wf-header h2 { font-size: 32px !important; }
            .wf-header p { font-size: 15px !important; margin-bottom: 40px !important; }
            .workflow-3d { padding: 80px 5% !important; }
        }
        
        .pipeline-container {
            position: relative;
            width: 100%;
            height: 950px;
            display: flex;
            justify-content: center;
            align-items: center;
            perspective: 2500px;
        }

        .pipeline-scene {
            position: relative;
            width: 1000px;
            height: 800px;
            transform-style: preserve-3d;
            /* The isometric viewing angle */
            transform: rotateX(60deg) rotateZ(-45deg);
            /* Slow gentle holographic float */
            animation: isometricFloat 6s ease-in-out infinite alternate;
        }

        @media (max-width: 991px) {
            .pipeline-container { height: auto !important; padding: 20px 0; }
            .pipeline-scene { 
                width: 100% !important; 
                height: auto !important; 
                transform: none !important; 
                animation: none !important; 
                display: flex; 
                flex-direction: column; 
                gap: 150px; 
                padding: 100px 0;
            }
            .pipeline-grid, .data-pipe { display: none !important; } /* Hide 3D lines on mobile for clarity */
            .pipe-node { 
                position: relative !important; 
                top: auto !important; 
                left: auto !important; 
                right: auto !important; 
                bottom: auto !important; 
                margin: 0 auto !important;
                transform: none !important;
            }
            .node-content { 
                transform: none !important; 
                top: -60px !important; 
                width: 280px !important;
            }
        }
        @keyframes isometricFloat {
            0% { transform: rotateX(60deg) rotateZ(-45deg) translateZ(0px); }
            100% { transform: rotateX(60deg) rotateZ(-45deg) translateZ(30px); }
        }

        /* The Main Motherboard Grid */
        .pipeline-grid {
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: 
                linear-gradient(rgba(0, 229, 255, 0.05) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0, 229, 255, 0.05) 1px, transparent 1px);
            background-size: 50px 50px;
            border: 2px solid rgba(0, 229, 255, 0.1);
            transform: translateZ(-50px);
            box-shadow: inset 0 0 100px rgba(0,0,0,0.9);
        }

        /* 3D Core Node (Servers) */
        .pipe-node {
            position: absolute;
            transform-style: preserve-3d;
            background: rgba(10, 15, 30, 0.95);
            border: 2px solid var(--node-color, #fff);
            box-shadow: 
                0 0 30px rgba(0,0,0,0.8),
                inset 0 0 20px var(--node-color, #fff);
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        /* Top glowing aura */
        .pipe-node::before {
            content: '';
            position: absolute;
            top: 100%; left: -2px; width: calc(100% + 4px); height: 40px;
            background: linear-gradient(to bottom, var(--node-color), rgba(10,15,30,0.8));
            opacity: 0.6;
            transform-origin: top;
            transform: rotateX(-90deg);
            border-radius: 0 0 12px 12px;
        }
        .pipe-node::after {
            content: '';
            position: absolute;
            top: -2px; right: 100%; width: 40px; height: calc(100% + 4px);
            background: linear-gradient(to left, var(--node-color), rgba(10,15,30,0.8));
            opacity: 0.4;
            transform-origin: right;
            transform: rotateY(-90deg);
            border-radius: 12px 0 0 12px;
        }

        /* Glowing Data Pipes */
        .data-pipe {
            position: absolute;
            background: rgba(0,0,0,0.5);
            border: 1px solid var(--pipe-color, #fff);
            box-shadow: 0 0 15px var(--pipe-color, #fff);
            transform-style: preserve-3d;
            overflow: hidden;
            border-radius: 20px;
            z-index: -1;
        }
        .data-stream {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: repeating-linear-gradient(
                90deg,
                transparent, transparent 15px,
                var(--pipe-color, #fff) 15px, var(--pipe-color, #fff) 30px
            );
            background-size: 60px 100%;
            opacity: 1;
            filter: drop-shadow(0 0 8px var(--pipe-color, #fff));
        }
        .data-pipe.pipe-vt .data-stream {
            background: repeating-linear-gradient(
                0deg,
                transparent, transparent 15px,
                var(--pipe-color, #fff) 15px, var(--pipe-color, #fff) 30px
            );
            background-size: 100% 60px;
        }

        .data-pipe.flow-right .data-stream {
            animation: flowBgRev 1s linear infinite;
        }
        .data-pipe.flow-down .data-stream {
            animation: flowBgVtRev 1s linear infinite;
        }
        .data-pipe.flow-up .data-stream {
            animation: flowBgVt 1s linear infinite;
        }
        
        @keyframes flowBg { to { background-position: -60px 0; } } /* Left */
        @keyframes flowBgRev { to { background-position: 60px 0; } } /* Right */
        @keyframes flowBgVt { to { background-position: 0 60px; } } /* Down visually */
        @keyframes flowBgVtRev { to { background-position: 0 -60px; } } /* Up visually */

        /* Elaborate Holographic Content Panels */
        .node-content {
            position: absolute;
            top: -90px; left: 50%;
            transform: translateX(-50%) translateZ(40px) rotateZ(45deg) rotateX(-60deg);
            transform-origin: bottom center;
            width: 220px;
            text-align: center;
            pointer-events: none;
            z-index: 10;
        }
        .hologram-panel {
            background: rgba(10, 15, 30, 0.9);
            border: 1px solid var(--node-color);
            box-shadow: 0 10px 20px rgba(0,0,0,0.8), inset 0 0 15px rgba(255,255,255,0.05);
            border-radius: 12px;
            padding: 15px;
            backdrop-filter: blur(10px);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 5px;
        }
        .hologram-panel h4 { font-size: 16px; font-weight: 900; color: var(--node-color); text-transform: uppercase; margin: 0; text-shadow: 0 0 10px var(--node-color); }
        .hologram-panel p { font-size: 11px; color: #cbd5e1; line-height: 1.4; margin: 0; }
        .holo-icon {
            font-size: 20px; color: #fff; text-shadow: 0 0 15px var(--node-color);
            background: rgba(255,255,255,0.05); width: 45px; height: 45px;
            display: flex; justify-content: center; align-items: center; border-radius: 50%; margin-bottom: 5px;
        }

        /* Coordinate Mapping (Isometric grid 1000x600) */
        
        /* N1: Discovery */
        #pn1 { top: 100px; left: 100px; width: 120px; height: 120px; --node-color: #ff2a2a; }
        /* P1: N1 to N2 (+Y down-left) */
        #pp1 { top: 220px; left: 150px; width: 20px; height: 180px; --pipe-color: #ff2a2a; }
        
        /* N2: Design */
        #pn2 { top: 400px; left: 100px; width: 120px; height: 120px; --node-color: #a855f7; }
        /* P2: N2 to N3 (+X down-right) */
        #pp2 { top: 450px; left: 220px; width: 230px; height: 20px; --pipe-color: #00e5ff; } 
        
        /* N3: Engineering Hub */
        #pn3 { top: 380px; left: 450px; width: 160px; height: 160px; --node-color: #00e5ff; }
        #pn3 .node-content { transform: translateX(-50%) translateZ(60px) rotateZ(45deg) rotateX(-60deg) scale(1.15); top: -110px; } 
        /* P3: N3 to N4 (+X down-right) */
        #pp3 { top: 450px; left: 610px; width: 190px; height: 20px; --pipe-color: #f59e0b; } 
        
        /* N4: Testing */
        #pn4 { top: 400px; left: 800px; width: 120px; height: 120px; --node-color: #f59e0b; }
        /* P4: N4 to N5 (-Y up-right) */
        #pp4 { top: 220px; left: 850px; width: 20px; height: 180px; --pipe-color: #22c55e; }
        
        /* N5: Deployment */
        #pn5 { top: 100px; left: 800px; width: 120px; height: 120px; --node-color: #22c55e; }

        @media (max-width: 991px) {
            .pipeline-container { perspective: none; height: auto; padding: 50px 0; }
            .pipeline-scene { width: 100%; height: auto; transform: none; display: flex; flex-direction: column; align-items: center; gap: 40px; animation: none; }
            .pipeline-grid, .data-pipe { display: none; }
            .pipe-node { position: relative; top: auto !important; left: auto !important; width: 90% !important; height: auto !important; max-width: 350px; transform: none; border-radius: 16px; padding: 20px 0; border: 2px solid var(--node-color); }
            .pipe-node::before, .pipe-node::after { display: none; }
            .node-content { position: relative; top: auto; left: auto; transform: none !important; width: 100%; }
            .hologram-panel { box-shadow: none; border: none; background: transparent; padding: 0 20px; }
        }

                     </style>
                </div>
                <div class="hero-image">
                    <!-- Rich Dashboard Mockup -->
                    <div class="template-box floating" style="background: rgba(15,18,50,0.85); border: 1px solid rgba(255,255,255,0.15); border-radius: 22px; backdrop-filter: blur(20px); width: 100%; max-width: 430px; overflow: hidden; display: flex; flex-direction: column; box-shadow: 0 40px 100px rgba(0,0,0,0.5), 0 0 0 1px rgba(255,255,255,0.05);">

                        <!-- Browser Top Bar -->
                        <div style="background: rgba(255,255,255,0.06); padding: 8px 18px; display: flex; align-items: center; gap: 10px; border-bottom: 1px solid rgba(255,255,255,0.08);">
                            <div style="display:flex; gap:6px;">
                                <div style="width:10px; height:10px; background:#ff5f57; border-radius:50%;"></div>
                                <div style="width:10px; height:10px; background:#ffbc2e; border-radius:50%;"></div>
                                <div style="width:10px; height:10px; background:#28c940; border-radius:50%;"></div>
                            </div>
                            <div style="background: rgba(255,255,255,0.08); height: 16px; flex: 1; border-radius: 8px; display:flex; align-items:center; padding: 0 10px;">
                                <span style="font-size:9px; color:rgba(255,255,255,0.4); letter-spacing:0.5px;">vivifysoft.in/dashboard</span>
                            </div>
                            <div style="width: 24px; height: 24px; border-radius: 50%; background: rgba(238,35,38,0.3); display:flex; align-items:center; justify-content:center;">
                                <i class="fas fa-bell" style="font-size:9px; color:#ee2326;"></i>
                            </div>
                        </div>

                        <!-- Dashboard Body -->
                        <div style="padding: 15px; flex: 1; display: flex; flex-direction: column; gap: 12px;">

                            <!-- Header Row -->
                            <div style="display:flex; justify-content:space-between; align-items:center;">
                                <div>
                                    <div style="font-size:11px; color:rgba(255,255,255,0.45); letter-spacing:1px; text-transform:uppercase; margin-bottom:3px;">Good Morning,</div>
                                    <div style="font-size:15px; font-weight:700; color:#fff;">Vivify Dashboard</div>
                                </div>
                                <div style="background: rgba(238,35,38,0.15); border: 1px solid rgba(238,35,38,0.3); border-radius: 20px; padding: 5px 12px;">
                                    <span style="font-size:10px; font-weight:700; color:#ee2326;">● LIVE</span>
                                </div>
                            </div>

                            <!-- KPI Stats Row -->
                            <div style="display:grid; grid-template-columns: 1fr 1fr 1fr; gap:10px;">
                                <div style="background:rgba(238,35,38,0.12); border:1px solid rgba(238,35,38,0.2); border-radius:14px; padding:10px 8px; text-align:center;">
                                    <div style="font-size:18px; font-weight:800; color:#ee2326;">98<span style="font-size:11px;">%</span></div>
                                    <div style="font-size:9px; color:rgba(255,255,255,0.5); margin-top:3px; letter-spacing:0.5px;">Uptime</div>
                                </div>
                                <div style="background:rgba(99,102,241,0.12); border:1px solid rgba(99,102,241,0.2); border-radius:14px; padding:10px 8px; text-align:center;">
                                    <div style="font-size:18px; font-weight:800; color:#818cf8;">52</div>
                                    <div style="font-size:9px; color:rgba(255,255,255,0.5); margin-top:3px; letter-spacing:0.5px;">Projects</div>
                                </div>
                                <div style="background:rgba(34,197,94,0.12); border:1px solid rgba(34,197,94,0.2); border-radius:14px; padding:10px 8px; text-align:center;">
                                    <div style="font-size:18px; font-weight:800; color:#4ade80;">4.9<span style="font-size:11px;">★</span></div>
                                    <div style="font-size:9px; color:rgba(255,255,255,0.5); margin-top:3px; letter-spacing:0.5px;">Rating</div>
                                </div>
                            </div>

                            <!-- Project Health -->
                            <div style="background:rgba(255,255,255,0.04); border:1px solid rgba(255,255,255,0.08); border-radius:14px; padding:10px;">
                                <div style="font-size:10px; font-weight:700; color:rgba(255,255,255,0.6); text-transform:uppercase; letter-spacing:1px; margin-bottom:12px;">Project Health</div>
                                <!-- Project 1 -->
                                <div style="margin-bottom:8px;">
                                    <div style="display:flex; justify-content:space-between; margin-bottom:5px;">
                                        <span style="font-size:10px; color:rgba(255,255,255,0.75); font-weight:600;">HRMS Portal</span>
                                        <span style="font-size:10px; color:#4ade80; font-weight:700;">92%</span>
                                    </div>
                                    <div style="height:5px; background:rgba(255,255,255,0.08); border-radius:3px; overflow:hidden;">
                                        <div style="width:92%; height:100%; background:linear-gradient(90deg,#4ade80,#22c55e); border-radius:3px;"></div>
                                    </div>
                                </div>
                                <!-- Project 2 -->
                                <div style="margin-bottom:0px;">
                                    <div style="display:flex; justify-content:space-between; margin-bottom:5px;">
                                        <span style="font-size:10px; color:rgba(255,255,255,0.75); font-weight:600;">Mobile App</span>
                                        <span style="font-size:10px; color:#818cf8; font-weight:700;">78%</span>
                                    </div>
                                    <div style="height:5px; background:rgba(255,255,255,0.08); border-radius:3px; overflow:hidden;">
                                        <div style="width:78%; height:100%; background:linear-gradient(90deg,#818cf8,#6366f1); border-radius:3px;"></div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- SVG Wave Bottom -->
            <div class="wave-bottom">
                <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
                    <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V120H0V95.8C59.71,118.08,130.83,119.2,192.36,108.41Z" class="shape-fill"></path>
                </svg>
            </div>
        </section>

        <!-- About Us -->
        <section id="about" class="about-section">
            <div class="about-img reveal-left">
                <div class="about-img-inner">
                    <img src="assets/img/about-image 3.png" alt="About Vivify Soft" style="width: 100%; height: 100%; object-fit: cover; border-radius: 20px;" class="floating">
                </div>
            </div>
            <div class="about-text reveal-right" style="transition-delay: 0.2s;">
                <%-- <h4>Welcome to Vivify Soft</h4> --%>
                <h2>Who We Are</h2>
                <p>Founded in 2024 and based in Chennai, India. Vivify Soft is a trusted resource for web/mobile-based solutions.</p>
                <p>Our products are used by multiple companies in various regions. We have a strong reputation in the Safety and Retail industry. Our products help increase customer revenue to grow faster. Our skilled team delivers the application on time with quality.</p>
                <br>
                <a href="AboutUs.aspx" class="btn-theme">Know More About Us</a>
            </div>
        </section>

        <!-- Why Choose Us? -->
        <section id="whyus" class="why-us-section">
            <div class="section-title reveal-up">
                <h2>Why Choose Us?</h2>
                <p>We don't just write code; we build strategic partnerships that drive measurable business growth.</p>
            </div>
            <div class="why-us-grid">
                <div class="why-card reveal-scale">
                    <div class="wc-icon"><i class="fas fa-bolt"></i></div>
                    <h3>Fast Performance</h3>
                    <p>Our solutions are optimized for lightning-fast speeds, ensuring high conversion rates and seamless user experiences.</p>
                </div>
                <div class="why-card reveal-scale" style="transition-delay: 0.1s;">
                    <div class="wc-icon"><i class="fas fa-shield-alt"></i></div>
                    <h3>Secure</h3>
                     <p>We implement robust, top-tier security protocols to keep your data, applications, and users safe from modern threats.</p>
                </div>
                <div class="why-card reveal-scale" style="transition-delay: 0.2s;">
                    <div class="wc-icon"><i class="fas fa-headset"></i></div>
                    <h3>Dedicated Support</h3>
                    <p>We offer round-the-clock maintenance and proactive support to ensure your platforms run flawlessly at all times.</p>
                </div>
              
            </div>
        </section>
        
        
        
        <!-- Technology Stack Marquee -->
        <section class="tech-stack">
            <div class="marquee-wrapper">
                <div class="marquee-track">
                    <div class="tech-item"><i class="fab fa-react"></i> React</div>
                    <div class="tech-item"><i class="fab fa-html5"></i> HTML5</div>
                    <div class="tech-item"><i class="fab fa-css3-alt"></i> CSS3</div>
                    <div class="tech-item"><i class="fab fa-js"></i> JavaScript</div>
                    <div class="tech-item"><i class="fas fa-globe"></i> .NET</div>
                    <div class="tech-item"><i class="fas fa-database"></i> SQL</div>
                    <div class="tech-item"><i class="fab fa-git-alt"></i> Git</div>
                    <div class="tech-item"><i class="fab fa-jira"></i> Jira</div>
                </div>
                <div class="marquee-track" aria-hidden="true">
                    <div class="tech-item"><i class="fab fa-react"></i> React</div>
                    <div class="tech-item"><i class="fab fa-html5"></i> HTML5</div>
                    <div class="tech-item"><i class="fab fa-css3-alt"></i> CSS3</div>
                    <div class="tech-item"><i class="fab fa-js"></i> JavaScript</div>
                    <div class="tech-item"><i class="fas fa-globe" style="color: #512bd4;"></i> .NET</div>
                    <div class="tech-item"><i class="fas fa-database"></i> SQL</div>
                    <div class="tech-item"><i class="fab fa-git-alt"></i> Git</div>
                    <div class="tech-item"><i class="fab fa-jira" style="color: #0052cc;"></i> Jira</div>
                </div>
            </div>
        </section>

        <!-- Amazing Features -->
        <section id="features" class="amazing-features">
            <div class="amz-container">
                <!-- Left: Floating Mobile Mockup -->
                <div class="amz-left reveal-left">
                    <div class="amz-float-img-wrap">
                        <img src="assets/img/amazing sec.jpg" alt="Amazing Features" class="amz-float-img floating">
                    </div>
                </div>

                <!-- Right: Content & Grid -->
                <div class="amz-right reveal-right">
                    <div class="amz-header reveal-up script-reveal">
                        <h2>Amazing Features</h2>
                        <div class="amz-line"></div>
                        <p>We deliver feature-rich, dynamic environments using scalable infrastructure to boost engagement, reduce latency, and ensure continuous availability.</p>
                    </div>

                    <div class="amz-grid">
                        <div class="amz-card reveal-up script-reveal" style="transition-delay: 0.1s;">
                            <div class="amz-icon"><i class="fas fa-pen-ruler"></i></div>
                            <h3>Futuristic Aesthetics</h3>
                            <p>Our design philosophy merges cutting-edge visual concepts with functional, intuitive UX, ensuring every interaction feels premium and forward-thinking.</p>
                        </div>
                        <div class="amz-card reveal-up script-reveal" style="transition-delay: 0.2s;">
                            <div class="amz-icon"><i class="fas fa-bullseye"></i></div>
                            <h3>Scalable Frameworks</h3>
                            <p>Start small or build huge. Our codebases utilize sophisticated, modular architectures designed to seamlessly scale as your business complexity grows.</p>
                        </div>
                 
                    </div>
                </div>
            </div>
        </section>

        <!-- Fully Responsive & Retina Ready -->
        <section class="responsive-section">
            <div class="resp-img-col reveal-left">
                <div class="resp-img-backdrop"></div>
                <div class="resp-img-dots"></div>
                <!-- Path points to your mobile temp1 inside assets/img -->
                <img src="assets/img/mobile temp1.png" alt="Responsive Mobile Screens" class="resp-img floating">
            </div>
            <div class="resp-text-col reveal-right" style="transition-delay: 0.2s;">
                <h2>Fully Responsive</h2>
                <div class="amz-line" style="margin-bottom: 25px;"></div>
                <p>Application is fully responsive. Whether you are browsing from mobile, tablet, desktop or laptop, Application will be fit all screen sizes.</p>
            </div>
        </section>
        
        <!-- Save Your Time & See How It works any platform -->
        <section class="save-time-section">
            <div class="st-text-col reveal-up script-reveal">
                <h2>Save Your Time & <br> See How It Works on Any Platform</h2>
                <div class="amz-line" style="margin-left: 0; margin-bottom: 25px;"></div>
                <p>We build streamlined systems that eliminate manual redundancies. Accelerate your deployment and management times across both mobile and desktop environments effortlessly.</p>
                <p>Gain uncompromised access to powerful analytics and administration panels that adapt to the device you are using, securing absolute flexibility for your team.</p>
                
                <div class="st-features">
                    <div class="st-feature-item">
                        <div class="st-icon-box"><i class="fas fa-clock"></i></div>
                        <span>Automated Workflows & Synchronization</span>
                    </div>
                    <div class="st-feature-item">
                        <div class="st-icon-box"><i class="fas fa-layer-group"></i></div>
                        <span>Cross-Platform Synchronization</span>
                    </div>
                </div>
                <a href="#services" class="btn-theme" style="margin-top: 30px;">Discover Capabilities</a>
            </div>
            
            <div class="st-img-col reveal-up script-reveal" style="transition-delay: 0.2s;">
                <div class="st-img-backdrop"></div>
                <!-- Path points to the requested image -->
                <img src="assets/img/save time sec.png" alt="Cross Platform Dashboard UI" class="st-img">
            </div>
        </section>
        
        <!-- Floating Templates Section -->
        <section class="floating-templates-section">
            <div class="flt-text reveal-up script-reveal">
                <h2>Cross-Platform Templates <br> & Seamless UI Integration</h2>
                <div class="amz-line" style="margin-left: 0; margin-bottom: 25px; background: rgba(255,255,255,0.4);"></div>
                <p>We craft breathtaking templates for both web and mobile environments. Our designs guarantee pixel-perfect resolution, modular components, and immediate deployment capabilities across platforms.</p>
                <div style="display: flex; gap: 20px; align-items: center; margin-top: 20px;">
                    <div style="display: flex; align-items: center; gap: 10px;"><i class="fas fa-check-circle" style="color: var(--accent);"></i> <span>Web Templates</span></div>
                    <div style="display: flex; align-items: center; gap: 10px;"><i class="fas fa-check-circle" style="color: var(--accent);"></i> <span>Mobile Apps</span></div>
                    <div style="display: flex; align-items: center; gap: 10px;"><i class="fas fa-check-circle" style="color: var(--accent);"></i> <span>Dashboard Views</span></div>
                </div>
            </div>
            <div class="flt-mockups reveal-up script-reveal" style="transition-delay: 0.2s;">
                <!-- Desktop Web Layout Mockup (Dark Mode) -->
                <div class="flt-web-mockup">
                    <div class="flt-web-top">
                        <span></span><span></span><span></span>
                    </div>
                    <div class="flt-web-body">
                        <div class="flt-web-content">
                            <div class="flt-sidebar"></div>
                            <div class="flt-main">
                                <div class="flt-header"></div>
                                <div class="flt-graph">
                                    <div class="flt-cirlce-glow"></div>
                                    <h3 style="margin:20px 0 0 20px; color:#fff; font-size:16px;">Transform Your Digital Presence</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mobile Layout Mockup (Media Playing App Style) -->
                <div class="flt-mobile-mockup">
                    <div class="flt-mobile-notch"></div>
                    <div class="flt-mobile-body">
                        <div class="flt-m-hero"></div>
                        <h4 style="color:#fff; font-size:14px; text-align:center; margin-bottom:15px;">Starry Night</h4>
                        <div class="flt-m-row">
                            <div class="flt-m-box">
                                <div class="flt-audio-wave"></div>
                            </div>
                            <div class="flt-m-box" style="display:flex; justify-content:center; align-items:center;">
                                <i class="fas fa-play" style="color:var(--accent); font-size:20px;"></i>
                            </div>
                        </div>
                        <div style="width: 100%; height: 40px; background: rgba(255,255,255,0.05); border-radius: 8px; margin-top:20px;"></div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- AI Technology Section -->
        <section class="ai-tech-section">
            <div class="shape shape-2" style="background: rgba(112, 77, 243, 0.03); left: -10%; top: 20%; width: 400px; height: 400px;"></div>
            <div class="shape shape-1" style="background: rgba(112, 77, 243, 0.03); right: -5%; bottom: -5%; width: 250px; height: 250px; left: auto; top: auto;"></div>
            <div class="ai-content reveal-up script-reveal">
                <div class="ai-icon-wrap">
                    <i class="fas fa-brain"></i>
                </div>
                <h2>Next-Generation AI Technology Integration</h2>
                <div class="amz-line" style="margin: 0 auto 25px;"></div>
                <p>Artificial Intelligence is reshaping how web and mobile applications behave. We integrate state-of-the-art AI technology directly into our software structure - delivering predictive data analytics, intelligent process automation, and adaptive interfaces that learn from your users.</p>
                <p>Whether automating HR management workflows, intelligently scanning inventory cycles, or monitoring real-time safety metrics, our AI models ensure your systems aren't just functional; they're intellectually proactive.</p>
                
            </div>
        </section>

        <!-- Trust Metrics Section -->


        <!-- The Innovation Forge Section -->
        <section class="three-container">
            <div id="three-canvas-container" class="three-canvas"></div>
            <div class="three-glow" style="top: 20%; left: 30%;"></div>
            <div class="three-content reveal-up" style="position: relative; z-index: 5;">
                <h2 style="font-size: 52px; color: #fff; text-shadow: none;">Web Application <span>Innovation</span></h2>
                <div class="amz-line" style="margin: 0 auto 30px; background: var(--accent);"></div>
                <p style="color: rgba(255,255,255,0.85); font-weight: 500;">Experience the precision of digital engineering. This system demonstrates the structural assembly of high-performance web applications—from core logic to premium user interface layers.</p>
                <div style="margin-top: 40px; pointer-events: auto;">
                    <a href="javascript:void(0)" class="btn-theme" id="startBuildAnim" style="display:inline-block; border: 2px solid #fff; color: #fff; text-decoration: none; padding: 15px 40px; font-weight: 700;">Initiate Structural Assembly</a>
                </div>
            </div>
        </section>





        <!-- ===== NEON DATA PIPELINE PROCESS ===== -->
        <section class="workflow-3d">
            <div class="wf-header reveal-up">
                <h2>Development <span>Process</span></h2>
                <div class="amz-line" style="margin: 0 auto 20px;"></div>
                <p>A precision-engineered digital pipeline that streams complex ideas into powerful realities.</p>
            </div>
            
            <div class="pipeline-container reveal-up" style="transition-delay: 0.2s;">
                <div class="pipeline-scene">
                    <div class="pipeline-grid"></div>
                    
                    <!-- Flowing Data Pipes -->
                    <div class="data-pipe pipe-vt flow-down" id="pp1"><div class="data-stream"></div></div>
                    <div class="data-pipe flow-right" id="pp2"><div class="data-stream"></div></div>
                    <div class="data-pipe flow-right" id="pp3"><div class="data-stream"></div></div>
                    <div class="data-pipe pipe-vt flow-up" id="pp4"><div class="data-stream"></div></div>
                    
                    <!-- 3D Nodes -->
                    <!-- Discovery -->
                    <div class="pipe-node" id="pn1">
                        <div class="node-content">
                            <div class="hologram-panel">
                                <div class="holo-icon"><i class="fas fa-search"></i></div>
                                <h4>01. Discovery</h4>
                                <p>Strategic blueprinting.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Design -->
                    <div class="pipe-node" id="pn2">
                        <div class="node-content">
                            <div class="hologram-panel">
                                <div class="holo-icon"><i class="fas fa-paint-brush"></i></div>
                                <h4>02. Design</h4>
                                <p>Interactive prototyping & UI.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Engineering (Hub) -->
                    <div class="pipe-node" id="pn3">
                        <div class="node-content">
                            <div class="hologram-panel">
                                <div class="holo-icon"><i class="fas fa-microchip"></i></div>
                                <h4>03. Core Forge</h4>
                                <p>High-performance backend logic assembly.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Testing -->
                    <div class="pipe-node" id="pn4">
                        <div class="node-content">
                            <div class="hologram-panel">
                                <div class="holo-icon"><i class="fas fa-shield-alt"></i></div>
                                <h4>04. Security</h4>
                                <p>Military-grade QA & testing.</p>
                            </div>
                        </div>
                    </div>
                    <!-- Deployment -->
                    <div class="pipe-node" id="pn5">
                        <div class="node-content">
                            <div class="hologram-panel">
                                <div class="holo-icon"><i class="fas fa-rocket"></i></div>
                                <h4>05. Deploy</h4>
                                <p>Infinite tracking & scaling.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== LIVE EXPERIENCE: MULTI-PLATFORM DEMO ===== -->
        <section class="live-demo-section">
            <div class="live-demo-inner">
                <div class="live-demo-header reveal-up">
                    <p class="le-label">LIVE EXPERIENCE</p>
                    <h2>Multi-Platform Demonstration</h2>
                    <p class="le-sub">See how your solution looks across every platform — desktop, tablet, and mobile</p>
                </div>

                <!-- Tablet Mockup -->
                <div class="tablet-mockup-wrap reveal-scale" style="transition-delay:0.2s;">
                    <div class="tablet-device floating">
                        <div class="tablet-top-bar">
                            <div class="tablet-cam"></div>
                        </div>
                        <div class="tablet-screen">
                            <!-- Simulated App Screen Inside Tablet -->
                            <div class="tab-app-header">
                                <div class="tab-logo">VS</div>
                                <div class="tab-nav">
                                    <span>Dashboard</span>
                                    <span class="tab-nav-active">Analytics</span>
                                    <span>Reports</span>
                                    <span>Settings</span>
                                </div>
                            </div>
                            <div class="tab-app-body">
                                <div class="tab-left-panel">
                                    <div class="tab-section-title">Security Overview</div>
                                    <div class="tab-security-item">
                                        <div class="tab-s-icon" style="background:#ee2326;"><i class="fas fa-shield-alt"></i></div>
                                        <div>
                                            <div class="tab-s-name">Military-Grade Encryption</div>
                                            <div class="tab-s-desc">Data Protected · All Threats Mitigated</div>
                                        </div>
                                    </div>
                                    <div class="tab-section-title" style="margin-top:20px;">Data Analytics</div>
                                    <div class="tab-analytics-row">
                                        <div class="tab-a-icon"><i class="fas fa-chart-line"></i></div>
                                        <div>
                                            <div class="tab-s-name">Real-Time Dashboards</div>
                                            <div class="tab-s-desc">Deep insights into business performance</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-right-panel">
                                    <div class="tab-section-title">Client Success Stories</div>
                                    <div class="tab-testimonial-grid">
                                        <div class="tab-testimonial">
                                            <div class="tab-avatar" style="background:#232b66;">JD</div>
                                            <div class="tab-quote">"The scale and performance of the portal exceeded all our expectations."</div>
                                            <strong>John Doe, CEO</strong>
                                        </div>
                                        <div class="tab-testimonial">
                                            <div class="tab-avatar" style="background:#ee2326;">AS</div>
                                            <div class="tab-quote">"Perfect execution from initial wireframing to the live launch."</div>
                                            <strong>Alex Smith, CTO</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-app-footer">
                                <span>© 2026 Vivify Soft · Designed for Excellence.</span>
                            </div>
                        </div>
                        <div class="tablet-home-btn"></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== LIVE EXPERIENCE: MODERN APP INTERFACES ===== -->
        <section class="modern-app-section">
            <div class="mod-app-header reveal-up">
                <p class="le-label">LIVE EXPERIENCE</p>
                <h2>Modern App Interfaces</h2>
                <p class="le-sub">Premium mobile experiences built for the world's most demanding users</p>
            </div>

            <div class="mod-phones-wrap">
                <!-- Phone 1: Feature App -->
                <div class="mod-phone reveal-left" style="transition-delay:0.1s;">
                    <div class="mod-phone-device floating">
                        <div class="mod-phone-notch"></div>
                        <div class="mod-phone-screen">
                            <div class="mod-app-header-bar" style="background:#232b66; padding:18px 16px; border-radius:0;">
                                <div style="color:rgba(255,255,255,0.7); font-size:11px; margin-bottom:4px;">Welcome Back!</div>
                                <div style="color:#fff; font-size:13px; font-weight:700;">Your mobile infrastructure is healthy and secure.</div>
                                <div style="margin-top:12px; background:rgba(255,255,255,0.15); border-radius:8px; padding:8px 12px; font-size:11px; color:rgba(255,255,255,0.6); display:flex; align-items:center; gap:6px;">
                                    <i class="fas fa-search"></i> Search Analytics…
                                </div>
                            </div>
                            <div style="padding:16px;">
                                <div style="font-size:12px; font-weight:700; color:#1f1b3d; margin-bottom:12px;">Core Features</div>
                                <div class="mod-feature-grid">
                                    <div class="mod-feat-card">
                                        <i class="fas fa-fingerprint" style="color:#22c55e; font-size:18px;"></i>
                                        <span>Bio-Auth</span>
                                    </div>
                                    <div class="mod-feat-card">
                                        <i class="fas fa-bolt" style="color:#f59e0b; font-size:18px;"></i>
                                        <span>Real-time</span>
                                    </div>
                                    <div class="mod-feat-card">
                                        <i class="fas fa-cloud-upload-alt" style="color:#6366f1; font-size:18px;"></i>
                                        <span>Sync</span>
                                    </div>
                                    <div class="mod-feat-card">
                                        <i class="fas fa-bell" style="color:#ee2326; font-size:18px;"></i>
                                        <span>Alerts</span>
                                    </div>
                                </div>
                                <div style="margin-top:16px; font-size:12px; font-weight:700; color:#1f1b3d; margin-bottom:8px;">System Health</div>
                                <div class="mod-health-bar"><div class="mod-health-fill" style="width:88%;background:#22c55e;"></div></div>
                                <div style="font-size:10px; color:#6b7280; margin-top:4px;">88% — All Systems Operational</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Phone 2: Analytics App -->
                <div class="mod-phone mod-phone-front reveal-right" style="transition-delay:0.2s;">
                    <div class="mod-phone-device floating" style="background:#fff; animation-delay: 1s;">
                        <div class="mod-phone-notch" style="background:#111;"></div>
                        <div class="mod-phone-screen" style="background:#f5f7fb;">
                            <div style="padding:18px 16px 12px;">
                                <div style="font-size:10px; color:#6b7280; margin-bottom:4px;">Revenue Growth</div>
                                <div style="display:flex; align-items:center; gap:12px; background:#fff; padding:12px; border-radius:12px; box-shadow:0 2px 10px rgba(0,0,0,0.07);">
                                    <div style="width:36px;height:36px;background:linear-gradient(135deg,#a855f7,#ec4899);border-radius:10px;display:flex;align-items:center;justify-content:center;">
                                        <i class="fas fa-chart-line" style="color:#fff;font-size:14px;"></i>
                                    </div>
                                    <div>
                                        <div style="font-weight:700;font-size:12px;color:#1f1b3d;">Revenue Growth</div>
                                        <div style="font-size:10px;color:#9ca3af;">Updated 2 mins ago</div>
                                    </div>
                                </div>
                                <div style="font-size:32px;font-weight:800;color:#1f1b3d;margin:22px 0 6px;">$128,430</div>
                                <div style="font-size:13px;font-weight:600;color:#ee2326;">+12.5% this month</div>
                            </div>
                            <div style="padding:0 16px 12px; display:flex; gap:10px;">
                                <div style="flex:1;background:#fff;border-radius:12px;padding:12px;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
                                    <div style="font-size:18px;margin-bottom:6px;"><i class="fas fa-heart" style="color:#ee2326;"></i></div>
                                    <div style="font-weight:700;font-size:12px;color:#1f1b3d;">User Love</div>
                                    <div style="font-size:11px;color:#9ca3af;">4.9/5 Rating</div>
                                </div>
                                <div style="flex:1;background:#111;border-radius:12px;padding:12px;">
                                    <div style="font-size:18px;margin-bottom:6px;"><i class="fas fa-star" style="color:#f59e0b;"></i></div>
                                    <div style="font-weight:700;font-size:12px;color:#fff;">Premium</div>
                                    <div style="font-size:11px;color:rgba(255,255,255,0.5);">Exclusive Tier</div>
                                </div>
                            </div>
                            <div style="padding:0 16px;">
                                <div style="background:#fff;border-radius:12px;padding:12px;box-shadow:0 2px 8px rgba(0,0,0,0.06);">
                                    <div style="font-size:11px;font-weight:700;color:#1f1b3d;margin-bottom:8px;">Active Sessions</div>
                                    <div style="display:flex;align-items:center;gap:8px;margin-bottom:8px;">
                                        <div style="width:24px;height:24px;background:#232b66;border-radius:6px;display:flex;align-items:center;justify-content:center;">
                                            <i class="fas fa-mobile-alt" style="color:#fff;font-size:10px;"></i>
                                        </div>
                                        <div>
                                            <div style="font-size:10px;font-weight:700;color:#1f1b3d;">iPhone 15 Pro Max</div>
                                            <div style="font-size:9px;color:#9ca3af;">London, UK</div>
                                        </div>
                                    </div>
                                    <div style="display:flex;align-items:center;gap:8px;">
                                        <div style="width:24px;height:24px;background:#ee2326;border-radius:6px;display:flex;align-items:center;justify-content:center;">
                                            <i class="fas fa-tablet-alt" style="color:#fff;font-size:10px;"></i>
                                        </div>
                                        <div>
                                            <div style="font-size:10px;font-weight:700;color:#1f1b3d;">iPad Air M2</div>
                                            <div style="font-size:9px;color:#9ca3af;">New York, USA</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section id="gallery" class="gallery-section">
            <div class="section-title reveal-up script-reveal">
                <h2>Gallery</h2>
                <p>Explore some of our magnificent web and mobile designs, UI interfaces, and enterprise software masterpieces.</p>
            </div>
            
            <div class="gallery-grid">
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/firosnv-photography-e2Dnu5BPhDU-unsplash.jpg" alt="Photography Portrait" class="g-img">
                </div>
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/ferenc-almasi-eYpcLDXHVb0-unsplash.jpg" alt="Designer Working" class="g-img">
                </div>
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/alvaro-reyes-KxVlKiqQObU-unsplash.jpg" alt="Landscape Photo" class="g-img">
                </div>
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/amelie-mourichon-h3kEAHMl1k4-unsplash.jpg" alt="Creative Lens" class="g-img">
                </div>
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/ben-kolde-bs2Ba7t69mM-unsplash.jpg" alt="Focusing Shot" class="g-img">
                </div>
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/daniel-korpai-pKRNxEguRgM-unsplash.jpg" alt="Holding Camera" class="g-img">
                </div>
                <div class="gallery-item reveal-up script-reveal">
                    <img src="assets/img/eftakher-alam-i1VQZsU86ok-unsplash.jpg" alt="Camera Work" class="g-img">
                </div>
            </div>
        </section>


    
        <!-- Our Process -->
        <section id="process" class="process-section">
            <div class="section-title reveal-up script-reveal">
                <h2>Our Working Process</h2>
                <p>Discover our agile methodology. We bridge the gap between ideation and massive-scale web deployment through our 5-tier funnel.</p>
            </div>

            <div class="process-container">
                <div class="process-line"></div>
                
                <div class="process-item reveal-up script-reveal">
                    <div class="process-content">
                        <h4>1. Planning</h4>
                        <p>Defining scope & goals</p>
                    </div>
                    <div class="process-number"><i class="fas fa-lightbulb"></i></div>
                    <div class="process-empty"></div>
                </div>

                <div class="process-item reveal-up script-reveal" style="transition-delay: 0.1s;">
                    <div class="process-content">
                        <h4>2. Designing</h4>
                        <p>Creating exact mockups</p>
                    </div>
                    <div class="process-number"><i class="fas fa-paint-brush"></i></div>
                    <div class="process-empty"></div>
                </div>

                <div class="process-item reveal-up script-reveal" style="transition-delay: 0.2s;">
                    <div class="process-content">
                        <h4>3. Development</h4>
                        <p>Writing robust logic</p>
                    </div>
                    <div class="process-number"><i class="fas fa-laptop-code"></i></div>
                    <div class="process-empty"></div>
                </div>

                <div class="process-item reveal-up script-reveal" style="transition-delay: 0.3s;">
                    <div class="process-content">
                        <h4>4. Testing</h4>
                        <p>Quality assurance</p>
                    </div>
                    <div class="process-number"><i class="fas fa-bug"></i></div>
                    <div class="process-empty"></div>
                </div>

                <div class="process-item reveal-up script-reveal" style="transition-delay: 0.4s;">
                    <div class="process-content">
                        <h4>5. Launch</h4>
                        <p>Deployment to servers</p>
                    </div>
                    <div class="process-number"><i class="fas fa-rocket"></i></div>
                    <div class="process-empty"></div>
                </div>
            </div>
        </section>

        <!-- Lifetime Commitment -->
        <section class="lifetime-section">
            <div class="lifetime-content reveal-up script-reveal">
                <h2><i class="fas fa-infinity" style="color: var(--accent); margin-right: 15px;"></i>Lifetime Commitment</h2>
                <p><strong>Post-Launch Lifetime Support</strong> <br><br> We don't disappear after go-live. Our dedicated team provides ongoing maintenance, updates, security patches, and technical support so your product stays fast, secure, and ahead of the curve, forever.</p>
            </div>
            <!-- Blobs for effect -->
            <div class="shape shape-1" style="background: rgba(255,255,255,0.05); bottom: -50px; right: -50px; top: auto; left: auto;"></div>
            <div class="shape shape-3" style="background: rgba(255,255,255,0.05); top: 20px; left: 20px;"></div>
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
                <h2>Choose Your Service</h2>
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

        <!-- ✨ AI Chatbot Widget -->
        <button type="button" class="ai-chat-btn" id="aiChatBtn" onclick="toggleChat()" title="Chat with AI Assistant">
            <i class="fas fa-robot" id="chatBtnIcon"></i>
            <span class="chat-pulse">1</span>
        </button>

        <div class="ai-chat-popup" id="aiChatPopup">
            <div class="ai-chat-header">
                <div class="ai-chat-avatar"><i class="fas fa-robot" style="color:var(--primary); font-size:22px;"></i></div>
                <div class="ai-chat-header-info">
                    <h4>Vivify AI Assistant</h4>
                    <span><span class="ai-status-dot"></span>ready to help</span>
                </div>
                <button type="button" class="ai-close-chat" onclick="toggleChat()"><i class="fas fa-times"></i></button>
            </div>
            <div class="ai-chat-messages" id="chatMessages">
                <!-- Messages populated by JS -->
            </div>
            <div class="ai-chat-input-area">
                <input type="text" class="ai-chat-input" id="chatInput" placeholder="Ask me anything..." onkeydown="if(event.key==='Enter') { event.preventDefault(); sendChat(); }" />
                <button type="button" class="ai-chat-send" onclick="sendChat()"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>

    </form>

    <script>
        // ===== LOGIN MODAL =====
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

        // ===== COOKIE CONSENT SYSTEM =====
        function handleCookieConsent(allowed) {
            localStorage.setItem('vivifyCookieConsent', allowed ? 'allowed' : 'denied');
            document.getElementById('cookieBanner').classList.remove('show');
        }

        function checkCookieConsent() {
            if (!localStorage.getItem('vivifyCookieConsent')) {
                setTimeout(() => {
                    document.getElementById('cookieBanner').classList.add('show');
                }, 500);
            }
        }

        document.addEventListener("DOMContentLoaded", function() {
            checkCookieConsent();


            // ===== NAVBAR SCROLL =====
            const navbar = document.getElementById("navbar");
            const hero = document.getElementById("home");
            
            window.addEventListener("scroll", function() {
                const heroHeight = hero.offsetHeight;
                const scrollPos = window.scrollY;
                if (scrollPos > (heroHeight - 100)) {
                    navbar.classList.add("nav-scrolled");
                } else {
                    navbar.classList.remove("nav-scrolled");
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

            // ===== SCROLL PROGRESS =====
            const progress = document.getElementById("scrollProgress");
            window.addEventListener("scroll", () => {
                const height = document.documentElement.scrollHeight - window.innerHeight;
                const scrolled = (window.scrollY / height) * 100;
                if (progress) progress.style.height = scrolled + "%";
            });

            // ===== SCROLL REVEAL =====
            const revealEls = document.querySelectorAll(".reveal-up, .reveal-left, .reveal-right, .reveal-scale");
            const revealObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        // Small delay so transition is visible
                        setTimeout(() => entry.target.classList.add("active"), 80);
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.08, rootMargin: "0px 0px -30px 0px" });
            revealEls.forEach(el => revealObserver.observe(el));

            // Also trigger elements already in viewport on page load
            setTimeout(() => {
                revealEls.forEach(el => {
                    const rect = el.getBoundingClientRect();
                    if (rect.top < window.innerHeight && rect.bottom > 0) {
                        el.classList.add("active");
                    }
                });
            }, 100);

            // ===== MOBILE MENU TOGGLE =====
            // This is already handled above by toggleMenu() and event listeners
 
            // ===== INIT CHATBOT =====
            initChat();
        });

        // ===== AI CHATBOT =====
        let chatOpen = false;
        const botResponses = {
            greetings: ['hello','hi','hey','good morning','good evening','good afternoon','howdy','namaste'],
            services:  ['service','services','offer','provide','do you do','what do you','solutions','develop'],
            web:       ['web','website','webapp','web app','web development','site'],
            mobile:    ['mobile','android','ios','app','flutter','react native'],
            custom:    ['custom','erp','hrms','hr system','hr software','reimbursement','inventory','custom software'],
            safety:    ['safety','safety management','incident','compliance','osha'],
            price:     ['price','cost','pricing','budget','how much','rate','charge','fee'],
            contact:   ['contact','email','phone','reach','call','address','location','whatsapp'],
            about:     ['who are you','about','vivify','company','team','founded'],
            demo:      ['demo','trial','book','booking','schedule','meeting'],
            ai:        ['ai','artificial intelligence','machine learning','ml','automation','chatbot'],
            thanks:    ['thank','thanks','thank you','great','awesome','nice','cool','perfect','good']
        };

        const replies = {
            greetings: "Hello! I'm the **Vivify AI Assistant**. I can help you learn about our services, pricing, how to get started, and more. What would you like to know?",
            services:  "We offer **3 core services**:\n\n- **Web Development** - Custom, high-performance websites & web apps\n- **Mobile Development** - iOS & Android apps\n- **Custom Software** - HR systems, ERP, Safety tools & more\n\nWhich one interests you?",
            web:       "Our **Web Development** service covers everything from landing pages to full enterprise web applications. We use modern tech like React, .NET, and SQL to build fast, scalable, and beautiful web solutions. Want to [get a quote](Contact.aspx)?",
            mobile:    "We build **native & cross-platform mobile apps** for iOS and Android. Our apps are optimized for performance, great UX, and seamless backend integration. Would you like to [get a quote](Contact.aspx)?",
            custom:    "Our **Custom Software** team builds bespoke solutions including:\n\n- HR & Reimbursement Management\n- Safety Management Systems\n- Inventory & ERP Software\n\nAll built from scratch, fully tailored to your workflow. Shall I connect you with our team?",
            safety:    "Our **Safety Management System** provides real-time incident tracking, compliance management, and automated safety reporting. It's used by multiple companies. Check it out at [vivifysoft.in/safety](https://vivifysoft.in/safety/#/AdminLogin)!",
            price:     "Pricing depends on your project scope. We offer **competitive, transparent pricing** with no hidden costs. The best way is to describe your requirements and we'll give you a custom quote. Would you like to [contact us](Contact.aspx)?",
            contact:   "You can reach us via:\n\n- Email: **itsupport@vivifysoft.in**\n- Location: **Padi, Chennai - 600050**\n- Phone: **+91 88389 66643**\n\nOr just fill the [contact form](Contact.aspx) below!",
            about:     "**Vivify Soft** is a Chennai-based IT solutions company founded in 2024. We specialize in HR management, Safety systems, Web & Mobile development. Our skilled team delivers quality products on time. Want to [know more](AboutUs.aspx)?",
            demo:      "We'd love to show you a walkthrough of our products! Please [contact us](Contact.aspx) to schedule a custom session with our engineers.",
            ai:        "Great question! We integrate AI into our software for:\n\n- Predictive analytics & reporting\n- Automated workflow processing\n- Intelligent data anomaly detection\n- Smart form assistance (like what I'm doing right now!)\n\nAll without needing cloud AI APIs - pure smart logic!",
            thanks:    "You're welcome! Is there anything else I can help you with? Feel free to ask about our services, pricing, or team!",
            default:   "That's a great question! I might not have a perfect answer, but our team definitely does. Would you like to [contact us](Contact.aspx) directly?"
        };

        const quickButtons = [
            { label: 'Web Dev', key: 'web' },
            { label: 'Mobile App', key: 'mobile' },
            { label: 'Custom Software', key: 'custom' },
            { label: 'Pricing', key: 'price' },
            { label: 'AI Features', key: 'ai' }
        ];

        function initChat() {
            const welcomeMsg = "Hi there! I'm **Vivify AI**, your smart assistant. I can answer questions about our services, pricing, and more.\n\nWhat can I help you with today?";
            addBotMessage(welcomeMsg, true);
        }

        function toggleChat() {
            chatOpen = !chatOpen;
            const popup = document.getElementById('aiChatPopup');
            const icon = document.getElementById('chatBtnIcon');
            const pulse = document.querySelector('.chat-pulse');
            popup.classList.toggle('open', chatOpen);
            if (icon) icon.className = chatOpen ? 'fas fa-times' : 'fas fa-robot';
            if (pulse) pulse.style.display = chatOpen ? 'none' : '';
        }

        function addBotMessage(text, showQuicks) {
            const msgs = document.getElementById('chatMessages');
            const msg = document.createElement('div');
            msg.className = 'chat-msg bot';
            // Simple markdown-ish parsing
            const formatted = text
                .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
                .replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2" style="color:var(--primary);font-weight:600;">$1</a>')
                .replace(/\n/g, '<br>');
            msg.innerHTML = `<div class="chat-mini-avatar"><i class="fas fa-robot" style="color:#fff; font-size:14px;"></i></div><div class="chat-bubble">${formatted}</div>`;
            msgs.appendChild(msg);

            if (showQuicks) {
                const qWrap = document.createElement('div');
                qWrap.className = 'chat-msg bot';
                qWrap.style.maxWidth = '100%';
                let btns = '<div class="chat-quick-btns">';
                quickButtons.forEach(b => {
                    btns += `<button type="button" class="chat-quick-btn" onclick="handleQuick('${b.key}','${b.label}')">${b.label}</button>`;
                });
                btns += '</div>';
                qWrap.innerHTML = btns;
                msgs.appendChild(qWrap);
            }
            msgs.scrollTop = msgs.scrollHeight;
        }

        function addUserMessage(text) {
            const msgs = document.getElementById('chatMessages');
            const msg = document.createElement('div');
            msg.className = 'chat-msg user';
            msg.innerHTML = `<div class="chat-bubble">${text}</div>`;
            msgs.appendChild(msg);
            msgs.scrollTop = msgs.scrollHeight;
        }

        function showTyping() {
            const msgs = document.getElementById('chatMessages');
            const typing = document.createElement('div');
            typing.className = 'chat-msg bot';
            typing.id = 'typingIndicator';
            typing.innerHTML = '<div class="chat-mini-avatar"><i class="fas fa-robot" style="color:#fff; font-size:14px;"></i></div><div class="chat-typing"><span></span><span></span><span></span></div>';
            msgs.appendChild(typing);
            msgs.scrollTop = msgs.scrollHeight;
        }

        function removeTyping() {
            const el = document.getElementById('typingIndicator');
            if (el) el.remove();
        }

        async function getResponse(text) {
            const lower = text.toLowerCase().trim();
            // First check predefined quick topics
            for (const [key, keywords] of Object.entries(botResponses)) {
                if (keywords.some(kw => lower.includes(kw))) {
                    return { text: replies[key], showQuicks: key === 'greetings' || key === 'services' };
                }
            }
            
            // If it's a new question, ask the real AI!
            try {
                const sysContext = "You are Vivify AI, a polite, helpful assistant for Vivify Soft (an IT company in Chennai offering Web Dev, Mobile Apps, Custom ERP, and Safety Tools). Keep answers short, professional, and within 1-2 sentences. Avoid markdown headers.";
                const url = "https://text.pollinations.ai/prompt/" + encodeURIComponent(sysContext + " User asks: " + text);
                const res = await fetch(url);
                if (res.ok) {
                    const aiText = await res.text();
                    return { text: aiText, showQuicks: false };
                }
            } catch (e) {
                console.log("AI integration error, falling back to default.", e);
            }

            return { text: replies.default, showQuicks: true };
        }

        function handleQuick(key, label) {
            addUserMessage(label);
            showTyping();
            setTimeout(() => {
                removeTyping();
                const resp = { text: replies[key], showQuicks: false };
                addBotMessage(resp.text, resp.showQuicks);
            }, 900);
        }

        async function sendChat() {
            const input = document.getElementById('chatInput');
            const text = input.value.trim();
            if (!text) return;
            addUserMessage(text);
            input.value = '';
            showTyping();
            
            const start = Date.now();
            const resp = await getResponse(text);
            const elapsed = Date.now() - start;
            
            // Ensure at least an 800ms typing delay to feel natural
            if (elapsed < 800) {
                setTimeout(() => {
                    removeTyping();
                    addBotMessage(resp.text, resp.showQuicks);
                }, 800 - elapsed);
            } else {
                removeTyping();
                addBotMessage(resp.text, resp.showQuicks);
            }
        }

        // ===== SMART CONTACT FORM AI SUGGEST =====
        function toggleAiSuggest() {
            const box = document.getElementById('aiSuggestionBox');
            const btn = document.getElementById('aiSuggestToggle');
            box.classList.toggle('show');
            if (box.classList.contains('show')) {
                btn.innerHTML = '<i class="fas fa-times"></i> ✨ Close AI Suggestions';
            } else {
                btn.innerHTML = '<i class="fas fa-wand-magic-sparkles"></i> ✨ AI Smart Suggest — Auto-fill my inquiry';
            }
        }

        function applyAiSuggestion(subject, message) {
            // Target the ASP.NET-rendered textboxes
            const subjectBoxes = document.querySelectorAll('[id*="txtSubject"]');
            const messageBoxes = document.querySelectorAll('[id*="txtMessage"]');
            if (subjectBoxes.length > 0) subjectBoxes[0].value = subject;
            if (messageBoxes.length > 0) messageBoxes[0].value = message;

            // Close suggestion box
            document.getElementById('aiSuggestionBox').classList.remove('show');
            document.getElementById('aiSuggestToggle').innerHTML = '<i class="fas fa-check-circle" style="color:#25d366;"></i> AI has filled your form!';

            // Reset button after 3s
            setTimeout(() => {
                document.getElementById('aiSuggestToggle').innerHTML = '<i class="fas fa-wand-magic-sparkles"></i> AI Smart Suggest - Auto-fill my inquiry';
            }, 3000);

            // Scroll to subject field
            const subBox = subjectBoxes[0];
            if (subBox) subBox.scrollIntoView({ behavior: 'smooth', block: 'center' });
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

        // Advanced Scroll Intersection Observer
        const revealOptions = { threshold: 0.15, rootMargin: "0px 0px -50px 0px" };
        const revealObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('reveal-visible');
                    // If it's a counter, start it
                    if (entry.target.classList.contains('stat-card')) {
                        startCounter(entry.target);
                    }
                }
            });
        }, revealOptions);

        document.querySelectorAll('.reveal-up, .reveal-left, .reveal-right').forEach(el => revealObserver.observe(el));

        function startCounter(card) {
            const valEl = card.querySelector('.stat-val');
            if (valEl.classList.contains('counted')) return;
            valEl.classList.add('counted');
            
            const target = parseInt(valEl.getAttribute('data-val'));
            let count = 0;
            const speed = target / 50;
            const update = () => {
                count += speed;
                if (count < target) {
                    valEl.innerText = Math.ceil(count) + (target > 50 ? '+' : '');
                    requestAnimationFrame(update);
                } else {
                    valEl.innerText = target + (target > 50 ? '+' : '');
                }
            };
            update();
        }

        // Particle Drift Effect
        document.addEventListener('mousemove', (e) => {
            const moveX = (e.clientX - window.innerWidth / 2) * 0.01;
            const moveY = (e.clientY - window.innerHeight / 2) * 0.01;
            document.querySelectorAll('.floating-particle').forEach(p => {
                p.style.transform = `translate(${moveX}px, ${moveY}px)`;
            });
        });

        // ===== SHARED THREE.JS STATE =====
        let mouseX = 0, mouseY = 0;
        document.addEventListener('mousemove', (e) => {
            mouseX = (e.clientX / window.innerWidth) - 0.5;
            mouseY = (e.clientY / window.innerHeight) - 0.5;
        });

        // ===== MODULE 1: HYPER-REALISTIC DASHBOARD FORGE =====
        let scene, camera, renderer, dashGroup, dataField;
        let dashComponents = [];
        let isBuilding = false;

        function initThree() {
            const container = document.getElementById('three-canvas-container');
            if(!container) return;

            scene = new THREE.Scene();
            camera = new THREE.PerspectiveCamera(70, container.clientWidth / container.clientHeight, 0.1, 1000);
            renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
            renderer.setSize(container.clientWidth, container.clientHeight);
            renderer.setPixelRatio(window.devicePixelRatio);
            renderer.toneMapping = THREE.ReinhardToneMapping;
            renderer.toneMappingExposure = 1.2;
            container.appendChild(renderer.domElement);

            dashGroup = new THREE.Group();
            scene.add(dashGroup);

            scene.add(new THREE.AmbientLight(0xffffff, 0.4));
            const lightRed = new THREE.PointLight(0xee2326, 3, 50);
            lightRed.position.set(-10, 5, 10);
            scene.add(lightRed);
            const lightBlue = new THREE.PointLight(0x232b66, 3, 50);
            lightBlue.position.set(10, -5, 10);
            scene.add(lightBlue);

            const pCount = 2000;
            const pGeo = new THREE.BufferGeometry();
            const pPos = new Float32Array(pCount * 3);
            for(let i=0; i<pCount*3; i++) pPos[i] = (Math.random()-0.5) * 40;
            pGeo.setAttribute('position', new THREE.BufferAttribute(pPos, 3));
            dataField = new THREE.Points(pGeo, new THREE.PointsMaterial({ color: 0xffffff, size: 0.03, transparent: true, opacity: 0.4 }));
            scene.add(dataField);

            createSuperPart(8.2, 5.2, 0.04, 0, 0, 0, 0x0f172a, 0.25);
            createSuperPart(8, 0.6, 0.05, 0, 2.3, 0.1, 0x232b66, 0.9);
            for(let i=0; i<3; i++) createSuperPart(0.12, 0.12, 0.06, -3.6+(i*0.35), 2.3, 0.18, 0xee2326, 1);
            createSuperPart(1.6, 4.6, 0.05, -3.2, -0.3, 0.1, 0x232b66, 0.85);
            createSuperPart(1.6, 1.4, 0.05, -0.7, 1.2, 0.1, 0xee2326, 0.9);
            createSuperPart(1.6, 1.4, 0.05, 1.2, 1.2, 0.1, 0x818cf8, 0.9);
            createSuperPart(1.6, 1.4, 0.05, 3.1, 1.2, 0.1, 0x4ade80, 0.9);
            createSuperPart(5.4, 2.2, 0.04, 1.3, -1.0, 0.1, 0xffffff, 0.05);

            camera.position.z = 12.5;
            animateThree();
        }

        function createSuperPart(w, h, d, tx, ty, tz, color, opac) {
            const mesh = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), new THREE.MeshStandardMaterial({ 
                color: color, transparent: true, opacity: opac, metalness: 0.9, roughness: 0.1,
                emissive: color, emissiveIntensity: 0.1
            }));
            const edgeLine = new THREE.LineSegments(new THREE.EdgesGeometry(mesh.geometry), new THREE.LineBasicMaterial({ color: 0xffffff, transparent: true, opacity: 0.5 }));
            mesh.add(edgeLine);
            mesh.position.set((Math.random()-0.5)*30, (Math.random()-0.5)*30, (Math.random()-0.5)*30);
            mesh.rotation.set(Math.random()*Math.PI, Math.random()*Math.PI, Math.random()*Math.PI);
            mesh.userData = { target: { x: tx, y: ty, z: tz } };
            dashComponents.push(mesh);
            dashGroup.add(mesh);
        }

        function animateThree() {
            requestAnimationFrame(animateThree);
            const t = Date.now() * 0.001;
            dashComponents.forEach((part, i) => {
                if(isBuilding) {
                    part.position.lerp(new THREE.Vector3(part.userData.target.x, part.userData.target.y, part.userData.target.z), 0.1);
                    part.rotation.x *= 0.88; part.rotation.y *= 0.88; part.rotation.z *= 0.88;
                } else {
                    part.rotation.y += 0.008 + (i * 0.001);
                    part.position.y += Math.sin(t + i) * 0.015;
                }
            });
            if(dataField) dataField.rotation.y += 0.002;
            dashGroup.rotation.y += (mouseX * 0.5 - dashGroup.rotation.y) * 0.05;
            dashGroup.rotation.x += (mouseY * 0.3 - dashGroup.rotation.x) * 0.05;
            renderer.render(scene, camera);
        }

        document.getElementById('startBuildAnim')?.addEventListener('click', function() {
            isBuilding = !isBuilding;
            this.innerText = isBuilding ? "Operation Live" : "Initiate Structural Assembly";
            if(isBuilding) {
                dashComponents.forEach(p => {
                    p.material.emissiveIntensity = 2.0; 
                    setTimeout(() => p.material.emissiveIntensity = 0.1, 500);
                });
            }
        });



        window.addEventListener('resize', () => {
             if(renderer) {
                 const cont = renderer.domElement.parentElement;
                 camera.aspect = cont.clientWidth / cont.clientHeight;
                 camera.updateProjectionMatrix();
                 renderer.setSize(cont.clientWidth, cont.clientHeight);
             }
        });

        // ===== 3D HOVER PARALLAX (TILT) EXTENSION =====
        const tiltElements = document.querySelectorAll('.tablet-device, .mod-phone-device');
        tiltElements.forEach(el => {
            el.addEventListener('mousemove', (e) => {
                const rect = el.getBoundingClientRect();
                const x = e.clientX - rect.left - rect.width / 2;
                const y = e.clientY - rect.top - rect.height / 2;
                const maxTilt = 12; // Premium degree of tilt
                
                const rotateX = -(y / (rect.height / 2)) * maxTilt;
                const rotateY = (x / (rect.width / 2)) * maxTilt;
                
                el.style.transition = 'transform 0.1s ease-out';
                el.style.transform = `perspective(1200px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.03, 1.03, 1.03)`;
                
                // Pause CSS float animations gracefully
                if (!el.dataset.tiltActive) {
                    el.dataset.origAnimation = el.style.animation;
                    el.style.animation = 'none';
                    el.dataset.tiltActive = 'true';
                }
            });
            el.addEventListener('mouseleave', () => {
                el.style.transition = 'transform 0.8s cubic-bezier(0.2, 0.8, 0.2, 1)';
                el.style.transform = 'perspective(1200px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)';
                
                // Restore float animations perfectly
                setTimeout(() => {
                    el.style.animation = el.dataset.origAnimation || '';
                    el.dataset.tiltActive = '';
                }, 800);
            });
        });

        setTimeout(initThree, 300);
        </script>

    <!-- Professional Cookie Consent Bar -->
    <div id="cookieBanner" class="cookie-banner">
        <div class="cookie-content">
            <i class="fas fa-cookie-bite"></i>
            <div class="cookie-text">
                <h4>Privacy & Cookie Policy</h4>
                <p>We use cookies to improve your experience and analyze our traffic. By continuing to use our site, you agree to our use of cookies and data processing policies.</p>
            </div>
        </div>
        <div class="cookie-btns">
            <button type="button" class="btn-cookie btn-deny" onclick="handleCookieConsent(false)">Decline</button>
            <button type="button" class="btn-cookie btn-allow" onclick="handleCookieConsent(true)">Accept All</button>
        </div>
    </div>

    <!-- Scroll Progress Indicator -->
    <div class="page-scroll-indicator">
        <div class="scroll-progress-fill" id="scrollProgress"></div>
    </div>
</body>
</html>

