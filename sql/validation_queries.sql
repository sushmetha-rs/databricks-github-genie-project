-- Confirm the imported row count.
SELECT COUNT(*) AS issue_count
FROM main.api_learning.github_issues;

-- Count issues by state.
SELECT
    state,
    COUNT(*) AS issue_count
FROM main.api_learning.github_issues
GROUP BY state
ORDER BY issue_count DESC;

-- Show recently updated issues.
SELECT
    issue_number,
    title,
    state,
    assignee,
    updated_at,
    issue_url
FROM main.api_learning.github_issues
ORDER BY updated_at DESC
LIMIT 20;

-- Find unassigned open issues.
SELECT
    issue_number,
    title,
    created_at,
    issue_url
FROM main.api_learning.github_issues
WHERE state = 'open'
  AND assignee IS NULL
ORDER BY created_at;
