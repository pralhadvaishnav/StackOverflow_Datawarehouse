-- dim_time.sql

-- Assuming the time data is stored in a source named stackoverflow
-- Adjust the source name and column names based on the actual dbt source configuration

-- Use the appropriate column names and data types in the SELECT statement
-- For demonstration purposes, placeholders are used. Replace them with actual column names.

SELECT
    time_key::int as time_key,
    date,
    day_of_week,
    month,
    year
FROM {{ source('stackoverflow', 'dim_time') }}
