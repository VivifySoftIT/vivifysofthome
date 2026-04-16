using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Web.UI;

namespace Vivify
{
    public partial class BookDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["success"] == "true")
                {
                    ShowMessage("Demo request successfully sent! Our team will contact you shortly.", "success");
                }
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string userEmail = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string solution = ddlSolution.SelectedValue;
                string size = ddlSize.SelectedValue;
                string date = txtDate.Text;

                if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(userEmail) || string.IsNullOrWhiteSpace(date) || string.IsNullOrWhiteSpace(phone))
                {
                    ShowMessage("Please fill all required fields!", "error");
                    return;
                }

                if (SendEmail(name, userEmail, phone, solution, size, date))
                {
                    // Clear fields instead of Redirecting to prevent full page refresh
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    txtDate.Text = "";
                    ShowMessage("Demo request successfully sent! Our team will contact you shortly.", "success");
                }
                else
                {
                    ShowMessage("Oops! Something went wrong while sending your request.", "error");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("An error occurred: " + ex.Message, "error");
            }
        }

        private bool SendEmail(string name, string userEmail, string phone, string solution, string size, string date)
        {
            try
            {
                string recipient = "itsupport@vivifysoft.in";
                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(ConfigurationManager.AppSettings["SMTPFrom"], "Vivify Soft Demo System"),
                    Subject = string.Format("[VIVIFY SOFT] New Demo Request: {0}", solution),
                    IsBodyHtml = true,
                    Body = string.Format(@"
                        <div style='font-family:sans-serif; padding:20px; border:1px solid #704df3; border-radius:12px; background:#f9f8ff; max-width:600px;'>
                            <h2 style='color:#4524c5; margin-bottom:20px; border-bottom:2px solid #704df3; padding-bottom:10px;'>VIVIFY SOFT | Official Demo Request Received</h2>
                            <p><b>Name:</b> {0}</p>
                            <p><b>Email:</b> {1}</p>
                            <p><b>Phone:</b> {2}</p>
                            <p><b>Solution of Interest:</b> {3}</p>
                            <p><b>Company Size:</b> {4}</p>
                            <p><b>Preferred Date:</b> {5}</p>
                            <hr style='border:0; border-top:1px solid #eee; margin:20px 0;'>
                            <p style='font-size:12px; color:#888;'>This request was generated from the Book Demo page on VivifySoft.in</p>
                        </div>
                    ", name, userEmail, phone, solution, size, date)
                };

                mail.To.Add(recipient);
                mail.ReplyToList.Add(new MailAddress(userEmail));

                using (SmtpClient smtp = new SmtpClient(
                    ConfigurationManager.AppSettings["SMTPHost"],
                    int.Parse(ConfigurationManager.AppSettings["SMTPPort"])
                ))
                {
                    smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["SMTPEnableSsl"]);
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(
                        ConfigurationManager.AppSettings["SMTPUser"],
                        ConfigurationManager.AppSettings["SMTPPass"]
                    );
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(mail);
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private void ShowMessage(string message, string type)
        {
            string color = type == "success" ? "#2e7d32" : "#c62828";
            string bg = type == "success" ? "#e8f5e9" : "#ffebee";

            string script = string.Format(@"
                // Custom Professional Popup Overlay
                (function() {{
                    const oldPopup = document.getElementById('vivify-msg-popup');
                    if(oldPopup) oldPopup.remove();

                    const div = document.createElement('div');
                    div.id = 'vivify-msg-popup';
                    div.style.cssText = 'position:fixed; top:30px; right:30px; padding:20px 30px; background:{0}; color:{1}; border-left:5px solid {1}; border-radius:8px; box-shadow:0 15px 40px rgba(0,0,0,0.15); z-index:99999; font-family:sans-serif; font-weight:600; display:flex; align-items:center; gap:15px; transform:translateX(100%); transition:0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);';
                    
                    const icon = '{2}' === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle';
                    div.innerHTML = '<i class=""fas ' + icon + '"" style=""font-size:22px;""></i> <span>{3}</span>';
                    
                    document.body.appendChild(div);
                    setTimeout(() => div.style.transform = 'translateX(0)', 100);
                    setTimeout(() => {{
                        div.style.transform = 'translateX(120%)';
                        setTimeout(() => div.remove(), 600);
                    }}, 5000);
                }})();
            ", bg, color, type, message);
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowMsg", script, true);
        }
    }
}
