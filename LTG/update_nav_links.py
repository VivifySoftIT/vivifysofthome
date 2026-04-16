
import os

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

for f in files:
    if not os.path.exists(f): continue
    try:
        with open(f, 'r', encoding='utf-8') as file:
            content = file.read()
            
        # Target the unified CSS injection to add text-decoration: none !important;
        # For nav links
        replaced = content.replace(
            '''white-space: nowrap; transition: all 0.3s ease;''',
            '''white-space: nowrap; transition: all 0.3s ease; text-decoration: none !important; border-bottom: none;'''
        )
        
        # For navbar buttons
        replaced = replaced.replace(
            '''z-index: 1; white-space: nowrap;''',
            '''z-index: 1; white-space: nowrap; text-decoration: none !important; border-bottom: none;'''
        )

        # Dropdown links
        replaced = replaced.replace(
            '''width: 100%; border-bottom: none !important; background: transparent !important;''',
            '''width: 100%; border-bottom: none !important; background: transparent !important; text-decoration: none !important;'''
        )
        
        if replaced != content:
            with open(f, 'w', encoding='utf-8') as file:
                file.write(replaced)
            print(f'Updated {f}')
    except Exception as e:
        print(f'Error {f}: {e}')

