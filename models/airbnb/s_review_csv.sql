{{ config(materialized='incremental',
          unique_key='id',
          incremental_strategy='append',
          enabled=true
          ) 
}}

select listing_id, 
       id, 
       reviewer_id,
       comments,
       to_date(date,'yyyy-mm-dd') as date
from   reviews_csv;