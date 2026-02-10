create table employee_attrition_features as
select
  e.employee_id,
  extract(year from age(current_date, e.hire_date)) * 12 +
  extract(month from age(current_date, e.hire_date)) as tenure_months,
  p.base_salary,
  p.bonus,
  (p.base_salary + p.bonus) as total_comp,
  pf.performance_rating,
  s.engagement_score,
  case when e.status = 'Exited' then 1 else 0 end as has_left
from dim_employee e
left join fact_payroll p on e.employee_id = p.employee_id
left join fact_performance pf on e.employee_id = pf.employee_id
left join stg_survey s on e.employee_id = s.employee_id;
