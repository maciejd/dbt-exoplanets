with star_positions as (

    select distinct
        {{ dbt_utils.generate_surrogate_key(['star_name']) }} as star_key,
        star_declination_in_deg,
        star_right_ascension_in_deg

    from {{ ref('stg_nasa__exoplanets') }}
)

select * from star_positions
