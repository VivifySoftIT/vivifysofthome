import os
import re

dir_path = r"c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG"

social_html = """
                    <div class="social-links" style="margin-top: 25px; display: flex; gap: 15px;">
                        <a href="https://www.facebook.com" class="social-btn" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com" class="social-btn" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-x-twitter"></i></a>
                        <a href="https://www.instagram.com/vivifysoft/" class="social-btn" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/in/vivify-soft-588a813b9/" class="social-btn" target="_blank" style="width: 40px; height: 40px; background: rgba(255,255,255,0.05); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #fff; transition: 0.3s; border: 1px solid rgba(255,255,255,0.1); text-decoration: none;" onmouseover="this.style.background='var(--accent, #ee2326)'; this.style.transform='translateY(-5px)'" onmouseout="this.style.background='rgba(255,255,255,0.05)'; this.style.transform='translateY(0)'"><i class="fab fa-linkedin-in"></i></a>
                    </div>"""

files_to_update = [
    "Home.aspx",
    "MobileDevelopment.aspx",
    "WebDevelopment.aspx",
    "OurProcess.aspx",
    "Login.aspx",
    "CustomDevelopment.aspx",
    "Contact.aspx",
    "CaseStudy.aspx",
    "BookDemo.aspx",
    "AboutUs.aspx"
]

for file in files_to_update:
    file_path = os.path.join(dir_path, file)
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        if "flex; gap: 15px;" in content and "fab fa-facebook-f" in content:
            continue
            
        # Pattern covers the phone paragraph ending with </p>
        pattern = re.compile(r"(\+91\s*8838966643\s*</a>\s*</p>|\+91\s*8838966643\s*</p>)")
        match = pattern.search(content)

        if match:
            # Replaces the LAST match just in case there are multiple (e.g Contact.aspx body vs footer)
            # Actually search() finds the first. Wait, we want the footer one! 
            # So let's find all, and pick the last one.
            matches = list(pattern.finditer(content))
            if matches:
                 last_match = matches[-1]
                 content = content[:last_match.end()] + "\n" + social_html + content[last_match.end():]
                 with open(file_path, "w", encoding="utf-8") as f:
                     f.write(content)
        elif "No. 2B, 1st Floor, Mogappair road, Padi, Chennai - 600050</p>" in content:
            pattern = re.compile(r"(No\. 2B, 1st Floor, Mogappair road, Padi, Chennai - 600050</p>)")
            matches = list(pattern.finditer(content))
            if matches:
                 last_match = matches[-1]
                 content = content[:last_match.end()] + "\n" + social_html + content[last_match.end():]
                 with open(file_path, "w", encoding="utf-8") as f:
                     f.write(content)
        else:
             print(f"Failed to find target in {file}")

print("Done updating footers.")
