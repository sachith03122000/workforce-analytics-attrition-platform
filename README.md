# Workforce Analytics & Attrition Risk Platform

## Overview
An end-to-end workforce analytics platform that consolidates HR, payroll,
performance, and engagement data into a unified analytics layer. The system
supports executive reporting and generates explainable attrition risk insights
to enable proactive HR decision-making.

## Architecture
- Supabase Postgres used as the analytics warehouse
- SQL-based transformations (raw → staging → curated)
- Dimensional data model (star schema)
- Analytics-ready views for BI consumption
- Rule-based attrition risk scoring (ML-ready design)

## Data Model
Dimensions:
- dim_employee
- dim_role
- dim_location
- dim_time

Facts:
- fact_headcount
- fact_payroll
- fact_performance
- fact_attrition

## Attrition Risk Logic
Risk is derived using:
- Employee tenure
- Performance ratings
- Engagement scores

Initial implementation uses explainable rule-based scoring,
designed to be extended with ML models (e.g., Dataiku DSS).

## Example Outputs
See screenshots folder for:
- Executive workforce summary
- Attrition risk distribution
- High-risk employee action list

## Future Enhancements
- ML-based attrition prediction using Dataiku
- Automated pipeline orchestration
- Role-based access control
- Scale-out to enterprise data platforms
