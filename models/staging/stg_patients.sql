select
  patient_id,
  gender,
  birth_date,
  date_diff(current_date(), birth_date, year) as age
from {{ source('readmissions_raw', 'patients') }}

