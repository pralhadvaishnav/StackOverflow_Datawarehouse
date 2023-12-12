-- dim_post.sql

-- Assuming the post data is stored in a source named stackoverflow
-- Adjust the source name and column names based on the actual dbt source configuration

-- Use the appropriate column names and data types in the SELECT statement
-- For demonstration purposes, placeholders are used. Replace them with actual column names.

SELECT
    post_key::int as post_key,
    post_id,
    title,
    body,
    creation_date,
    score,
    owner_user_key::int as owner_user_key
FROM {{ source('stackoverflow', 'dim_post') }}
