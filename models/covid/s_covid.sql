{{ config(materialized='incremental',
          unique_key='source_id',
          incremental_strategy='append',
          enabled=true
          ) 
}}


select source_id,
       to_date(substr(datanotificacao,1,10),'yyyy-mm-dd') as datanotificacao,
       to_date(substr(datainiciosintomas,1,10),'yyyy-mm-dd') as datainiciosintomas,
       to_date(substr(dataencerramento,1,10),'yyyy-mm-dd') as dataencerramento,
       sintomas,
       municipionotificacao,
       classificacaofinal,
       to_date(substr(dataprimeiradose,1,10),'yyyy-mm-dd') as dataprimeiradose,
       to_date(substr(datasegundadose,1,10),'yyyy-mm-dd') as datasegundadose,
       idade
from covid_rj
where classificacaoFinal like '%Confirmado%'
and	datanotificacao is not null

--{% if is_incremental() %}

--    and datanotificacao > (select max(to_date(substr(datanotificacao,1,10),'yyyy-mm-dd')) from {{ this}})

--{% endif %}