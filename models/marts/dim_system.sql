with stars as (

    select
        {{ dbt_utils.generate_surrogate_key(['hostname','sy_snum', 'sy_pnum', 'sy_dist', 'sy_vmag', 'sy_kmag', 'sy_gaiamag']) }} as system_key,
        hostname, 
        sy_snum, 
        sy_pnum, 
        sy_dist, 
        sy_vmag, 
        sy_kmag, 
        sy_gaiamag

    from {{ ref('stg_nasa__exoplanets') }}
)

select * from stars
group by system_key, hostname, sy_snum, sy_pnum, sy_dist, sy_vmag, sy_kmag, sy_gaiamag