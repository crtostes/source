using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Lead.Busines;
using Acto.Lead.Entity;
using System.Net.Mail;
using System.Net.Mime;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace actoseg
{
    public partial class _Default : Page
    {

        private static readonly System.Net.Http.HttpClient HttpClient = new System.Net.Http.HttpClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bntAutoCotacao_Click(object sender, EventArgs e)
        {
            busLead objLead = new busLead();
            entLead objEnt = new entLead();
                        
            objEnt.Nome = txtNomeAuto.Text;
            objEnt.Telefone = txtTelefoneAuto.Text;
            objEnt.Email = txtEmailAuto.Text;
            objEnt.Assunto = ddlAssuntoAuto.Text;
            objLead.InsereLead(objEnt);

            EnvioEmail();

            txtNomeAuto.Text = "";
            txtTelefoneAuto.Text = "";
            txtEmailAuto.Text = "";
            ddlAssuntoAuto.Text = "";

            //System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            //client.Host = "smtp.sendgrid.net";
            //client.Port = 587;
            ////client.Port = 465;
            //client.EnableSsl = true;
            //System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("apikey", "	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");
            //client.Credentials = credentials;
            ////client.UseDefaultCredentials = false;
            //client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            //client.Credentials = new System.Net.NetworkCredential("acto.cotacao@gmail.com", "acto@0001");
            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            ////mail.Sender = new System.Net.Mail.MailAddress("email que vai enviar", "ENVIADOR");
            //mail.Sender = new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", txtNomeAuto.Text);
            //mail.From = new System.Net.Mail.MailAddress(txtEmailAuto.Text, txtNomeAuto.Text);
            //mail.To.Add(new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA"));
            //mail.Subject = "Contato";
            //mail.Body = " Mensagem do site:<br/> Nome:  " + txtNomeAuto.Text + "<br/> Email : " + txtEmailAuto.Text + " <br/> Telefone: " + txtTelefoneAuto.Text + " <br/> Assunto: Seguro Auto - " + ddlAssuntoAuto.Text;
            //mail.IsBodyHtml = true;
            //mail.Priority = System.Net.Mail.MailPriority.High;

            //client.Send(mail);
            //try
            //{
            //    client.Send(mail);
            //}
            //catch (System.Exception erro)
            //{
            //    //trata erro
            //}
            //finally
            //{
            //    mail = null;
            //}

        }
       
        public void EnvioEmail()
        {
            var client = new SendGrid.SendGridClient(HttpClient, "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");

           

            var msg = new SendGridMessage()
            {
                From = new EmailAddress(txtEmailAuto.Text, "CONTATO ACTOSEG"),
                Subject = "Cliente: " + txtNomeAuto.Text,
                PlainTextContent = "CONTATO DO SITE www.actoseg.com.br",
                HtmlContent = "<strong> Mensagem do site:<br/> Nome:  " + txtNomeAuto.Text + "<br/> Email : " + txtEmailAuto.Text + " <br/> Telefone: " + txtTelefoneAuto.Text + " <br/> Assunto: Seguro Auto - " + ddlAssuntoAuto.Text + "</strong>"
            };
            msg.AddTo(new EmailAddress("acto.cotacao@gmail.com"));
            var response = client.SendEmailAsync(msg);
        }

        public void EnvioEmailOUTRO()
        {
            try
            {
                
                MailMessage mailMsg = new MailMessage();

                mailMsg.To.Add(new MailAddress("acto.cotacao@gmail.com", "The Recipient"));

                mailMsg.From = new MailAddress("acto.cotacao@gmail.com", "The Sender");

                mailMsg.Subject = "Test Email";
                string text = "Test Email with SendGrid using .NET's Built-in SMTP Library";
                string html = @"<strong>HTML text for the Test Email</strong>";
                mailMsg.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(text, null, MediaTypeNames.Text.Plain));
                mailMsg.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(html, null, MediaTypeNames.Text.Html));

                SmtpClient smtpClient = new SmtpClient("smtp.sendgrid.net", Convert.ToInt32(587));
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("azure_4ed5ec7c6c35d15957b30d3541122869@azure.com", "acto@0001");
                smtpClient.Credentials = credentials;

                smtpClient.Send(mailMsg);
            }
            catch (Exception ex)
            {
                txtNomeAuto.Text = ex.Message;
            }
        }
    }
}