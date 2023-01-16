{{ config(materialized='incremental',
          unique_key='id',
          incremental_strategy='append',
          enabled=true
          ) 
}}

select  l.id as id,
        l.name,
        trim(replace (l.price,'$','')) as price,
        trim(replace (l.weekly_price,'$','')) as weekly_price,
        trim(replace (l.monthly_price,'$','')) as monthly_price,
        l.host_id,
        l.host_listings_count,
        l.neighbourhood_cleansed,
        l.city,
        l.zipcode,
        l.latitude,
        l.longitude,
        l.property_type,
        l.room_type,
        l.bathrooms,
        l.bedrooms,
        l.accommodates,
        l.cleaning_fee,
        l.guests_included,
        l.minimum_nights,
        l.maximum_nights,
        l.review_scores_rating,
        l.amenities,
        l.host_location,
        l.calculated_host_listings_count,
        l.calculated_host_listings_count_entire_homes,
        l.calculated_host_listings_count_private_rooms,
        l.calculated_host_listings_count_shared_rooms,
        nvl(c.valortotal,0) as valortotal,
        nvl(c.qtddiarias,0) as qtddiarias,
        case when nvl(l.minimum_nights,0) < 15 then 'C'
        else 'L' end as curta_longa_duracao
from s_listings_csv l
left join (select sum(price) as valortotal,
                  count(*) as qtddiarias,
                  listing_id
            from s_calendar_csv
            where available = 'f'
            group by listing_id) c
on l.id = c.listing_id;