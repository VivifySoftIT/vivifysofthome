import os
import re

files = [
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\WebDevelopment.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\OurProcess.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\MobileDevelopment.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\Home.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\Contact.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\CustomDevelopment.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\CaseStudy.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\BookDemo.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\AboutUs.aspx',
    r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG\Login.aspx'
]

html_nav = """
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
                <li><a href="CaseStudy.aspx">Case Study</a></li>
                <li><a href="Contact.aspx">Contact</a></li>
                <li class="mobile-only" style="margin-top: 25px; width: 100%;">
                </li>
            </ul>
            <div class="nav-btn">
                <a href="javascript:void(0);" onclick="openLoginModal()" class="btn-theme">Portal Login</a>
                <a href="BookDemo.aspx" class="btn-theme">Book a Demo</a>
            </div>
        </nav>"""

for f in files:
    if not os.path.exists(f): continue
    try:
        with open(f, 'r', encoding='utf-8') as file:
            content = file.read()
            
        new_content = re.sub(r'<!-- Navbar -->\s*<nav class="navbar" id="navbar">.*?</nav>', html_nav, content, flags=re.DOTALL)
        
        if new_content != content:
            with open(f, 'w', encoding='utf-8') as file:
                file.write(new_content)
            print(f'Injected HTML to {f}')
    except Exception as e:
        print(f'Error {f}: {e}')
