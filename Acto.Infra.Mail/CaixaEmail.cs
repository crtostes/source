using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using SendGrid.Helpers.Mail;

namespace Acto.Infra.Mail
{
    public class CaixaEmail
    {
        private static readonly System.Net.Http.HttpClient HttpClient = new System.Net.Http.HttpClient();
        public void EnviaEmailGmail(int id_cotacao, string Nome, string email, string telefone,string novo_status, string pBody = "")
        {
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();

            var nome = Environment.MachineName;
            

            //SmtpClient.Credentials = new NetworkCredential("raffa.ferreiira@gmail.com", "senha");




            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential("acto.cotacao@gmail.com", "acto@0001");

            MailMessage mail = new MailMessage();
            mail.Sender = new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA");
            mail.From = new MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA");
            mail.To.Add(new MailAddress("crtostes@globo.com", "CHARLES RICARDO TOSTES"));

            string strSubject = "NOVA COTAÇÃO nº " + id_cotacao.ToString("000") + " - Novo Status: (" + novo_status + ")";
            string strBody = " Mensagem do site:<br/> Nome:  " + Nome.ToUpper() + "<br/> Email : " + email + " <br/> Telofone : " + telefone + " <br/> Mensagem : " + "NOVA COTAÇÃO NUMERO " + id_cotacao.ToString("000") + " " + nome;
            if (novo_status == "CE")
            { 
                strSubject = "COTAÇÃO EM PROCESSAMENTO nº " + id_cotacao.ToString("000") + " - Novo Status: (" + novo_status + ")";
                strBody = pBody;
            }
            mail.Subject = strSubject;
            mail.Body = strBody;


            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            //try
            //{
                client.Send(mail);
            //}
            //catch (System.Exception erro)
           // {
                //trata erro
            //}
            //finally
           // {
           //     mail = null;
           // }




            //System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            //client.Host = "smtp.gmail.com";
            ////client.Port = 587;
            //client.Port = 465;
            //client.EnableSsl = true;
            ////System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("apikey", "	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");
            ////client.Credentials = credentials;
            ////client.UseDefaultCredentials = false;
            //client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            //client.Credentials = new System.Net.NetworkCredential("acto.cotacao@gmail.com", "acto@0001");
            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            //mail.Sender = new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", "ENVIADOR");

            //mail.From = new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA");

            ////mail.Sender = new System.Net.Mail.MailAddress("crtostes@globo.com", "Destino: Charles Tostes");

            //mail.To.Add(new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA"));
            //mail.Subject = "Teste envio cotação";
            //mail.Body = " Mensagem do site:<br/> Nome:  " + "CHARLES TOSTES" + "<br/> Email : " + "AQUI@EMIAL.COM" + " <br/> Telefone: " + "(11) 9-9720-2238" + " <br/> Assunto: Seguro Auto - " + "SEGURO NOVO";
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

            // cria uma mensagem
            //System.Net.Mail.MailMessage mensagemEmail = new System.Net.Mail.MailMessage("acto.cotacao@gmail.com", "crtostes@globo.com", "COTAÇÃO", "CHEGOU A COTAÇÃO");

            //System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;
            //System.Net.NetworkCredential cred = new System.Net.NetworkCredential("acto.cotacao@gmail.com", "acto@0001");
            //client.Credentials = cred;
            //client.EnableSsl = true;
            //// inclui as credenciais
            //client.UseDefaultCredentials = true;

            //// envia a mensagem
            //client.Send(mensagemEmail);

        }
        public void EnviaEmailACTOSEG(string pemail_destino, string pnome_destino, string passunto, string pBody)
        {
            SmtpClient client = new SmtpClient();

            var nome = Environment.MachineName;

            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = true;
            client.Credentials = new System.Net.NetworkCredential("acto.cotacao@gmail.com", "acto@0001");

            MailMessage mail = new MailMessage();
            mail.Sender = new System.Net.Mail.MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA");
            mail.From = new MailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA");
            mail.To.Add(new MailAddress(pemail_destino, pnome_destino));

            mail.Subject = passunto;
            mail.Body = pBody;

            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            client.Send(mail);
            
        }
        public void EnvioEmailAsync()
        {
            var client = new SendGrid.SendGridClient(HttpClient, "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");



            var msg = new SendGridMessage()
            {
                From = new EmailAddress("acto.cotacao@gmail.com", "ACTOSEG CORRETORA"),
                Subject = "NOVA COTAÇÃO",
                PlainTextContent = "CONTATO DO SITE www.actoseg.com.br",
                HtmlContent = " Mensagem do site:<br/> Nome:  " + "CHARLES TOSTES" + "<br/> Email : " + "CRTOSTES@GLOBO.COM" + " <br/> Mensagem : " + "NOVA COTAÇÃO NUMERO 99"
        };
            msg.AddTo(new EmailAddress("crtostes@globo.com","CHARLES RICARDO TOSTES"));
            var response = client.SendEmailAsync(msg);
        }
        
    }
}
