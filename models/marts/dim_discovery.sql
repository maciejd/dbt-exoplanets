
select
{{ dbt_utils.generate_surrogate_key(['discoverymethod','disc_year','disc_facility']) }} as discovery_key,
disc_year,
disc_facility,
discoverymethod
from `testowy`.stg_nasa__exoplanets
group by discovery_key, disc_year, disc_facility, discoverymethod