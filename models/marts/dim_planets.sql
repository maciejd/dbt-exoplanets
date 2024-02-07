with planet_parameters as (

    select
        {{ dbt_utils.generate_surrogate_key(['planet_name']) }} as planet_key,
        planet_name,
        planet_mass_in_earths,
        planet_mass_in_jupiters,
        planet_mass_measurement_provenance,
        planet_density_in_gcm3,
        planet_temperature_in_k,
        planet_orbit_eccentricity,
        planet_orbital_period_in_days,
        planet_orbit_semi_major_axis_in_au,
        planet_radius_in_earths,
        planet_radius_in_jupiters
    from {{ ref('stg_nasa__exoplanets') }}
)

select * from planet_parameters
