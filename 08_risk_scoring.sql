create table employee_attrition_risk as
select
  employee_id,
  tenure_months,
  total_comp,
  performance_rating,
  engagement_score,
  has_left,
  (
    case when tenure_months < 24 then 2 else 0 end +
    case when performance_rating <= 3 then 2 else 0 end +
    case when engagement_score <= 3 then 2 else 0 end
  ) as risk_score,
  case
    when (
      case when tenure_months < 24 then 2 else 0 end +
      case when performance_rating <= 3 then 2 else 0 end +
      case when engagement_score <= 3 then 2 else 0 end
    ) >= 4 then 'High'
    when (
      case when tenure_months < 24 then 2 else 0 end +
      case when performance_rating <= 3 then 2 else 0 end +
      case when engagement_score <= 3 then 2 else 0 end
    ) between 2 and 3 then 'Medium'
    else 'Low'
  end as risk_bucket
from employee_attrition_features;
