with source as (
    select * from {{ source('bq_1', 'nasa_exoplanets_archive') }}
),

renamed as (
    select
        {{ adapter.quote("disc_facility") }} as discovery_facility,
        {{ adapter.quote("disc_instrument") }} as discovery_instrument,
        {{ adapter.quote("disc_locale") }} as discovery_locale,
        {{ adapter.quote("disc_telescope") }} as discovery_telescope,
        {{ adapter.quote("disc_year") }} as discovery_year,
        {{ adapter.quote("discoverymethod") }} as discovery_method,
        {{ adapter.quote("sy_gaiamag") }} as star_brightness_in_gaia,
        {{ adapter.quote("sy_kmag") }} as star_brightness_in_k,
        {{ adapter.quote("sy_vmag") }} as star_brightness_in_v,
        {{ adapter.quote("pl_bmasse") }} as planet_mass_in_earths,
        {{ adapter.quote("pl_bmassj") }} as planet_mass_in_jupiters,
        {{ adapter.quote("pl_bmassprov") }}
            as planet_mass_measurement_provenance,
        {{ adapter.quote("pl_dens") }} as planet_density_in_gcm3,
        {{ adapter.quote("pl_eqt") }} as planet_temperature_in_k,
        {{ adapter.quote("pl_name") }} as planet_name,
        {{ adapter.quote("pl_orbeccen") }} as planet_orbit_eccentricity,
        {{ adapter.quote("pl_orbper") }} as planet_orbital_period_in_days,
        {{ adapter.quote("pl_orbsmax") }} as planet_orbit_semi_major_axis_in_au,
        {{ adapter.quote("pl_rade") }} as planet_radius_in_earths,
        {{ adapter.quote("pl_radj") }} as planet_radius_in_jupiters,
        {{ adapter.quote("dec") }} as star_declination_in_deg,
        {{ adapter.quote("ra") }} as star_right_ascension_in_deg,
        {{ adapter.quote("hostname") }} as star_name,
        {{ adapter.quote("st_age") }} as star_age_in_gyr,
        {{ adapter.quote("st_logg") }} as star_surface_gravity_in_g,
        {{ adapter.quote("st_mass") }} as star_mass_in_suns,
        {{ adapter.quote("st_met") }} as star_metallicity_in_dex,
        {{ adapter.quote("st_metratio") }} as star_metallicity_ratio,
        {{ adapter.quote("st_rad") }} as star_radius_in_suns,
        {{ adapter.quote("st_spectype") }} as star_spectral_type,
        {{ adapter.quote("st_teff") }} as star_temperature_in_k,
        {{ adapter.quote("sy_dist") }} as star_distance_in_parsecs,
        {{ adapter.quote("sy_pnum") }} as star_number_of_planets,
        {{ adapter.quote("sy_snum") }} as star_number_of_stars

    from source
)

select * from renamed
