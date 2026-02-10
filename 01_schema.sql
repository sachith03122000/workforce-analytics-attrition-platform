-- Core dimension tables

create table dim_employee (
  employee_id varchar primary key,
  full_name text,
  gender text,
  date_of_birth date,
  hire_date date,
  role_id varchar,
  location_id varchar,
  status text
);

create table dim_role (
  role_id varchar primary key,
  role_name text,
  department text,
  grade text
);

create table dim_location (
  location_id varchar primary key,
  country text,
  region text,
  city text
);

create table dim_time (
  date_id date primary key,
  year int,
  quarter int,
  month int,
  month_name text
);

-- Fact tables

create table fact_headcount (
  employee_id varchar,
  date_id date,
  headcount int,
  primary key (employee_id, date_id)
);

create table fact_payroll (
  employee_id varchar,
  date_id date,
  base_salary numeric,
  bonus numeric,
  primary key (employee_id, date_id)
);

create table fact_performance (
  employee_id varchar,
  review_date date,
  performance_rating int,
  primary key (employee_id, review_date)
);

create table fact_attrition (
  employee_id varchar primary key,
  exit_date date,
  exit_reason text
);
