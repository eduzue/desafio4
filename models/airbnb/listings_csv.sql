{{ config(materialized='incremental',
          unique_key="id" ,
          incremental_strategy='append' ,
          enabled=false
          ) 
}}

select * from listings_csv