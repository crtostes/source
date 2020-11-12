using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acto.Endereco.Data;
using Acto.Endereco.Entity;

namespace Acto.Endereco.Busines
{
    public class busEndereco
    {
        public entEndereco ConsultarEnderecoCliente(int pid_Cliente, int pid_Endereco)
        {
            try
            {
                daoEndereco objDaoEndereco = new daoEndereco();
                return objDaoEndereco.ConsultarEnderecoCliente(pid_Cliente, pid_Endereco);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }
        public entEnderecoTexto ConsultarEnderecoClienteTexto(int pid_Cliente, int pid_Endereco)
        {
            try
            {
                daoEndereco objDaoEndereco = new daoEndereco();
                entEndereco objEntEndereco = objDaoEndereco.ConsultarEnderecoCliente(pid_Cliente, pid_Endereco);
                entEnderecoTexto objEnderecoTexto = new entEnderecoTexto();
                objEnderecoTexto.id_tipo_endereco = objEntEndereco.id_tipo_endereco.ToString();
                objEnderecoTexto.ds_cep = objEntEndereco.ds_cep;
                objEnderecoTexto.ds_endereco = objEntEndereco.ds_endereco;
                objEnderecoTexto.ds_numero = objEntEndereco.ds_numero;
                objEnderecoTexto.ds_complemento = objEntEndereco.ds_complemento;
                objEnderecoTexto.ds_bairro = objEntEndereco.ds_bairro;
                objEnderecoTexto.ds_cidade = objEntEndereco.ds_cidade;
                objEnderecoTexto.ds_estado = objEntEndereco.ds_estado;
                objEnderecoTexto.dt_atualizacao= objEntEndereco.dt_atualizacao.ToString(@"dd/MM/yyyy");

                return objEnderecoTexto;
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return null;
            }

        }

        
        public Boolean AtualizarEndereco(entEndereco pentEndereco)
        {
            try
            {
                daoEndereco objDaoEndereco = new daoEndereco();
                return objDaoEndereco.AtualizarEndereco(pentEndereco);
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Houve problemas. Erro: \n\n" + ex.Message);
                return false;
            }

        }

    }
}
