<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refund Policy - Vivify Soft</title>
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
        <h1>Refund Policy</h1>
    </header>

    <main class="content-section">
        <section>
            <h2>1. General Policy</h2>
            <p>At Vivify Soft, we strive to deliver high-quality software solutions that meet or exceed our clients' expectations. Due to the custom nature of our development services, we have established the following refund policy.</p>
        </section>

        <section>
            <h2>2. Custom Development Services</h2>
            <p>Refunds for custom software development projects are handled on a case-by-case basis according to the following guidelines:</p>
            <ul>
                <li><strong>Milestone Payments:</strong> Payments for completed and approved milestones are non-refundable.</li>
                <li><strong>Cancellation Before Start:</strong> If a project is cancelled before any work has commenced, a 90% refund of the initial deposit may be provided (10% retained for administrative costs).</li>
                <li><strong>Work in Progress:</strong> If a project is cancelled during development, the client will be billed for the hours worked or milestones reached up to the date of cancellation. Any excess deposit will be refunded.</li>
            </ul>
        </section>

        <section>
            <h2>3. Subscription Services</h2>
            <p>For any SaaS or maintenance subscriptions, refunds are typically not provided for the current billing cycle. You may cancel your subscription at any time to prevent future charges.</p>
        </section>

        <section>
            <h2>4. Non-Refundable Situations</h2>
            <p>Refunds will not be issued in the following situations:</p>
            <ul>
                <li>Change of mind after development has reached over 50% completion.</li>
                <li>Failure to provide necessary information/assets causing project delays.</li>
                <li>Third-party service costs already incurred (hosting, APIs, etc.).</li>
            </ul>
        </section>

        <section>
            <h2>5. Process</h2>
            <p>To request a refund, please submit a written request to itsupport@vivifysoft.in with your project details and the reason for the request. We will review and respond within 10 business days.</p>
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
