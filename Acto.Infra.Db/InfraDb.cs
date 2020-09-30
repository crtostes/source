using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Acto.Infra.Db
{
    public class InfraDb
    {
        public MySqlConnection ActoConn()
        {
            string connStr = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connStr);
            conn.Open();

            return conn; 
        }
    }
}
