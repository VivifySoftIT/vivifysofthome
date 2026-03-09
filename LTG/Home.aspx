<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vivify.Home" %>


    <!DOCTYPE html>
    <html lang="en">

    <head>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vivify Soft</title>
        <link href="assets/img/favicon.ico" rel="icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <link rel="stylesheet" type="text/css"
            href="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/devicon.min.css" />
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap');

            html,
            body {
                margin: 0;
                padding: 0;
                height: 100%;
                width: 100%;
                font-family: 'Poppins', sans-serif;
                overflow-x: hidden;
                scroll-behavior: smooth;
                scroll-padding-top: 80px;
                box-sizing: border-box;
            }

            *,
            *:before,
            *:after {
                box-sizing: inherit;
            }

            body {
                background: url('assets/img/vs-bg2.jpg') no-repeat center center fixed;
                background-size: cover;
                position: relative;
                min-height: 100vh;
            }

            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(8px);
                z-index: -1;
            }

            h4 { font-size: 16px; color: #73A5FF; }
            h1 { font-size: 50px; font-weight: bold; line-height: 1.2; }
            h1 span { color: #2D8CFF; }
            p { margin-top: 15px; font-size: 18px; opacity: 0.8; }

            .navbar {
                background-color: #f8f9fc;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 0 40px;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                height: 64px;
                overflow: hidden;
                transition: all 0.3s ease;
                box-sizing: border-box;
            }

            .logo img { height: 48px; width: auto; object-fit: contain; }

            .nav-links {
                display: flex;
                gap: 10px;
                align-items: center;
            }

            .nav-links a {
                color: #003366;
                text-decoration: none;
                font-size: 13px;
                font-weight: 600;
                position: relative;
                padding: 10px 14px;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                display: flex;
                align-items: center;
                border: 1px solid rgba(0, 51, 102, 0.08);
                border-radius: 50px;
                background: rgba(255, 255, 255, 0.5);
                line-height: 1;
                white-space: nowrap;
            }

            .nav-links a:hover {
                color: #2D8CFF;
                background: #f0f7ff;
                border: 1px solid rgba(45, 140, 255, 0.3);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(45, 140, 255, 0.1);
            }

            .nav-links a::after {
                content: '';
                position: absolute;
                left: 50%;
                bottom: 2px;
                width: 0;
                height: 2px;
                background-color: #2D8CFF;
                transition: all 0.3s ease;
                border-radius: 2px;
                transform: translateX(-50%);
            }

            .nav-links a:hover::after { width: 50%; }
            .nav-links i { margin-right: 8px; transition: transform 0.5s ease; font-size: 16px; }
            .nav-links a:hover i { transform: scale(1.2) rotate(10deg); }

            .navbar.scrolled {
                background: rgba(255, 255, 255, 0.98);
                backdrop-filter: blur(15px);
                height: 58px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.06);
            }

            .custom-btn-primary {
                background-color: #007bff;
                color: white;
                padding: 8px 24px;
                border: none;
                cursor: pointer;
                font-size: 15px;
                font-weight: 600;
                border-radius: 6px;
                box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
                transition: all 0.3s ease;
                margin-left: 20px;
                margin-right: 5px;
                display: flex;
                align-items: center;
                justify-content: center;
                white-space: nowrap;
            }

            .custom-btn-primary:hover {
                background-color: #0069d9;
                transform: scale(1.03);
                box-shadow: 0 6px 15px rgba(0, 123, 255, 0.3);
            }

            .menu-icon { display: none; font-size: 30px; cursor: pointer; margin-right: 50px; z-index: 1100; }

            .close-icon {
                display: none;
                position: absolute;
                top: 15px;
                right: 15px;
                font-size: 30px;
                cursor: pointer;
                padding: 10px;
                border: 2px solid transparent;
                border-radius: 50%;
                transition: all 0.3s ease-in-out;
                z-index: 1100;
            }

            .custom-popup-overlay {
                display: none;
                position: fixed;
                top: 0; left: 0;
                width: 100%; height: 100%;
                background: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }

            .custom-popup {
                background: white;
                width: 350px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
                text-align: center;
                position: relative;
                animation: fadeIn 0.3s ease-in-out;
            }

            .popup-title { font-size: 20px; margin-bottom: 20px; font-weight: bold; }

            .custom-close-btn {
                position: absolute;
                top: 10px; right: 15px;
                font-size: 24px;
                cursor: pointer;
                color: #555;
                transition: color 0.3s ease;
            }

            .custom-close-btn:hover { color: red; }

            .popup-content { display: flex; flex-direction: column; gap: 15px; }

            .custom-popup-item {
                background: #007bff;
                color: white;
                padding: 12px;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                transition: background 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            .custom-popup-item:hover { background: #0056b3; }

            .fade-in { opacity: 1; transform: none; transition: none; }
            .fade-in.visible { opacity: 1; transform: translateY(0); }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(-10px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .show { display: flex; }

            #particleCanvas {
                position: absolute;
                top: 50%; left: 50%;
                transform: translate(-50%, -50%);
                width: 100%; height: 100%;
                pointer-events: none;
            }

            .hero {
                height: 100vh;
                background-size: cover;
                background-position: center;
                color: #fff;
                display: flex;
                align-items: center;
                text-align: center;
                justify-content: center;
                overflow: hidden;
            }

            .container {
                max-width: 1100px;
                margin: 0 auto;
                padding: 20px;
                opacity: 0;
                transform: translateY(30px);
                animation: fadeSlideIn 1s ease-out forwards;
            }

            @keyframes fadeSlideIn {
                from { opacity: 0; transform: translateY(30px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .btns { margin-top: 30px; opacity: 0; transform: translateY(20px); animation: fadeSlideIn 1.2s ease-out forwards 0.3s; }

            .btn-primary, .btn-secondary { padding: 12px 30px; border-radius: 5px; cursor: pointer; }
            .btn-primary { background-color: #2D8CFF; color: #fff; border: none; margin-right: 15px; }
            .btn-secondary { background-color: transparent; color: #2D8CFF; border: 1px solid #2D8CFF; }

            .mission-vision-section { padding: 60px 5%; background: transparent; position: relative; overflow: hidden; }
            .mission-vision-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 40px; max-width: 1200px; margin: 0 auto; position: relative; z-index: 2; }

            .mission-v-card {
                background: rgba(255, 255, 255, 0.08);
                backdrop-filter: blur(12px);
                border: 3px solid #2D8CFF;
                border-radius: 20px;
                padding: 25px;
                text-align: left;
                transition: all 0.5s ease;
                position: relative;
                overflow: hidden;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            }

            .card { border: 2px solid #2D8CFF; border-radius: 12px; }

            .mission-v-card:hover {
                background: rgba(255, 255, 255, 0.12);
                transform: scale(1.05);
                border-color: rgba(45, 140, 255, 0.6);
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
                z-index: 5;
            }

            .mission-v-card::before {
                content: '';
                position: absolute;
                top: -50%; left: -50%;
                width: 200%; height: 200%;
                background: radial-gradient(circle, rgba(45, 140, 255, 0.1) 0%, transparent 70%);
                opacity: 0;
                transition: opacity 0.5s ease;
            }

            .mission-v-card:hover::before { opacity: 1; }

            .mv-icon {
                font-size: 40px;
                margin-bottom: 15px;
                background: linear-gradient(135deg, #2D8CFF, #00C6FF);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                display: inline-block;
            }

            .mission-v-card h2 { font-size: 28px; font-weight: 700; color: #fff; margin-bottom: 15px; letter-spacing: -0.5px; }
            .mission-v-card p { font-size: 17px; color: rgba(255, 255, 255, 0.8); line-height: 1.8; margin: 0; }

            @media (max-width: 992px) {
                .mission-vision-grid { grid-template-columns: 1fr; }
                .mission-v-card { padding: 40px; }
            }

            .process-section { padding: 90px 5%; position: relative; }
            .process-section-header { text-align: center; margin-bottom: 70px; }
            .process-section-header h2 { font-size: 2.8rem; font-weight: 800; color: #fff; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 15px; }
            .process-section-header h2 span { color: #2D8CFF; }
            .process-section-header p { font-size: 1.1rem; color: rgba(255, 255, 255, 0.65); max-width: 600px; margin: 0 auto; opacity: 1; }

            .process-timeline {
                display: flex;
                align-items: flex-start;
                justify-content: center;
                flex-wrap: wrap;
                gap: 0;
                max-width: 1200px;
                margin: 0 auto;
                position: relative;
            }

            .process-timeline::before {
                content: '';
                position: absolute;
                top: 48px;
                left: 50%;
                transform: translateX(-50%);
                width: 80%;
                height: 2px;
                background: linear-gradient(90deg, transparent, rgba(45, 140, 255, 0.4), rgba(45, 140, 255, 0.4), transparent);
                z-index: 0;
            }

            .process-step {
                flex: 1;
                min-width: 150px;
                max-width: 200px;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                padding: 0 10px;
                position: relative;
                z-index: 1;
                cursor: default;
            }

            .process-icon-wrap {
                width: 96px; height: 96px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2rem;
                position: relative;
                margin-bottom: 22px;
                transition: all 0.4s ease;
                background: rgba(45, 140, 255, 0.12);
                border: 2px solid rgba(45, 140, 255, 0.5);
                backdrop-filter: blur(10px);
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
                color: #fff;
            }

            .process-step:hover .process-icon-wrap {
                transform: translateY(-6px) scale(1.1);
                background: rgba(45, 140, 255, 0.15);
                border-color: #2D8CFF;
                box-shadow: 0 16px 40px rgba(45, 140, 255, 0.2);
                color: #fff;
            }

            .process-icon-wrap .step-num {
                position: absolute;
                top: -6px; right: -6px;
                width: 26px; height: 26px;
                background: linear-gradient(135deg, #2D8CFF, #00C6FF);
                border-radius: 50%;
                font-size: 11px;
                font-weight: 800;
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                border: 2px solid rgba(255, 255, 255, 0.3);
            }

            .process-step h3 { font-size: 1rem; font-weight: 700; color: #fff; margin-bottom: 8px; letter-spacing: 0.5px; }
            .process-step p { font-size: 0.88rem; color: rgba(255, 255, 255, 0.9); line-height: 1.6; margin: 0; font-weight: 500; }

            .process-support-card {
                max-width: 900px;
                margin: 60px auto 0;
                background: linear-gradient(135deg, rgba(45, 140, 255, 0.15), rgba(0, 198, 255, 0.08));
                border: 1px solid rgba(45, 140, 255, 0.4);
                border-radius: 20px;
                padding: 40px 50px;
                display: flex;
                align-items: center;
                gap: 35px;
                backdrop-filter: blur(12px);
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
                transition: all 0.4s ease;
                position: relative;
                overflow: hidden;
            }

            .process-support-card::before {
                content: '';
                position: absolute;
                top: -50%; right: -20%;
                width: 300px; height: 300px;
                background: radial-gradient(circle, rgba(45, 140, 255, 0.08), transparent 70%);
                pointer-events: none;
            }

            .process-support-card:hover {
                border-color: rgba(45, 140, 255, 0.7);
                box-shadow: 0 20px 50px rgba(45, 140, 255, 0.15);
                transform: translateY(-4px);
            }

            .support-icon-box {
                width: 70px; height: 70px; min-width: 70px;
                border-radius: 18px;
                background: linear-gradient(135deg, #2D8CFF, #00C6FF);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.8rem;
                color: #fff;
                box-shadow: 0 8px 25px rgba(45, 140, 255, 0.35);
            }

            .support-content h3 { font-size: 1.4rem; font-weight: 800; color: #fff; margin-bottom: 8px; }
            .support-content p { font-size: 1rem; color: rgba(255, 255, 255, 0.7); margin: 0; line-height: 1.7; opacity: 1; }

            .support-badge {
                background: linear-gradient(135deg, #2D8CFF, #00C6FF);
                color: #fff;
                font-size: 0.72rem;
                font-weight: 800;
                padding: 4px 12px;
                border-radius: 20px;
                letter-spacing: 1px;
                text-transform: uppercase;
                display: inline-block;
                margin-bottom: 12px;
            }

            .about-section {
                display: flex;
                align-items: center;
                gap: 40px;
                flex-wrap: wrap;
                border-radius: 10px;
                overflow: hidden;
                background-color: #e6f5ff;
                padding: 40px;
            }

            .products-container {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 25px;
                padding: 40px;
                max-width: 1200px;
            }

            .product-card {
                background: white;
                padding: 30px;
                text-align: center;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                position: relative;
                overflow: hidden;
            }

            .large-card { min-height: 200px; }

            .product-icon-wrapper {
                background: #007bff1a;
                padding: 15px;
                border-radius: 50%;
                display: inline-block;
                margin-bottom: 15px;
                transition: background 0.3s ease;
            }

            .product-icon { font-size: 38px; color: #007bff; transition: color 0.3s ease; }
            .product-title { font-size: 22px; font-weight: bold; margin: 10px 0; }
            .product-description { font-size: 16px; color: #555; line-height: 1.5; text-align: center; }

            .product-card:hover {
                background-color: #007bff;
                color: white;
                transform: translateY(-8px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .product-card:hover .product-title,
            .product-card:hover .product-description { color: white; }
            .product-card:hover .product-icon-wrapper { background: white; }
            .product-card:hover .product-icon { color: #007bff; }

            .contact-section {
                padding: 80px 5%;
                display: flex;
                justify-content: center;
            }

            .contact-container {
                display: flex;
                gap: 50px;
                max-width: 1100px;
                width: 100%;
                background: rgba(255, 255, 255, 0.15);
                backdrop-filter: blur(10px);
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            }

            .contact-form, .contact-info { flex: 1; padding: 20px; }
            .contact-form h2, .contact-info h2 { font-size: 2rem; color: #003366; margin-bottom: 20px; font-weight: 700; }

            .send-btn { width: 100%; padding: 12px; font-size: 1.2rem; font-weight: bold; color: white; background: #007bff; border: none; border-radius: 8px; cursor: pointer; transition: 0.3s ease; }
            .send-btn:hover { background: #0056b3; }

            /* Inline message box */
            #msgBox {
                display: none;
                margin-top: 12px;
                padding: 10px 16px;
                border-radius: 6px;
                font-family: 'Poppins', sans-serif;
                font-size: 14px;
                font-weight: 500;
            }

            .chat-assistant {
                margin-top: 20px;
                padding: 15px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                backdrop-filter: blur(10px);
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            .chat-box { max-height: 150px; overflow-y: auto; padding: 10px; border-radius: 8px; background: rgba(255, 255, 255, 0.1); margin-bottom: 10px; }
            .bot-message, .user-message { padding: 8px 12px; margin: 5px 0; border-radius: 5px; display: inline-block; }
            .bot-message { background: #007bff; color: white; align-self: flex-start; }
            .user-message { background: #34c759; color: white; align-self: flex-end; }
            .chat-input { display: flex; gap: 10px; }
            .chat-input input { flex: 1; padding: 8px; border: 1px solid #ccc; border-radius: 5px; }
            .chat-input button { padding: 8px 12px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
            .chat-input button:hover { background: #0056b3; }

            .floating-chat-btn {
                position: fixed;
                bottom: 30px; right: 30px;
                width: 60px; height: 60px;
                background-color: #25D366;
                color: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 30px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                cursor: pointer;
                z-index: 10000;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .floating-chat-btn:hover { transform: scale(1.1); box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3); }

            .floating-chat-window {
                position: fixed;
                bottom: 100px; right: 30px;
                width: 320px;
                background: white;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                z-index: 10000;
                display: none;
                flex-direction: column;
                overflow: hidden;
            }

            .chat-window-header { background: linear-gradient(135deg, #0b1a30, #2D8CFF); color: white; padding: 15px; text-align: center; position: relative; }
            .chat-window-header h3 { margin: 0; font-size: 18px; font-weight: 700; }
            .chat-window-header p { margin: 5px 0 0; font-size: 13px; opacity: 0.9; }
            .chat-window-close { position: absolute; top: 10px; right: 15px; color: white; cursor: pointer; font-size: 20px; }
            .chat-window-body { padding: 20px; }
            .chat-window-input { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 8px; margin-bottom: 15px; font-size: 14px; outline: none; transition: border-color 0.3s; box-sizing: border-box; }
            .chat-window-input:focus { border-color: #2D8CFF; }
            .chat-window-send { width: 100%; padding: 12px; background-color: #25D366; color: white; border: none; border-radius: 8px; font-size: 16px; font-weight: bold; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 8px; transition: background-color 0.3s; }
            .chat-window-send:hover { background-color: #1ebe57; }

            .features-section {
                padding: 60px 20px;
                background: linear-gradient(135deg, rgba(11, 26, 48, 0.9), rgba(45, 140, 255, 0.1));
                text-align: center;
                border-top: 1px solid rgba(255, 255, 255, 0.05);
                border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            }

            .features-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; max-width: 1200px; margin: 0 auto; }

            .feature-card {
                background: rgba(255, 255, 255, 0.03);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.05);
                border-radius: 12px;
                padding: 40px 20px;
                color: white;
                transition: transform 0.3s ease, background 0.3s ease, box-shadow 0.3s ease;
            }

            .feature-card:hover { transform: translateY(-10px); background: rgba(255, 255, 255, 0.08); box-shadow: 0 10px 30px rgba(45, 140, 255, 0.15); border-color: rgba(45, 140, 255, 0.3); }
            .feature-icon { font-size: 40px; color: #2D8CFF; margin-bottom: 20px; display: inline-block; transition: transform 0.3s ease; }
            .feature-card:hover .feature-icon { transform: scale(1.1) rotate(5deg); }
            .feature-title { font-size: 1.3rem; margin-bottom: 15px; font-weight: 600; }
            .feature-description { font-size: 0.95rem; line-height: 1.6; opacity: 0.8; margin: 0; }

            .hero h1 { animation: textGlow 2s infinite alternate; }
            @keyframes textGlow {
                from { text-shadow: 0 0 10px rgba(45, 140, 255, 0.5), 0 0 20px rgba(45, 140, 255, 0.3); }
                to { text-shadow: 0 0 20px rgba(45, 140, 255, 0.8), 0 0 30px rgba(45, 140, 255, 0.6); }
            }

            /* ========== RESPONSIVE ========== */
            @media (max-width: 768px) {
                h1 { font-size: 28px !important; }
                h2 { font-size: 24px !important; }
                h4 { font-size: 1.8rem !important; }
                .navbar { padding: 0 20px; height: 60px; }
                .menu-icon { display: block; }
                .nav-links {
                    display: flex;
                    flex-direction: column;
                    gap: 20px;
                    text-align: left;
                    background-color: #ffffff;
                    position: fixed;
                    top: 0; right: -400px;
                    width: 75%; height: 100vh;
                    box-shadow: -10px 0 20px rgba(0, 0, 0, 0.1);
                    padding: 80px 30px;
                    transition: right 0.4s ease-in-out;
                    z-index: 1000;
                    overflow-y: auto;
                }
                .nav-links.active { right: 0; }
                .close-icon { display: block; position: absolute; top: 20px; left: 20px; font-size: 30px; cursor: pointer; }
                .hero { padding: 100px 0 60px; min-height: auto; text-align: center; }
                .hero h1 { font-size: 26px !important; line-height: 1.3; }
                .hero p { font-size: 15px; margin-bottom: 30px; }
                #particleCanvas { display: none; }
                .mission-vision-grid { grid-template-columns: 1fr; gap: 20px; }
                .mission-v-card { padding: 30px 20px; }
                .about-section { flex-direction: column; gap: 30px; text-align: center; }
                .products-container, .features-grid { grid-template-columns: 1fr !important; gap: 20px !important; }
                .product-card, .feature-card { width: 100% !important; max-width: none !important; margin: 0 auto; }
                .process-timeline { flex-direction: column; align-items: flex-start; padding-left: 20px; }
                .process-timeline::before { left: 45px; top: 0; width: 2px; height: 100%; transform: none; background: linear-gradient(180deg, transparent, rgba(45, 140, 255, 0.4), rgba(45, 140, 255, 0.4), transparent); }
                .process-step { flex-direction: row; text-align: left; max-width: none; gap: 20px; margin-bottom: 40px; padding: 0; }
                .process-icon-wrap { width: 60px; height: 60px; min-width: 60px; font-size: 1.2rem; margin-bottom: 0; }
                .process-support-card { flex-direction: column; padding: 30px 20px; text-align: center; gap: 20px; }
                .support-icon-box { margin: 0 auto; }
                .contact-container { flex-direction: column; gap: 40px; }
                .contact-form { padding: 30px 20px; }
                #expertise > div { flex-direction: column !important; align-items: center; }
                #expertise .product-card { width: 100% !important; max-width: none !important; }
            }

            @media (min-width: 769px) { .close-icon { display: none; } }
        </style>
    </head>

    <body>
        <form runat="server">

            <%-- App popup REMOVED — hidden permanently --%>
            <div class="app-popup-overlay" id="appPopup" style="display:none !important;">
                <div class="app-popup-container">
                    <span class="app-popup-close" onclick="closeAppPopup()">&times;</span>
                    <div class="app-popup-header">
                        <i class="fas fa-bell"></i>
                        <h3>Great News!</h3>
                    </div>
                    <div class="app-popup-content">
                        <p>Our <strong>Safety Tool</strong> app is now available on both platforms!</p>
                        <p class="quote">"Safety isn't expensive, it's priceless."</p>
                        <div class="download-buttons">
                            <a href="https://play.google.com/store/apps/details?id=com.vivify.safety&hl=en"
                                class="download-btn android" id="androidDownload">
                                <i class="fab fa-android"></i> Download for Android
                            </a>
                            <a href="https://apps.apple.com/in/app/vivify-safety/id6743709010" class="download-btn ios"
                                id="iosDownload">
                                <i class="fab fa-apple"></i> Download for iOS
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="navbar">
                <a href="#" class="logo">
                    <img src="assets/img/updated_Logo.jpeg" alt="Client Logo">
                </a>
                <div class="menu-icon" id="menuIcon" onclick="toggleMenu()">&#9776;</div>
                <div class="nav-links" id="navLinks">
                    <div class="close-icon" onclick="toggleMenu()">&times;</div>
                    <a href="#home" onclick="toggleMenu()"><i class="fas fa-home" style="margin-right:5px;"></i> Home</a>
                    <a href="#missionvission" onclick="toggleMenu()"><i class="fas fa-bullseye" style="margin-right:5px;"></i> Mission</a>
                    <a href="#about" onclick="toggleMenu()"><i class="fas fa-info-circle" style="margin-right:5px;"></i> About</a>
                    <a href="#process" onclick="toggleMenu()"><i class="fas fa-sync" style="margin-right:5px;"></i> Process</a>
                    <a href="#products&services" onclick="toggleMenu()"><i class="fas fa-cogs" style="margin-right:5px;"></i> Services</a>
                    <a href="#expertise" onclick="toggleMenu()"><i class="fas fa-laptop-code" style="margin-right:5px;"></i> Expertise</a>
                    <a href="#why-choose-us" onclick="toggleMenu()"><i class="fas fa-check-circle" style="margin-right:5px;"></i> Why Us</a>
                    <a href="#contact" onclick="toggleMenu()"><i class="fas fa-envelope" style="margin-right:5px;"></i> Contact</a>
                </div>
                <button type="button" class="custom-btn-primary" id="openPopupBtn">Login</button>
            </div>

            <!-- Login Popup -->
            <div class="custom-popup-overlay" id="popupOverlay">
                <div class="custom-popup">
                    <span class="custom-close-btn" id="closePopupBtn">&times;</span>
                    <h2 class="popup-title">Choose Your Service</h2>
                    <div class="popup-content">
                        <a href="https://vivifysoft.in/safety/#/AdminLogin" class="custom-popup-item">🦺 Safety Tool</a>
                        <a href="https://vivifysoft.in/Login.aspx" class="custom-popup-item">💵 Reimbursement</a>
                        <a href="https://vivifysoft.in/employeehub/" class="custom-popup-item">👥 Employee Hub</a>
                    </div>
                </div>
            </div>

            <div class="overlay" id="overlay" onclick="toggleMenu()"></div>

            <div id="home">
                <section class="hero">
                    <div class="container">
                        <h4 style="color: white;">IT Solutions and Services Company</h4>
                        <h1 id="typingHero"></h1>
                        <p style="color: white;">Software developer specializing in HR management, Safety Management, and inventory management solutions.</p>
                        <canvas id="particleCanvas"></canvas>
                    </div>
                </section>
            </div>

            <div id="missionvission" class="visible">
                <section class="mission-vision-section">
                    <h4 style="text-align: center; color:white; font-size: 2.5rem; text-transform: uppercase; border-bottom: 4px solid #007bff; margin-bottom: 40px; display: block; width: fit-content; margin-left: auto; margin-right: auto;">Our Mission & Vision</h4>
                    <div class="mission-vision-grid">
                        <div class="mission-v-card">
                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                                <h2 style="margin: 0;">Our Mission</h2>
                                <i class="fas fa-bullseye mv-icon" style="margin: 0;"></i>
                            </div>
                            <div>
                                <p>To deliver exceptional IT services through innovation, transparency, and a relentless focus on client success. We empower businesses with modern technological tools that simplify complexity and drive growth on a global scale.</p>
                            </div>
                        </div>
                        <div class="mission-v-card">
                            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                                <h2 style="margin: 0;">Our Vision</h2>
                                <i class="fas fa-eye mv-icon" style="margin: 0;"></i>
                            </div>
                            <div>
                                <p>To become a globally recognized leader in software innovation, setting new standards for quality and efficiency. We envision a future where every business, regardless of size, can leverage high-end technology to reach its full potential.</p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div id="about" style="max-width: 1200px; margin: auto; padding: 50px 20px;">
                <h4 style="text-align: center; color:white; font-size: 2.5rem; text-transform: uppercase; border-bottom: 4px solid #007bff; margin-bottom: 20px; display: block; width: fit-content; margin-left: auto; margin-right: auto;">About US</h4>
                <div class="about-section" style="display: flex; align-items: center; gap: 40px; flex-wrap: wrap;">
                    <div style="flex: 1; min-width: 300px;">
                        <h1 style="color: #333; font-size: 2rem;">Founded in 2024 and based in Chennai, India. <span style="color: #007bff;">IT Solutions</span></h1>
                        <p style="line-height: 1.8; font-size: 18px; color: #555; padding-top: 20px;">
                            Founded in 2024 and based in Chennai, India. Vivify Soft is a trusted resource for web/mobile-based solutions. Our products are used by multiple companies in various regions. We have a strong reputation in the Safety and Retail industry. Our products help increase customer revenue to grow faster. Our skilled team delivers the application on time with quality.
                        </p>
                    </div>
                    <div style="flex: 1; min-width: 300px; text-align: center;">
                        <img src="assets/img/vs-about.png" alt="About Us Image" style="max-width: 100%; height: auto; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
                    </div>
                </div>
            </div>

            <div id="process" class="visible">
                <section class="process-section">
                    <div class="process-section-header">
                        <h2 style="display: block; width: fit-content; margin: 0 auto 15px; border-bottom: 4px solid #2D8CFF; padding-bottom: 5px;">Our <span>Process</span></h2>
                        <p>A proven, step-by-step approach that transforms your vision into a powerful digital product — on time, every time.</p>
                    </div>
                    <div class="process-timeline">
                        <div class="process-step">
                            <div class="process-icon-wrap"><i class="fas fa-lightbulb"></i><span class="step-num">1</span></div>
                            <h3>Planning</h3>
                            <p>Deep discovery of your goals, target audience, and technical requirements.</p>
                        </div>
                        <div class="process-step">
                            <div class="process-icon-wrap"><i class="fas fa-pencil-ruler"></i><span class="step-num">2</span></div>
                            <h3>Designing</h3>
                            <p>Crafting intuitive UI/UX wireframes and pixel-perfect prototypes.</p>
                        </div>
                        <div class="process-step">
                            <div class="process-icon-wrap"><i class="fas fa-code"></i><span class="step-num">3</span></div>
                            <h3>Development</h3>
                            <p>Agile coding with best practices, scalable architecture and clean code.</p>
                        </div>
                        <div class="process-step">
                            <div class="process-icon-wrap"><i class="fas fa-vial"></i><span class="step-num">4</span></div>
                            <h3>Testing</h3>
                            <p>Rigorous QA, performance testing and bug-free delivery guaranteed.</p>
                        </div>
                        <div class="process-step">
                            <div class="process-icon-wrap"><i class="fas fa-rocket"></i><span class="step-num">5</span></div>
                            <h3>Launch</h3>
                            <p>Smooth, zero-downtime deployment to production with full monitoring.</p>
                        </div>
                    </div>
                    <div class="process-support-card">
                        <div class="support-icon-box"><i class="fas fa-headset"></i></div>
                        <div class="support-content">
                            <span class="support-badge">♾ Lifetime Commitment</span>
                            <h3>Post-Launch Lifetime Support</h3>
                            <p>We don't disappear after go-live. Our dedicated team provides ongoing maintenance, updates, security patches, and 24/7 technical support — so your product stays fast, secure, and ahead of the curve, forever.</p>
                        </div>
                    </div>
                </section>
            </div>

            <style>
                .tech-marquee-section { background: transparent; padding: 40px 0 20px 0; overflow: hidden; position: relative; }
                .tech-marquee-wrapper { display: flex; width: 200%; animation: marqueeScroll 20s linear infinite; }
                .tech-marquee-content { display: flex; justify-content: space-around; width: 100%; }
                .tech-item { display: flex; flex-direction: column; align-items: center; gap: 10px; color: rgba(255, 255, 255, 0.7); transition: all 0.3s ease; }
                .tech-item i { font-size: 60px; }
                .tech-item span { font-size: 16px; font-weight: 600; letter-spacing: 1px; }
                .tech-item:hover { color: #2D8CFF; transform: scale(1.1); }
                @keyframes marqueeScroll { 0% { transform: translateX(0); } 100% { transform: translateX(-50%); } }
            </style>

            <div class="tech-marquee-section">
                <div class="tech-marquee-wrapper">
                    <div class="tech-marquee-content">
                        <div class="tech-item"><i class="devicon-jira-plain" title="Jira"></i><span>Jira</span></div>
                        <div class="tech-item"><i class="devicon-dotnetcore-plain" title=".NET"></i><span>.NET</span></div>
                        <div class="tech-item"><i class="devicon-azuresqldatabase-plain" title="SQL"></i><span>SQL</span></div>
                        <div class="tech-item"><i class="devicon-react-original" title="React"></i><span>React</span></div>
                        <div class="tech-item"><i class="devicon-javascript-plain" title="JavaScript"></i><span>JavaScript</span></div>
                        <div class="tech-item"><i class="devicon-html5-plain" title="HTML5"></i><span>HTML5</span></div>
                        <div class="tech-item"><i class="devicon-css3-plain" title="CSS3"></i><span>CSS3</span></div>
                        <div class="tech-item"><i class="devicon-git-plain" title="Git"></i><span>Git</span></div>
                    </div>
                    <div class="tech-marquee-content">
                        <div class="tech-item"><i class="devicon-jira-plain" title="Jira"></i><span>Jira</span></div>
                        <div class="tech-item"><i class="devicon-dotnetcore-plain" title=".NET"></i><span>.NET</span></div>
                        <div class="tech-item"><i class="devicon-azuresqldatabase-plain" title="SQL"></i><span>SQL</span></div>
                        <div class="tech-item"><i class="devicon-react-original" title="React"></i><span>React</span></div>
                        <div class="tech-item"><i class="devicon-javascript-plain" title="JavaScript"></i><span>JavaScript</span></div>
                        <div class="tech-item"><i class="devicon-html5-plain" title="HTML5"></i><span>HTML5</span></div>
                        <div class="tech-item"><i class="devicon-css3-plain" title="CSS3"></i><span>CSS3</span></div>
                        <div class="tech-item"><i class="devicon-git-plain" title="Git"></i><span>Git</span></div>
                    </div>
                </div>
            </div>

            <div id="products&services">
                <h4 style="text-align: center; color:white; font-size: 2.5rem; text-transform: uppercase; border-bottom: 4px solid #007bff; margin-bottom: 20px; display: block; width: fit-content; margin-left: auto; margin-right: auto;">Products & Services</h4>
                <section class="products-container">
                    <div class="product-card large-card">
                        <div class="product-icon-wrapper"><i class="fas fa-shield-alt product-icon"></i></div>
                        <h3 class="product-title">Safety Toolbox</h3>
                        <p class="product-description">The Mobile App and Web Application ensure employee safety compliance effectively using geofencing, track training video completion, and provide comprehensive report analytics for administrators.</p>
                    </div>
                    <div class="product-card large-card">
                        <div class="product-icon-wrapper"><i class="fas fa-boxes product-icon"></i></div>
                        <h3 class="product-title">Inventory Management</h3>
                        <p class="product-description">Inventory management encompasses the processes of ordering, storing, using, and selling a company's inventory, including raw materials, components, and finished products, aiming to optimize stock levels and minimize costs.</p>
                    </div>
                    <div class="product-card large-card">
                        <div class="product-icon-wrapper"><i class="fas fa-user-tie product-icon"></i></div>
                        <h3 class="product-title">HR Management</h3>
                        <p class="product-description">A set of applications that help HR professionals manage their organization's human resources. It helps with tasks like biometric, employee leaves, payroll, onboarding and advance amount management.</p>
                    </div>
                    <div class="product-card large-card">
                        <div class="product-icon-wrapper"><i class="fas fa-chart-bar product-icon"></i></div>
                        <h3 class="product-title">Aggregator Expense Reimbursement</h3>
                        <p class="product-description">This system helps employees easily navigate the process of submitting reimbursement requests through our website.</p>
                    </div>
                </section>
            </div>

            <div id="expertise" style="padding: 40px 20px; text-align: center;">
                <h4 style="color:white; font-size: 2.5rem; text-transform: uppercase; border-bottom: 4px solid #007bff; margin-bottom: 20px; display: block; width: fit-content; margin-left: auto; margin-right: auto;">What We Build</h4>
                <p style="color: white; max-width: 700px; margin: 0 auto 50px; font-size: 1.1rem;">We specialize in crafting high-performance digital solutions across different platforms to empower your business.</p>
                <div style="display: flex; gap: 30px; justify-content: center; flex-wrap: wrap; max-width: 1200px; margin: 0 auto 40px;">
                    <div class="product-card large-card" style="flex: 1; min-width: 300px; max-width: 400px;">
                        <div class="product-icon-wrapper"><i class="fas fa-laptop-code product-icon"></i></div>
                        <h3 class="product-title">Web Applications</h3>
                        <p class="product-description">Custom, responsive, and highly secure web applications tailored to streamline your business operations and engage users.</p>
                    </div>
                    <div class="product-card large-card" style="flex: 1; min-width: 300px; max-width: 400px;">
                        <div class="product-icon-wrapper"><i class="fas fa-mobile-alt product-icon"></i></div>
                        <h3 class="product-title">Mobile Applications</h3>
                        <p class="product-description">Native and cross-platform mobile apps designed for intuitive user experiences, optimal performance, and broad reach.</p>
                    </div>
                </div>
            </div>

            <div id="why-choose-us" class="features-section">
                <h4 style="color:white; font-size: 2.5rem; text-transform: uppercase; border-bottom: 4px solid #007bff; margin-bottom: 20px; display: block; width: fit-content; margin-left: auto; margin-right: auto;">Why Choose Us?</h4>
                <p style="color: white; max-width: 700px; margin: 0 auto 50px; font-size: 1.1rem;">We don't just write code; we build strategic partnerships that drive measurable business growth.</p>
                <div class="features-grid">
                    <div class="feature-card"><i class="fas fa-rocket feature-icon"></i><h3 class="feature-title">Fast & Performant</h3><p class="feature-description">Our solutions are optimized for lightning-fast speeds, ensuring high conversion rates and seamless user experiences.</p></div>
                    <div class="feature-card"><i class="fas fa-lock feature-icon"></i><h3 class="feature-title">Secure</h3><p class="feature-description">We implement robust, top-tier security protocols to keep your data, applications, and users safe from modern threats.</p></div>
                    <div class="feature-card"><i class="fas fa-headset feature-icon"></i><h3 class="feature-title">24/7 Dedicated Support</h3><p class="feature-description">We offer round-the-clock maintenance and proactive support to ensure your platforms run flawlessly at all times.</p></div>
                    <div class="feature-card"><i class="fas fa-layer-group feature-icon"></i><h3 class="feature-title">Scalable Architecture</h3><p class="feature-description">We build with the future in mind. Our adaptable architectures grow effortlessly alongside your expanding business.</p></div>
                </div>
            </div>

            <div id="contact">
                <h4 style="text-align: center; color:white; font-size: 2.5rem; text-transform: uppercase; border-bottom: 4px solid #007bff; margin-bottom: 20px; display: block; width: fit-content; margin-left: auto; margin-right: auto;">Contact US</h4>
                <section class="contact-section">
                    <div class="contact-container">
                        <div class="contact-info">
                            <h2 style="color: white; margin-bottom: 30px;">Contact Information</h2>
                            <p style="color: white; font-size: 1.1rem; margin-bottom: 20px;">
                                <i class="fas fa-envelope" style="color: #2D8CFF; margin-right: 10px;"></i>
                                <strong style="color: #2D8CFF; margin-right: 5px;">Email:</strong> itsupport@vivifysoft.in
                            </p>
                            <p style="color: white; font-size: 1.1rem; margin-bottom: 20px;">
                                <i class="fas fa-phone-alt" style="color: #2D8CFF; margin-right: 10px;"></i>
                                <strong style="color: #2D8CFF; margin-right: 5px;">Phone:</strong> +91 8838966643
                            </p>
                            <p style="color: white; font-size: 1.1rem; margin-bottom: 20px;">
                                <i class="fas fa-map-marker-alt" style="color: #2D8CFF; margin-right: 10px;"></i>
                                <strong style="color: #2D8CFF; margin-right: 5px;">Location:</strong>
                                3 & 4, Mogappair road, No. 2B, 1st Floor, Padi, Chennai - 600050
                            </p>
                            <div class="chat-assistant">
                                <h3>Chat Assistant</h3>
                                <div class="chat-box" id="chat-box">
                                    <p class="bot-message">Hello! How can I assist you?</p>
                                </div>
                                <div class="chat-input">
                                    <input type="text" id="userMessage" placeholder="Type your message..." />
                                    <button onclick="sendMessage()">Send</button>
                                </div>
                            </div>
                        </div>

                        <div class="contact-form">
                            <h2 style="color: white;">Get in Touch</h2>
                            <form>
                                <asp:TextBox ID="txtName" runat="server" placeholder="Name"
                                    style="width: 100%; padding: 10px; margin: 5px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;"
                                    required></asp:TextBox>

                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"
                                    style="width: 100%; padding: 10px; margin: 5px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;"
                                    required></asp:TextBox>

                                <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone"
                                    style="width: 100%; padding: 10px; margin: 5px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;">
                                </asp:TextBox>

                                <asp:TextBox ID="txtSubject" runat="server" placeholder="Subject"
                                    style="width: 100%; padding: 10px; margin: 5px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;"
                                    required></asp:TextBox>

                                <asp:TextBox ID="txtMessage" runat="server" placeholder="Message" TextMode="MultiLine"
                                    style="width: 100%; padding: 10px; margin: 5px 0; border: 1px solid #ccc; border-radius: 5px; font-size: 16px; height: 120px;"
                                    required></asp:TextBox>

                                <asp:Button ID="btnSend" runat="server" Text="Send Message"
                                    style="width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; font-size: 18px; cursor: pointer; margin-top: 10px;"
                                    OnMouseOver="this.style.backgroundColor='#0056b3';"
                                    OnMouseOut="this.style.backgroundColor='#007bff';" OnClick="btnSend_Click" />

                                <%-- Inline success/error message shown by Home.aspx.cs ShowMessage() --%>
                                <div id="msgBox" style="display:none;"></div>

                            </form>
                        </div>
                    </div>
                </section>
            </div>

        </form>

        <!-- Professional Footer -->
        <style>
            .pro-footer { background-color: #0a2a5e; color: rgba(255, 255, 255, 0.8); padding: 70px 0 20px; font-family: 'Poppins', sans-serif; border-top: 1px solid rgba(255, 255, 255, 0.1); position: relative; z-index: 10; }
            .pro-footer-container { max-width: 1200px; margin: 0 auto; padding: 0 5%; display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 50px; }
            .pro-footer-col h3 { color: #fff; font-size: 1.4rem; font-weight: 700; margin-bottom: 25px; position: relative; display: inline-block; }
            .pro-footer-col h3::after { content: ''; position: absolute; left: 0; bottom: -8px; width: 40px; height: 3px; background: #2D8CFF; border-radius: 2px; }
            .pro-footer-logo h2 { color: #fff; font-size: 2rem; font-weight: 800; margin-bottom: 15px; letter-spacing: 1px; }
            .pro-footer-logo h2 span { color: #2D8CFF; }
            .pro-footer-text { font-size: 0.95rem; line-height: 1.8; margin-bottom: 25px; }
            .pro-footer-links ul { list-style: none; padding: 0; margin: 0; }
            .pro-footer-links li { margin-bottom: 15px; }
            .pro-footer-links a { color: rgba(255, 255, 255, 0.7); text-decoration: none; font-size: 0.95rem; transition: all 0.3s ease; display: inline-flex; align-items: center; gap: 8px; }
            .pro-footer-links a i { font-size: 0.75rem; color: #2D8CFF; transition: transform 0.3s ease; }
            .pro-footer-links a:hover { color: #2D8CFF; }
            .pro-footer-links a:hover i { transform: translateX(5px); }
            .pro-footer-contact p { display: flex; align-items: flex-start; gap: 15px; font-size: 0.95rem; margin-bottom: 20px; line-height: 1.6; }
            .pro-footer-contact p i { color: #2D8CFF; font-size: 1.2rem; margin-top: 4px; }
            .pro-footer-bottom { margin-top: 60px; padding: 25px 5%; border-top: 1px solid rgba(255, 255, 255, 0.1); text-align: center; background-color: #08214a; }
            .pro-footer-bottom p { font-size: 0.95rem; margin: 0; color: #777; }
            .pro-footer-bottom p strong { color: #fff; }
            @media (max-width: 768px) { .pro-footer { padding: 50px 0 0; } .pro-footer-container { gap: 40px; } }
        </style>

        <footer class="pro-footer">
            <div class="pro-footer-container">
                <div class="pro-footer-col pro-footer-logo">
                    <h2>Vivify<span>Soft</span></h2>
                    <p class="pro-footer-text">Empowering businesses with cutting-edge IT solutions for efficiency and seamless transformation. We deliver robust applications safely and continuously map business strategy to scalable products.</p>
                </div>
                <div class="pro-footer-col pro-footer-links">
                    <h3>Explore</h3>
                    <ul>
                        <li><a href="#about"><i class="fas fa-chevron-right"></i> Who We Are</a></li>
                        <li><a href="#process"><i class="fas fa-chevron-right"></i> Our Process</a></li>
                        <li><a href="#products&services"><i class="fas fa-chevron-right"></i> What We Offer</a></li>
                        <li><a href="#expertise"><i class="fas fa-chevron-right"></i> Expertise</a></li>
                        <li><a href="#why-choose-us"><i class="fas fa-chevron-right"></i> Why Choose Us</a></li>
                        <li><a href="#contact"><i class="fas fa-chevron-right"></i> Get in Touch</a></li>
                    </ul>
                </div>
                <div class="pro-footer-col pro-footer-contact">
                    <h3>Reach Out</h3>
                    <p><i class="fas fa-map-marker-alt"></i><span>3 & 4, Mogappair road, No. 2B,<br> 1st Floor, Padi, Chennai - 600050</span></p>
                    <p><i class="fas fa-phone-alt"></i><span>+91 8838966643</span></p>
                    <p><i class="fas fa-envelope"></i><span>itsupport@vivifysoft.in</span></p>
                </div>
            </div>
            <div class="pro-footer-bottom">
                <p>&copy; 2026 <strong>Vivify Soft</strong>. All Rights Reserved.</p>
            </div>
        </footer>

        <div class="floating-chat-btn" onclick="toggleFloatingChat()">
            <i class="fab fa-whatsapp"></i>
        </div>

        <div class="floating-chat-window" id="floatingChatWindow">
            <div class="chat-window-header">
                <span class="chat-window-close" onclick="toggleFloatingChat()">&times;</span>
                <h3>Vivify Soft</h3>
                <p>We're here to help! Send us a message.</p>
            </div>
            <div class="chat-window-body">
                <input type="text" id="floatingChatMessage" class="chat-window-input" placeholder="Type your message here..." />
                <button class="chat-window-send" onclick="sendFloatingMessage()">
                    <i class="fas fa-paper-plane"></i> Send via WhatsApp
                </button>
            </div>
        </div>

        <script>
            // ======================================================
            // NOTE: App download popup has been REMOVED.
            // The two triggers below are commented out intentionally.
            // ======================================================

            // REMOVED: document.addEventListener("DOMContentLoaded", function () {
            //     if (!localStorage.getItem("appPopupClosed")) {
            //         document.getElementById("appPopup").style.display = "block";
            //     }
            // });

            document.addEventListener("DOMContentLoaded", function () {

                function toggleMenu() {
                    const navLinks = document.getElementById("navLinks");
                    const overlay = document.getElementById("overlay");
                    const menuIcon = document.getElementById("menuIcon");
                    const closeIcon = document.querySelector(".close-icon");
                    const isActive = navLinks.classList.toggle("active");
                    overlay.classList.toggle("active");
                    if (isActive) {
                        menuIcon.style.display = "none";
                        closeIcon.style.display = "block";
                    } else {
                        menuIcon.style.display = "block";
                        closeIcon.style.display = "none";
                    }
                }

                document.getElementById("menuIcon").addEventListener("click", toggleMenu);
                document.querySelector(".close-icon").addEventListener("click", toggleMenu);

                const openPopupBtn = document.getElementById("openPopupBtn");
                const closePopupBtn = document.getElementById("closePopupBtn");
                const popupOverlay = document.getElementById("popupOverlay");

                if (openPopupBtn && closePopupBtn && popupOverlay) {
                    openPopupBtn.addEventListener("click", function () { popupOverlay.classList.add("show"); });
                    closePopupBtn.addEventListener("click", function () { popupOverlay.classList.remove("show"); });
                    popupOverlay.addEventListener("click", function (event) {
                        if (event.target === popupOverlay) { popupOverlay.classList.remove("show"); }
                    });
                }

                const baseText = "WE PROVIDE INNOVATIVE NEW PRODUCTS & IT SOLUTIONS FOR ";
                const loopingWords = "YOUR BUSINESS";
                const typingTarget = document.getElementById("typingHero");
                let textIndex = 0;
                let isDeleting = false;

                function typeEffect() {
                    const fullText = baseText + loopingWords;
                    if (!isDeleting) {
                        typingTarget.innerText = fullText.substring(0, textIndex + 1);
                        textIndex++;
                        if (textIndex === fullText.length) {
                            setTimeout(() => { isDeleting = true; typeEffect(); }, 2000);
                            return;
                        }
                    } else {
                        if (textIndex > baseText.length) {
                            typingTarget.innerText = fullText.substring(0, textIndex - 1);
                            textIndex--;
                        } else {
                            isDeleting = false;
                        }
                    }
                    setTimeout(typeEffect, isDeleting ? 40 : 70);
                }

                typeEffect();

                AOS.init({ duration: 800, once: true, offset: 0, disable: false });

                setTimeout(() => {
                    const mission = document.getElementById('missionvission');
                    if (mission) mission.classList.add('visible');
                }, 300);

                // REMOVED: App popup setTimeout trigger
                // if (!localStorage.getItem("appPopupClosed")) {
                //     setTimeout(() => {
                //         const appPopup = document.getElementById('appPopup');
                //         if (appPopup) appPopup.style.display = 'flex';
                //     }, 2000);
                // }

                // Download button handlers (kept in case popup is re-enabled later)
                const androidBtn = document.getElementById('androidDownload');
                const iosBtn = document.getElementById('iosDownload');
                if (androidBtn) {
                    androidBtn.addEventListener('click', function (e) {
                        e.preventDefault();
                        closeAppPopup();
                        setTimeout(() => { window.open(this.href, '_blank'); }, 100);
                    });
                }
                if (iosBtn) {
                    iosBtn.addEventListener('click', function (e) {
                        e.preventDefault();
                        closeAppPopup();
                        setTimeout(() => { window.open(this.href, '_blank'); }, 100);
                    });
                }

                const appPopupEl = document.getElementById('appPopup');
                if (appPopupEl) {
                    appPopupEl.addEventListener('click', function (e) {
                        if (e.target === this) { closeAppPopup(); }
                    });
                }
            });

            const canvas = document.getElementById("particleCanvas");
            const ctx = canvas.getContext("2d");
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            const particlesArray = [];

            class Particle {
                constructor() {
                    this.x = Math.random() * canvas.width;
                    this.y = Math.random() * canvas.height;
                    this.size = Math.random() * 4 + 1;
                    this.speedX = Math.random() * 1 - 0.5;
                    this.speedY = Math.random() * 1 - 0.5;
                    this.opacity = Math.random() * 0.5 + 0.2;
                }
                update() {
                    this.x += this.speedX;
                    this.y += this.speedY;
                    if (this.x > canvas.width || this.x < 0) this.speedX *= -1;
                    if (this.y > canvas.height || this.y < 0) this.speedY *= -1;
                }
                draw() {
                    ctx.fillStyle = `rgba(173, 216, 230, ${this.opacity})`;
                    ctx.beginPath();
                    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                    ctx.fill();
                }
            }

            function init() { for (let i = 0; i < 50; i++) { particlesArray.push(new Particle()); } }
            function animate() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                particlesArray.forEach((p) => { p.update(); p.draw(); });
                requestAnimationFrame(animate);
            }
            init();
            animate();

            function sendMessage() {
                let userMessage = document.getElementById("userMessage").value.trim();
                if (userMessage !== "") {
                    window.open("https://wa.me/918838966643?text=" + encodeURIComponent(userMessage), "_blank");
                    document.getElementById("userMessage").value = "";
                }
            }

            function closeAppPopup() {
                const appPopup = document.getElementById('appPopup');
                if (appPopup) appPopup.style.display = 'none';
                localStorage.setItem("appPopupClosed", "true");
            }

            window.addEventListener('scroll', function () {
                const navbar = document.querySelector('.navbar');
                if (window.scrollY > 50) { navbar.classList.add('scrolled'); }
                else { navbar.classList.remove('scrolled'); }
            });

            function toggleFloatingChat() {
                const chatWindow = document.getElementById("floatingChatWindow");
                chatWindow.style.display = (chatWindow.style.display === "flex") ? "none" : "flex";
            }

            function sendFloatingMessage() {
                let message = document.getElementById("floatingChatMessage").value.trim();
                if (message !== "") {
                    window.open("https://wa.me/918838966643?text=" + encodeURIComponent(message), "_blank");
                    document.getElementById("floatingChatMessage").value = "";
                    toggleFloatingChat();
                }
            }
        </script>
    </body>
    </html>
