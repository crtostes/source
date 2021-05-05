using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Infra.Mail;


namespace actoseg.main.pages
{
    public partial class Teste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CaixaEmail objEmail= new CaixaEmail();

            //objEmail.EnviaEmailGmail(); 

            objEmail.EnviaEmailGmail(99,"chales teste","crtostes@globo.com","9-9720-2238", "teste");


        }
    }
}