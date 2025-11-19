with ordered as (
    select
        e.*,
        lead(admit_date) over (partition by patient_id order by admit_date) as next_admit
    from {{ ref('stg_encounters') }} e
),

readmissions as (
    select
        *,
        case 
          when next_admit is not null
           and date_diff(next_admit, discharge_date, day) <= 30
          then 1 else 0
        end as is_30day_readmit
    from ordered
)

select * from readmissions
