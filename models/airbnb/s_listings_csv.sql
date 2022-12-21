{{ config(materialized='incremental',
          unique_key='id',
          incremental_strategy='append',
          enabled=true
          ) 
}}

select  id as id,
        name,
        trim(replace (price,'$','')) as price,
        trim(replace (weekly_price,'$','')) as weekly_price,
        trim(replace (monthly_price,'$','')) as monthly_price,
        host_id,
        host_listings_count,
        neighbourhood_cleansed,
        city,
        zipcode,
        latitude,
        longitude,
        property_type,
        room_type,
        bathrooms,
        bedrooms,
        accommodates,
        cleaning_fee,
        guests_included,
        minimum_nights,
        maximum_nights,
        review_scores_rating,
        amenities
from listings_csv;