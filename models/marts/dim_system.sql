select
{{ dbt_utils.generate_surrogate_key(['hostname','sy_snum', 'sy_pnum']) }} as system_key,
hostname, sy_snum, sy_pnum
from {{ ref('stg_nasa__exoplanets') }}
group by system_key, hostname, sy_snum, sy_pnum