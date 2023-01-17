{{ config(materialized='incremental',
          unique_key="id" ,
          incremental_strategy='append' ,
          enabled=false
          ) 
}}

select * from calndar0_csv