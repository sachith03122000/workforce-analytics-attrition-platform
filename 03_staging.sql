create table stg_employee as
select
  employee_id,
  full_name,
  gender,
  date_of_birth,
  hire_date,
  role as role_name,
  department,
  grade,
  country,
  city,
  status
from raw_employee;

create table stg_payroll as
select
  employee_id,
  pay_month as date_id,
  base_salary,
  coalesce(bonus, 0) as bonus
from raw_payroll;

create table stg_performance as
select
  employee_id,
  review_date,
  performance_rating
from raw_performance;

create table stg_survey as
select
  employee_id,
  survey_date,
  engagement_score
from raw_survey;
