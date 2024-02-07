with exoplanet_discoveries as (

    select
        {{ dbt_utils.generate_surrogate_key(['planet_name','discovery_facility','discovery_year','discovery_method']) }}
            as discovery_key,
        discovery_facility,
        discovery_instrument,
        discovery_locale,
        discovery_telescope,
        discovery_year,
        discovery_method,
        {{ dbt_utils.generate_surrogate_key(['planet_name']) }} as planet_key,
        {{ dbt_utils.generate_surrogate_key(['star_name']) }} as star_key

    from {{ ref('stg_nasa__exoplanets') }}
)

select * from exoplanet_discoveries
