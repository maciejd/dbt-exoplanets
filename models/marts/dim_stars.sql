with numbered_rows as (

    select
        *,
        row_number() over (
            partition by star_name
            order by discovery_year desc
        ) as row_number
    from {{ ref('stg_nasa__exoplanets') }}
),

unique_measurement_per_star as (
    select
        {{ dbt_utils.generate_surrogate_key(['star_name']) }} as star_key,
        star_name,
        star_age_in_gyr,
        star_surface_gravity_in_g,
        star_mass_in_suns,
        star_metallicity_in_dex,
        star_metallicity_ratio,
        star_radius_in_suns,
        star_spectral_type,
        star_temperature_in_k,
        star_distance_in_parsecs,
        star_number_of_planets,
        star_number_of_stars,
        discovery_year as star_measurement_year

    from numbered_rows
    where row_number = 1
)

select * from unique_measurement_per_star
