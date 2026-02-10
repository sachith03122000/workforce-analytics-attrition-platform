insert into dim_role
select distinct
  md5(role_name || department || grade),
  role_name,
  department,
  grade
from stg_employee;

insert into dim_location
select distinct
  md5(country || city),
  country,
  'APAC',
  city
from stg_employee;

insert into dim_employee
select
  e.employee_id,
  e.full_name,
  e.gender,
  e.date_of_birth,
  e.hire_date,
  r.role_id,
  l.location_id,
  e.status
from stg_employee e
join dim_role r
  on e.role_name = r.role_name
 and e.department = r.department
 and e.grade = r.grade
join dim_location l
  on e.country = l.country
 and e.city = l.city;

insert into dim_time
select distinct
  d::date,
  extract(year from d),
  extract(quarter from d),
  extract(month from d),
  to_char(d, 'Month')
from (
  select pay_month as d from raw_payroll
  union
  select review_date from raw_performance
  union
  select survey_date from raw_survey
) t;
