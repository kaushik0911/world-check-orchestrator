{{
    config(
        materialized='incremental',
        unique_key='id'
    )
}}

with source_data as (
    select
        id,
        name,
        md5(concat(id, name)) as row_hash
    from
        {{ ref('raw_countries') }}
),

new_data as (
    select
        sd.*
    from
        source_data sd
    left join {{ this }} existing
    on sd.id = existing.id
    where
        existing.id is null
        or
        sd.row_hash != existing.row_hash
)

select
    id,
    name,
    row_hash
from
    new_data


-- with source_data as (
-- select
--     id,
--     name,
--     md5(concat(id, name)) as row_hash
-- from
--     {{ ref('raw_countries') }}
-- )

-- select
--     id,
--     name,
--     row_hash
-- from
--     source_data
