create table raw_employee (
  employee_id varchar,
  full_name text,
  gender text,
  date_of_birth date,
  hire_date date,
  role text,
  department text,
  grade text,
  country text,
  city text,
  status text
);

create table raw_payroll (
  employee_id varchar,
  pay_month date,
  base_salary numeric,
  bonus numeric
);

create table raw_performance (
  employee_id varchar,
  review_date date,
  performance_rating int
);

create table raw_survey (
  employee_id varchar,
  survey_date date,
  engagement_score int
);
