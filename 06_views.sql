create view vw_employee_360 as
select
  e.employee_id,
  e.full_name,
  r.role_name,
  r.department,
  r.grade,
  l.country,
  l.city,
  e.hire_date,
  e.status
from dim_employee e
join dim_role r on e.role_id = r.role_id
join dim_location l on e.location_id = l.location_id;

create view vw_hr_executive_summary as
select
  count(*) as total_employees,
  sum(case when status = 'Active' then 1 else 0 end) as active_employees,
  sum(case when status = 'Exited' then 1 else 0 end) as exited_employees
from dim_employee;

create view vw_attrition_risk_summary as
select
  risk_bucket,
  count(*) as employee_count
from employee_attrition_risk
group by risk_bucket;
