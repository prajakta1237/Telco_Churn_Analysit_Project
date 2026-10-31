create database telco_analysis;
use telco_analysis;

select * from Telco_Customer_Churn
limit 10;

select 
count(distinct customerID) as total_customers,
sum(case when Churn = "Yes"
	THEN 1 ELSE 0 END) AS churned_customers,
round(
	100.0 * sum(case when Churn = "Yes"
			Then 1 else 0 end)
    / count(distinct customerID), 2
    )
    as churn_rate_percent
from Telco_Customer_Churn;


SELECT Contract,
    COUNT(DISTINCT customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes'
        THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes'
                    THEN 1 ELSE 0 END)
        / COUNT(DISTINCT customerID),
        2
    ) AS churn_rate_percent
FROM Telco_Customer_Churn
GROUP BY Contract
ORDER BY churn_rate_percent DESC;

SELECT
    Contract,
    InternetService,
    COUNT(DISTINCT customerID) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(DISTINCT customerID),
        2
    ) AS churn_rate_percent
FROM Telco_Customer_Churn
GROUP BY Contract, InternetService
HAVING COUNT(DISTINCT customerID) >= 50
ORDER BY churn_rate_percent DESC;
