
SELECT transaction_id, COUNT(*) 
FROM `fmcg_analysis.sales_dataset` 
GROUP BY 1 HAVING COUNT(*) > 1;

CREATE OR REPLACE VIEW `fmcg_analysis.v_sales_clean` AS
SELECT 
    *,
    CAST(order_date AS DATE) as clean_order_date
FROM `fmcg_analysis.sales_dataset`;