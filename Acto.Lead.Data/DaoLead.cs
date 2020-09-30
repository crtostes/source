using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using MySql.Data.MySqlClient;
using Acto.Lead.Entity;

namespace Acto.Lead.Data
{
    public class daoLead
    {
        public void InsereLead(entLead obj)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connStr);
            conn.Open();
            MySqlCommand  cmd = new MySqlCommand();

            //cmd.CommandText = "INSERT INTO db_acto.lead ('nm_lead', 'ds_telefone', 'ds_email', 'ds_assunto') Values ('@nm_lead', '@ds_telefone', '@ds_email', '@ds_assunto')";
            cmd.CommandText = "INSERT INTO db_acto.lead (nm_lead, ds_telefone, ds_email, ds_assunto) Values (@nm_lead, @ds_telefone, @ds_email, @ds_assunto);";
            cmd.Parameters.AddWithValue("@nm_lead", obj.Nome);
            cmd.Parameters.AddWithValue("@ds_telefone", obj.Telefone);
            cmd.Parameters.AddWithValue("@ds_email", obj.Email);
            cmd.Parameters.AddWithValue("@ds_assunto", obj.Assunto);

            cmd.Connection = conn;
            
                       
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();

            //OleDbCommand cmdSelRestricoes = cnxImportacao.CreateCommand();
            //cmdSelRestricoes.CommandText = selectRestricaoSacado;

            //OleDbDataAdapter adapter = new OleDbDataAdapter(cmdSelRestricoes);
            //DataTable tableRestricoes = new DataTable();
            //adapter.Fill(tableRestricoes);

            //foreach (DataRow restricao in tableRestricoes.Rows)
            //{
            //    InsereGSABlackList(restricao);
            //}
        }
    }
}
