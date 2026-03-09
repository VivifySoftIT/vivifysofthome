using System;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Web.UI;

namespace Vivify
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["success"] == "true")
                {
                    ShowMessage("Your message has been sent successfully!", "success");
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string userEmail = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string subject = txtSubject.Text.Trim();
                string messageBody = txtMessage.Text.Trim();

                if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(userEmail) ||
                    string.IsNullOrWhiteSpace(subject) || string.IsNullOrWhiteSpace(messageBody))
                {
                    ShowMessage("Please fill all required fields!", "error");
                    return;
                }

                if (SendEmail(name, userEmail, phone, subject, messageBody))
                {
                    Response.Redirect("Home.aspx?success=true", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    ShowMessage("Oops! Something went wrong.", "error");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                ShowMessage("Oops! Something went wrong.", "error");
            }
        }

        private bool SendEmail(string name, string userEmail, string phone, string subject, string messageBody)
        {
            try
            {
                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(ConfigurationManager.AppSettings["SMTPFrom"], name),
                    Subject = $"Message from VivifySoft:",
                    IsBodyHtml = true,
                    Body = $@"
                <p><b>Name:</b> {name}</p>
                <p><b>Email:</b> {userEmail}</p>
                <p><b>Phone:</b> {phone}</p>
                <p><b>Message:</b></p>
                <p>{messageBody}</p>
            "
                };

                mail.To.Add(ConfigurationManager.AppSettings["SMTPFrom"]);
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
                ShowMessage("Error: " + ex.Message, "error");
                return false;
            }
        }

        // Shows inline message in <div id="msgBox"> — NO browser alert popup
        private void ShowMessage(string message, string type)
        {
            string color = type == "success" ? "#2e7d32" : "#c62828";
            string bg = type == "success" ? "#e8f5e9" : "#ffebee";
            string border = type == "success" ? "#a5d6a7" : "#ef9a9a";

            string script = $@"
                var box = document.getElementById('msgBox');
                if (box) {{
                    box.innerText = '{message}';
                    box.style.display = 'block';
                    box.style.color = '{color}';
                    box.style.backgroundColor = '{bg}';
                    box.style.border = '1px solid {border}';
                    box.style.padding = '10px 16px';
                    box.style.borderRadius = '6px';
                    box.style.marginTop = '10px';
                    box.style.fontFamily = 'sans-serif';
                    box.style.fontSize = '14px';
                }}
            ";
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowMsg", script, true);
        }
    }
}