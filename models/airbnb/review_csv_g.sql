{{ config(enabled=false) }}

select  listing_id, 
        count(*) as qtdtotal,
        sum(case when language = 'pt' then 1 else 0 end) as qtdportugues,
        sum(case when language <> 'pt' then 1 else 0 end) as qtdoutralingua
from
    reviews_csv
group by listing_id