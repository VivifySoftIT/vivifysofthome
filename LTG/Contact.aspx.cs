using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Web.UI;

namespace LTG
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string service = ddlService.SelectedValue;
                string subject = txtSubject.Text.Trim();
                string message = txtMessage.Text.Trim();

                if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(email) ||
                    string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(subject) || string.IsNullOrWhiteSpace(message))
                {
                    ShowNotification("Please fill in all required fields.", "error");
                    return;
                }

                if (SendEmail(name, email, phone, service, subject, message))
                {
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    txtSubject.Text = "";
                    txtMessage.Text = "";
                    ShowNotification("Your message has been sent! We'll be in touch within 24 hours.", "success");
                }
                else
                {
                    ShowNotification("Something went wrong. Please try again or call us directly.", "error");
                }
            }
            catch (Exception ex)
            {
                ShowNotification("An error occurred: " + ex.Message, "error");
            }
        }

        private bool SendEmail(string name, string email, string phone, string service, string subject, string message)
        {
            try
            {
                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(ConfigurationManager.AppSettings["SMTPFrom"], "Vivify Soft Contact Page"),
                    Subject = string.Format("[VIVIFY SOFT] New Inquiry: {0}", subject),
                    IsBodyHtml = true,
                    Body = string.Format(@"
                        <div style='font-family:Inter,sans-serif; padding:30px; background:#f9f8ff; border:1px solid #704df3; border-radius:12px; max-width:600px;'>
                            <h2 style='color:#4524c5; border-bottom:2px solid #704df3; padding-bottom:15px; margin-bottom:20px;'>VIVIFY SOFT | Official Inquiry Received</h2>
                            <p><b>Name:</b> {0}</p>
                            <p><b>Email:</b> {1}</p>
                            <p><b>Phone:</b> {2}</p>
                            <p><b>Service of Interest:</b> {3}</p>
                            <p><b>Subject:</b> {4}</p>
                            <hr style='border:0; border-top:1px solid #eee; margin:20px 0;'>
                            <p><b>Message:</b></p>
                            <p style='background:#fff; padding:15px; border-radius:8px; border-left:4px solid #704df3;'>{5}</p>
                            <hr style='border:0; border-top:1px solid #eee; margin:20px 0;'>
                            <p style='font-size:12px; color:#888;'>Sent from Contact.aspx — VivifySoft.in</p>
                        </div>
                    ", name, email, phone, service, subject, message.Replace("\n", "<br>"))
                };
                mail.To.Add("itsupport@vivifysoft.in");
                mail.ReplyToList.Add(new MailAddress(email));

                using (SmtpClient smtp = new SmtpClient(
                    ConfigurationManager.AppSettings["SMTPHost"],
                    int.Parse(ConfigurationManager.AppSettings["SMTPPort"])))
                {
                    smtp.EnableSsl = bool.Parse(ConfigurationManager.AppSettings["SMTPEnableSsl"]);
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(
                        ConfigurationManager.AppSettings["SMTPUser"],
                        ConfigurationManager.AppSettings["SMTPPass"]);
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(mail);
                }
                return true;
            }
            catch { return false; }
        }

        private void ShowNotification(string message, string type)
        {
            string bg = type == "success" ? "#e8f5e9" : "#ffebee";
            string color = type == "success" ? "#2e7d32" : "#c62828";
            string icon = type == "success" ? "fa-check-circle" : "fa-exclamation-circle";
            string script = string.Format(@"
                (function() {{
                    var p = document.getElementById('notify-popup');
                    p.style.background = '{0}';
                    p.style.color = '{1}';
                    p.style.borderLeft = '5px solid {1}';
                    p.innerHTML = '<i class=""fas {2}"" style=""font-size:22px;""></i> <span>{3}</span>';
                    p.classList.add('show');
                    setTimeout(function(){{ p.classList.remove('show'); }}, 5000);
                }})();
            ", bg, color, icon, message);
            ScriptManager.RegisterStartupScript(this, GetType(), "Notify", script, true);
        }
    }
}
