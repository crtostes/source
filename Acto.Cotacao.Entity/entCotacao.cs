using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acto.Cotacao.Entity
{
    public class entCotacao
    {

        public int id_cotacao { get; set; }
        public int id_tipo_cotacao { get; set; }
        public int id_ramo { get; set; }
        public DateTime dt_cotacao { get; set; }
        public int id_cliente { get; set; }
        public string cd_status_cotacao { get; set; }

    }
    public class entCotacaoAutomovel
    {
        public int id_cotacao { get; set; }
        public int id_cotacao_automovel { get; set; }
        public int id_cliente { get; set; }
        public string ds_pdf { get; set; }
        public string ds_status_cotacao { get; set; }
        public string ds_tipo_cotacao { get; set; }
        public string ds_data_vigencia_inicial { get; set; }
        public string ds_data_vigencia_final { get; set; }
        public string ds_ano_fabricao { get; set; }
        public string ds_ano_modelo { get; set; }
        public string cd_fipe { get; set; }
        public string ds_marca { get; set; }
        public string ds_modelo { get; set; }
        public string ds_versao { get; set; }
        public string ds_chassi { get; set; }
        public string ds_zero_km { get; set; }
        public string ds_estado_veiculo { get; set; }
        public string ds_placa { get; set; }
        public string ds_combustivel { get; set; }
        public string ds_portas { get; set; }
        public string ds_utilizacao_veiculo { get; set; }
        public string ds_cep_pernoite { get; set; }
        public string ds_financiado { get; set; }
        public string ds_kit_gas { get; set; }
        public string ds_taxi { get; set; }
        public string ds_aplicativo { get; set; }
        public string ds_blindado { get; set; }
        public string ds_pcd { get; set; }
        public string ds_cep_circulacao { get; set; }
        public string ds_cep_residencia { get; set; }
        public string ds_proprietario { get; set; }
        public string ds_principal_condutor { get; set; }
        public string ds_relacao_proprietario { get; set; }
        public string ds_18_a_25_dirige { get; set; }
        public string ds_mora_em { get; set; }
        public string ds_local_pernoite { get; set; }
        public string ds_utilizacao { get; set; }
        public string ds_garagem_residencia { get; set; }
        public string ds_garagem_trabalho { get; set; }
        public string ds_garagem_escola { get; set; }
        public string ds_km_media_mensal { get; set; }
        public string nr_idade_habilitacao { get; set; }
        public string ds_condutor_relacao_com_segurado { get; set; }
        public string ds_condutor_data_nascimento { get; set; }
        public string ds_condutor_cpf { get; set; }
        public string ds_condutor_nome { get; set; }
        public string ds_condutor_idade_p_habilitacao { get; set; }
        public string ds_condutor_genero { get; set; }
        public string ds_condutor_estado_civil { get; set; }
        public string ds_condutor_profissao { get; set; }
        public string ds_condutor_detalhe_profissao { get; set; }
        public string ds_condutor_reside_em { get; set; }
        public string ds_condutor_considerado { get; set; }
        public string ds_condutor_acima_25 { get; set; }
        public string ds_condutor_total_veiculos { get; set; }
        public string ds_condutor_rg { get; set; }
        public string ds_condutor_data_emissao_rg { get; set; }
        public string ds_condutor_emissor_rg { get; set; }
        public string ds_condutor_cnh { get; set; }
        public string ds_condutor_data_habilitacao { get; set; }
        public string ds_cobertura { get; set; }
        public string ds_cobertura_valor_mercado { get; set; }
        public string ds_cobertura_valor_acessorios { get; set; }
        public string ds_cobertura_valor_vidros { get; set; }
        public string ds_cobertura_valor_equipamentos { get; set; }
        public string ds_cobertura_valor_despesas_extras { get; set; }
        public string ds_cobertura_carro_reserva { get; set; }
        public string ds_cobertura_assistencia { get; set; }
        public string ds_cobertura_danos_materiais { get; set; }
        public string ds_cobertura_danos_corporais { get; set; }
        public string ds_cobertura_danos_morais { get; set; }
        public string ds_cobertura_valor_dia_paralisacao { get; set; }
        public string ds_cobertura_passageiros { get; set; }
        public string ds_cobertura_valor_morte { get; set; }
        public string ds_cobertura_valor_invalidez { get; set; }
        public string ds_cobertura_valor_despesas_medicas { get; set; }
        public string ds_renovacao_seguradora { get; set; }
        public string ds_renovacao_bonus_anterior { get; set; }
        public string ds_renovacao_bonus_atual { get; set; }
        public string ds_renovacao_data_vigencia_anterior_inicio { get; set; }
        public string ds_renovacao_data_vigencia_anterior_fim { get; set; }
        public string ds_renovacao_apolice { get; set; }
        public string ds_renovacao_apolice_item { get; set; }
        public string ds_renovacao_apolice_ci { get; set; }
    }
    public class entMoraEm
    {
        public int id_mora_em { get; set; }
        public string ds_mora_em { get; set; }
    }

    public class entUtilizacao
    {
        public int id_utilizacao { get; set; }
        public string ds_utilizacao { get; set; }
    }

    public class entLocalPernoite
    {
        public int id_local_pernoite { get; set; }
        public string ds_local_pernoite { get; set; }
    }

    public class entSeguradora
    {
        public int id_seguradora { get; set; }
        public string cd_seguradora { get; set; }
        public string ds_seguradora { get; set; }
    }
    
    public class entCotacaoAutomovelGrid
    {
        public string id_cotacao { get; set; }
        public string id_cotacao_automovel { get; set; }
        public string ds_ramo { get; set; }
        public string id_cliente { get; set; }
        public string ds_nome { get; set; }
        public string ds_telefone_celular { get; set; }
        public string dt_cotacao { get; set; }
        public string cd_status_cotacao { get; set; }
        public string bt_dl_pdf { get; set; }
        public string bt_atualizar { get; set; }
        public string ds_status_cotacao { get; set; }
        public string ds_marca { get; set; }
        public string ds_modelo { get; set; }
        public string ds_ano_fabricao { get; set; }
        public string ds_ano_modelo { get; set; }


    }

    public class entCotacaoAutomovelItem
    {

        public int id_cotacao { get; set; }
        public int id_seguradora_cotacao { get; set; }
        public int id_forma_pagamento { get; set; }
        public string ds_valor_franquia_50 { get; set; }
        public string ds_valor_premio_f50 { get; set; }
        public string ds_valor_franquia_100 { get; set; }
        public string ds_valor_premio_f100 { get; set; }
    }

    public class entCotacaoAutomovelItemGrid
    {
        public string id_cotacao { get; set; }
        public string bt_cotacao_aprova_normal { get; set; }
        public string bt_cotacao_aprova_reduzida { get; set; }
        public string id_seguradora_cotacao { get; set; }
        public string img_seguradora_cotacao_foto { get; set; }
        public string id_forma_pagamento { get; set; }
        public string ds_forma_pagamento { get; set; }

        public string ds_Franquia1 { get; set; }
        public string ds_Franquia2 { get; set; }
        public string ds_valor_franquia_50 { get; set; }
        public string ds_valor_premio_f50 { get; set; }
        public string ds_valor_franquia_100 { get; set; }
        public string ds_valor_premio_f100 { get; set; }
        public string fl_aprovada_normal { get; set; }
        public string fl_aprovada_reduzida { get; set; }
        public string ds_nome_cliente_aprovada_normal { get; set; }
        public string ds_nome_cliente_aprovada_reduzida { get; set; }
        public string ds_data_hora_aprovada_normal { get; set; }
        public string ds_data_hora_aprovada_reduzida { get; set; }



    }
}
