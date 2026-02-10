insert into fact_headcount
select
  employee_id,
  hire_date,
  1
from dim_employee
where status = 'Active';

insert into fact_payroll
select
  employee_id,
  date_id,
  base_salary,
  bonus
from stg_payroll;

insert into fact_performance
select
  employee_id,
  review_date,
  performance_rating
from stg_performance;

insert into fact_attrition
select
  employee_id,
  hire_date + interval '5 years',
  'Voluntary'
from dim_employee
where status = 'Exited';
