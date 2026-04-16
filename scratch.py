import os
import glob
import re

dir_path = r'c:\Users\hp\source\repos\vijaya1213\Vivify-Reimbursement\LTG'
files = glob.glob(os.path.join(dir_path, '*.aspx'))

for f in files:
    with open(f, 'r', encoding='utf-8', errors='ignore') as file:
        content = file.read()
    
    # regex to match the Contact.aspx link up to </ul>
    pattern = re.compile(r'(<li><a href="Contact\.aspx">Contact</a></li>\s*)(</ul>)')
    
    def repl(m):
        spaces = m.group(1).split('\n')[-1]
        link1 = r'<li><a href="javascript:void(0);">Terms & Conditions</a></li>'
        link2 = r'<li><a href="javascript:void(0);">Privacy Statement</a></li>'
        link3 = r'<li><a href="javascript:void(0);">Refund Policy</a></li>'
        return m.group(1) + link1 + '\n' + spaces + link2 + '\n' + spaces + link3 + '\n' + spaces + m.group(2)
        
    new_content = pattern.sub(repl, content)
    
    if new_content != content:
        with open(f, 'w', encoding='utf-8') as file:
            file.write(new_content)
        print("Updated:", os.path.basename(f))
