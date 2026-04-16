<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms & Conditions - Vivify Soft</title>
    <link href="assets/img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <style>
        :root {
            --primary-dark: #232b66;
            --primary: #232b66;
            --primary-light: #2d3882;
            --bg-body: #f7f9fc;
            --bg-card: #ffffff;
            --text-dark: #1f1b3d;
            --text-body: #6f6b8f;
            --accent: #ee2326;
            --secondary: #ee2326;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background-color: var(--bg-body); color: var(--text-body); line-height: 1.8; }
        h1, h2, h3 { color: var(--text-dark); margin-bottom: 20px; }
        
        /* Navbar */
        .navbar {
            position: fixed; top: 0; left: 0; width: 100%; padding: 15px 5%;
            display: flex; justify-content: space-between; align-items: center;
            z-index: 1000; background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px); border-bottom: 1px solid rgba(0,0,0,0.05);
        }
        .logo img { height: 50px; }
        .nav-links { display: flex; gap: 20px; list-style: none; }
        .nav-links a { font-size: 14px; font-weight: 600; text-transform: uppercase; color: var(--text-dark); text-decoration: none; transition: 0.3s; }
        .nav-links a:hover { color: var(--accent); }

        /* Content */
        .page-header { padding: 150px 5% 60px; background: linear-gradient(135deg, var(--primary-dark), #1a2055); color: #fff; text-align: center; }
        .page-header h1 { color: #fff; font-size: 48px; margin-bottom: 10px; }
        
        .content-section { max-width: 900px; margin: -50px auto 100px; background: #fff; padding: 60px 50px; border-radius: 20px; box-shadow: 0 20px 50px rgba(0,0,0,0.05); }
        .content-section section { margin-bottom: 40px; }
        .content-section h2 { font-size: 24px; border-left: 4px solid var(--accent); padding-left: 15px; }
        .content-section p { margin-bottom: 15px; }
        .content-section ul { margin-left: 20px; margin-bottom: 20px; }
        .content-section li { margin-bottom: 10px; }

        footer { background: #202b61; padding: 80px 5% 40px; color: #fff; text-align: center; }
        .footer-bottom { border-top: 1px solid rgba(255,255,255,0.1); padding-top: 30px; margin-top: 50px; font-size: 14px; opacity: 0.7; }
        .footer-links { display: flex; justify-content: center; gap: 30px; margin-bottom: 20px; list-style: none; }
        .footer-links a { color: #fff; text-decoration: none; font-weight: 500; transition: 0.3s; }
        .footer-links a:hover { color: var(--accent); }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="Home.aspx" class="logo"><img src="assets/img/updated_Logo-removebg-preview (1).png" alt="Vivify Soft"></a>
        <div class="nav-links">
            <a href="Home.aspx" style="display: flex; align-items: center; gap: 8px; font-weight: 700;">
                <i class="fas fa-arrow-left"></i> Back to Home
            </a>
        </div>
    </nav>

    <header class="page-header">
        <h1>Terms & Conditions</h1>
    </header>

    <main class="content-section">
        <section>
            <h2>1. Introduction</h2>
            <p>Welcome to Vivify Soft. These Terms & Conditions govern your use of our website and services. By accessing or using our services, you agree to be bound by these terms in full. If you disagree with any part of these terms, you must not use our website or services.</p>
        </section>

        <section>
            <h2>2. Use of Services</h2>
            <p>You agree to use our services only for lawful purposes. You are prohibited from:</p>
            <ul>
                <li>Using the services in any way that causes, or may cause, damage to the website or impairment of the availability or accessibility of the services.</li>
                <li>Engaging in any data mining, data harvesting, or data extracting in relation to this website.</li>
                <li>Using this website to copy, store, host, transmit, send, use, publish or distribute any material which consists of (or is linked to) any spyware, computer virus, Trojan horse, or other malicious computer software.</li>
            </ul>
        </section>

        <section>
            <h2>3. Intellectual Property Rights</h2>
            <p>Other than the content you own, under these Terms, Vivify Soft and/or its licensors own all the intellectual property rights and materials contained in this Website. All intellectual property rights are reserved.</p>
            <p>You are granted a limited license only for purposes of viewing the material contained on this Website, subject to the restrictions provided in these Terms.</p>
        </section>

        <section>
            <h2>4. Payment Terms</h2>
            <p>Our standard payment terms require an advance deposit before work commences on any project. Subsequent payments are tied to specific project milestones as outlined in the Statement of Work (SOW). Late payments may result in the suspension of services.</p>
        </section>

        <section>
            <h2>5. Service Level Agreements (SLA)</h2>
            <p>While we strive for 100% uptime for our hosted services, we guarantee a 99.9% uptime as part of our standard SLA for enterprise clients. Scheduled maintenance will be communicated at least 48 hours in advance.</p>
        </section>

        <section>
            <h2>6. Confidentiality</h2>
            <p>Both parties agree to treat all non-public information received from the other party as confidential. This includes project specifications, business strategies, and proprietary code. This obligation survives the termination of any contract for a period of five years.</p>
        </section>

        <section>
            <h2>7. Limitation of Liability</h2>
            <p>In no event shall Vivify Soft, nor any of its officers, directors, and employees, be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. Vivify Soft shall not be held liable for any indirect, consequential, or special liability arising out of or in any way related to your use of this Website.</p>
        </section>

        <section>
            <h2>8. Indemnification</h2>
            <p>You hereby indemnify to the fullest extent Vivify Soft from and against any and/or all liabilities, costs, demands, causes of action, damages, and expenses arising in any way related to your breach of any of the provisions of these Terms.</p>
        </section>

        <section>
            <h2>9. Termination</h2>
            <p>We may terminate or suspend access to our services immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.</p>
        </section>

        <section>
            <h2>10. Governing Law & Jurisdiction</h2>
            <p>These Terms will be governed by and interpreted in accordance with the laws of the State of Tamil Nadu, India, and you submit to the non-exclusive jurisdiction of the state and federal courts located in Chennai for the resolution of any disputes.</p>
        </section>

        <section>
            <h2>11. Support & Communication</h2>
            <p>Official communication regarding these terms should be directed to our legal department at itsupport@vivifysoft.in. We aim to respond to all inquiries within 2-3 business days.</p>
        </section>
    </main>

    <footer>
        <ul class="footer-links">
            <li><a href="Terms.aspx">Terms & Conditions</a></li>
            <li><a href="Privacy.aspx">Privacy Policy</a></li>
            <li><a href="Refund.aspx">Refund Policy</a></li>
        </ul>
        <div class="footer-bottom">
            <p>&copy; 2024 Vivify Soft Architecture. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>
