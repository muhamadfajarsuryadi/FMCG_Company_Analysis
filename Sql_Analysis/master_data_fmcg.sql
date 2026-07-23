WITH base_data AS (
  SELECT 
    s.transaction_id,
    s.clean_order_date,
    s.customer_id,
    s.product_id,
    s.quantity,
    s.region,
    s.sales_channel,
    p.product_name, 
    p.category, 
    p.brand, 
    p.cost, 
    p.selling_price,
    -- Menghitung Revenue dan Profit berdasarkan rumus unit real perusahaan FMCG
    (s.quantity * p.selling_price) as calc_revenue,
    (s.quantity * (p.selling_price - p.cost)) as total_profit
  FROM `fmcg_analysis.v_sales_clean` s
  JOIN `fmcg_analysis.product_dataset` p ON s.product_id = p.product_id
)
SELECT * FROM base_data;