using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Gratificacao.Entity;
using Acto.Infra.Db;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;
using Dapper;

namespace Acto.Gratificacao.Data
{
    public class daoGratificacao
    {
        public List<entGratificacaoPagamento> ListarGratificacaoPagamento(int pid_cliente_indicado)
        {

            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {
                
                var sql = "CALL `db_acto`.`sp_gratificacao_pagamento_listar`(@pid_cliente_indicado)";
                var values = new { pid_cliente_indicado = pid_cliente_indicado.ToString() };
                return conn.Query<entGratificacaoPagamento>(sql, values).ToList();

            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }
        public List<entGratificacao> ListarGratificacaoMes(int pid_cliente_indicado, int pnr_mes_gratificacao)
        {

            InfraDb ActoDb = new InfraDb();
            MySqlConnection conn = ActoDb.ActoConn();
            try
            {

                var sql = "CALL `db_acto`.`sp_gratificacao_mes_listar`(@pid_cliente_indicado, @pnr_mes_gratificacao )";
                var values = new { pid_cliente_indicado = pid_cliente_indicado.ToString(), pnr_mes_gratificacao = pnr_mes_gratificacao.ToString() };
                return conn.Query<entGratificacao>(sql, values).ToList();

            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }
            finally
            {
                /* se a conexão esta aberta, a fechamos */
                if (conn.State == ConnectionState.Open) conn.Close();
            }

        }
    }
}
