-- dim_comment.sql

-- Assuming the comment data is stored in a source named stackoverflow
-- Adjust the source name and column names based on the actual dbt source configuration

-- Use the appropriate column names and data types in the SELECT statement
-- For demonstration purposes, placeholders are used. Replace them with actual column names.

SELECT
    comment_key::int as comment_key,
    comment_id,
    comment_text,
    user_key::int as user_key,
    post_key::int as post_key,
    creation_date
FROM {{ source('stackoverflow', 'dim_comment') }}
