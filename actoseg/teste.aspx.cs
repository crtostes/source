using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Acto.Lead.Busines;
using Acto.Lead.Entity;
using Acto.Infra.Log;

namespace actoseg
{
    public partial class teste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LogError objError = new LogError();
            objError.TrataErro("Teste"); 
        }
        [System.Web.Services.WebMethod]
        public static string BuscaCliente(string Codigo)

        {

            return "Descrição: " + Codigo.ToString();

        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{

        //    busLead objLead = new busLead();
        //    entLead objEnt = new entLead();

        //    objEnt.Nome = "teste";
        //    objEnt.Telefone = "9-9263-6369";
        //    objEnt.Email = "TESTE@TESTE.COM.BR";
        //    objEnt.Assunto = "Vida";
        //    //objLead.InsereLead(objEnt);

        //}

        //[System.Web.Services.WebMethod]
        //public static bool IsLeapYear(int year)

        //{

        //    return DateTime.IsLeapYear(year);

        //}

    }
}