using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Lead.Busines;
using Acto.Lead.Entity;

namespace actoseg
{
    public partial class teste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            busLead objLead = new busLead();
            entLead objEnt = new entLead();

            objEnt.Nome = "teste";
            objEnt.Telefone = "9-9263-6369";
            objEnt.Email = "TESTE@TESTE.COM.BR";
            objEnt.Assunto = "Vida";
            objLead.InsereLead(objEnt);

        }
    }
}