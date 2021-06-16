using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Infra.Log
{
    public class LogError
    {
        public void TrataErro(string pStackTrace)
        {
            System.IO.StreamWriter sr = new System.IO.StreamWriter("C:\\Temp\\ErrorLogBT.txt", true);

            sr.WriteLine(pStackTrace);
            sr.Close();
            
        }
    }
}
