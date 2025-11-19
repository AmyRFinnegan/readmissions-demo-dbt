select
  encounter_id,
  patient_id,
  cast(admit_date as date) as admit_date,
  cast(discharge_date as date) as discharge_date,
  primary_dx
from {{ source('readmissions_demo', 'encounters') }}
