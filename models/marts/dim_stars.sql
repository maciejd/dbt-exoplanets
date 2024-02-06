with star_parameters as (

    select distinct
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
            star_number_of_stars

    from {{ ref('stg_nasa__exoplanets') }}
)

select * from star_parameters