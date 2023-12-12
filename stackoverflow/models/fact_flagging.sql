-- fact_flagging.sql

-- Assuming the flagged interaction data is stored in a source named stackoverflow
-- Adjust the source name and column names based on the actual dbt source configuration

-- Use the appropriate column names and data types in the SELECT statement
-- For demonstration purposes, placeholders are used. Replace them with actual column names.

WITH stg_flagged_interactions AS
(
    -- Replace the following SELECT statement with your logic to extract and transform flagged interaction data
    SELECT
        flagging_key::int as flagging_key,
        user_key::int as user_key,
        post_key::int as post_key,
        time_key::int as time_key,
        moderator_key::int as moderator_key,
        flag_type_key::int as flag_type_key,
        flag_status_key::int as flag_status_key,
        flag_reason_key::int as flag_reason_key,
        interaction_date
    FROM {{ source('stackoverflow', 'fact_flagging') }}
)
SELECT
    flagging_key,
    user_key,
    post_key,
    time_key,
    moderator_key,
    flag_type_key,
    flag_status_key,
    flag_reason_key,
    interaction_date
FROM stg_flagged_interactions
