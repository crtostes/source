﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Lead.Entity;
using Acto.Lead.Data;

namespace Acto.Lead.Busines
{
    public class busLead
    {
        public void InsereLead(entLead obj)
        {
            daoLead objData = new daoLead();
            objData.InsereLead(obj);

        }



    }
}
