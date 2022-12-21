{{ config(materialized='incremental',
          unique_key="id" ,
          incremental_strategy='append' ,
          enabled=false
          ) 
}}

/*
Não tem memória para executar o minus e nem o join no final,
pois compara a chave primária das duas tabelas.

with dif as 
    (select listing_id||'-'||date as id
    from calndar0_csv
    
    --Tem que criar os sources para o dbt saber que é uma tabela. como se fossem objetos no banco de dados.
    {%- set source_relation = adapter.get_relation(
        database=source('airbnb_source','s_calendar_csv').database ,
        schema=source('airbnb_source','s_calendar_csv').schema,
        identifier=source('airbnb_source','s_calendar_csv').name) %}

    {% set table_exists=source_relation is not none  %}

    {% if table_exists %}
    {{ log("Table s_calendar_csv exists", info=True) }}
    
        minus
        select listing_id||'-'||date
        from {{ this }}  --esse é o s_calendar_csv
    
    {% endif %}
    )
*/

select  listing_id||'-'||date as id,
        listing_id,
        to_date(date,'yyyy-mm-dd') as data,
        available,
        trim(replace (price,'$','')) as price
from
    calndar0_csv c 
/*
    inner join 
    dif d
    on c.listing_id||'-'||c.date = d.id
*/
