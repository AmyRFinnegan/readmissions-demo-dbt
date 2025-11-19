select
  patient_id,
  gender,
  cast(birth_date as date) as birth_date,
  extract(year from date_diff(current_date(), birth_date, year)) as age
from {{ source('readmissions_demo', 'patients') }}
