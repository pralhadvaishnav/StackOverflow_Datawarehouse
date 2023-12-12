-- fact_stackoverflow_interaction.sql

-- Assuming the Stack Overflow interaction data is stored in a source named stackoverflow
-- Adjust the source name and column names based on the actual dbt source configuration

-- Use the appropriate column names and data types in the SELECT statement
-- For demonstration purposes, placeholders are used. Replace them with actual column names.

WITH stg_stackoverflow_interactions AS
(
    -- Replace the following SELECT statement with your logic to extract and transform Stack Overflow interaction data
    SELECT
        interaction_id as interaction_key,
        user_id as userkey,
        post_id as postkey,
        time_id as timekey,
        tag_id as tagkey,
        votetype_id as votetypeid,
        comment_id as commentkey,
        badge_id as badgekey,
        interaction_type,
        interaction_date,
        interaction_count
    FROM {{ source('stackoverflow', 'interactions') }}
)
SELECT
    s.*,
    -- Replace the following expressions with the appropriate column names and logic for your model
    userkey::int as userkey,
    postkey::int as postkey,
    timekey::int as timekey,
    tagkey::int as tagkey,
    votetypeid::int as votetypeid,
    commentkey::int as commentkey,
    badgekey::int as badgekey,
    interaction_type,
    interaction_date,
    interaction_count
FROM stg_stackoverflow_interactions s;
