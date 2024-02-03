with star_brightness_measurements as (
    
    select distinct
        {{ dbt_utils.generate_surrogate_key(['star_name']) }} as star_key,
        star_brightness_in_v,
        star_brightness_in_k,
        star_brightness_in_gaia
        
    from {{ ref('stg_nasa__exoplanets') }}
) 
select * from star_brightness_measurements