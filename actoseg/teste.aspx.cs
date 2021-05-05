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

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod(ResponseFormat = System.Web.Script.Services.ResponseFormat.Json)]
        public static string SaveData(string file, string name)//string Name, string[] fileData)
        {
        
            System.IO.FileStream stream = new System.IO.FileStream(@"C:\_tfs\source\actoseg\upload\file.pdf", System.IO.FileMode.CreateNew);
            System.IO.BinaryWriter writer =  new System.IO.BinaryWriter(stream);
            file = file.Replace("data:application/pdf;base64,", "");
            byte[] bytes = Convert.FromBase64String(file);
            writer.Write(bytes, 0, bytes.Length);
            writer.Close();
            //Breakpoint
            return "ok";
        }

        //public string UploadPDF(HttpPostedFile file)

        //{

        //    if (Context.Request.Files.Count > 0)
        //    {

        //        HttpFileCollection files = Context.Request.Files;

        //        file = files[0];

        //        file.SaveAs(Server.MapPath("upload/" + file.FileName));
        //        //string bucketname = "*******";
        //        //string localpath = Server.MapPath("EmpDocs/" + file.FileName);
        //        //string s3path = "diesel_bills/" + file.FileName;
        //        //UploadFiles obj = new UploadFiles();
        //        //bool uploaded;

        //        //uploaded = obj.sendMyFileToS3Subforlder(bucketname, file.FileName, localpath, s3path);
        //        //File.Delete(Server.MapPath("EmpDocs/" + file.FileName));

        //        //param.Add("@Bill_Front_Copy", file.FileName);
        //    }
        //    return "OK";

        //}

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