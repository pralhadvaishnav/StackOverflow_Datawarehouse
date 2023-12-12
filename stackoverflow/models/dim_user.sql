-- dim_user.sql

-- Assuming the Stack Overflow user data is stored in a source named stackoverflow
-- Adjust the source name and column names based on the actual dbt source configuration

-- Use the appropriate column names and data types in the SELECT statement
-- For demonstration purposes, placeholders are used. Replace them with actual column names.

SELECT
    user_key::int as user_key,
    user_id,
    display_name,
    reputation,
    creation_date,
    last_access_date,
    location
FROM {{ source('stackoverflow', 'dim_user') }}

