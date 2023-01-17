-- Overall Performance by Year when Order Status is Finished
SELECT * FROM DQLAB_SALES_STORE DSS ;

SELECT 
	TO_CHAR(ORDER_DATE, 'yyyy') years,
	SUM(SALES) sales,
	COUNT(ORDER_ID) number_of_order 
FROM DQLAB_SALES_STORE DSS
WHERE ORDER_STATUS = 'Order Finished'
GROUP BY 1
ORDER BY 1;

-- Overall Performance by Product Sub Category in 2011-2012
SELECT 
	TO_CHAR(ORDER_DATE, 'yyyy') years,
	PRODUCT_SUB_CATEGORY ,
	SUM(SALES) sales  
FROM DQLAB_SALES_STORE DSS
WHERE ORDER_STATUS = 'Order Finished' AND TO_CHAR(ORDER_DATE, 'yyyy') IN('2011','2012')
GROUP BY 1,2
ORDER BY 1,3 DESC ;

-- Promotion Effectiveness and Efficiency by Years
SELECT 
	TO_CHAR(ORDER_DATE, 'yyyy') years,
	SUM(SALES) sales,
	SUM(DISCOUNT_VALUE) promotion_value,
	ROUND((SUM(CAST(DISCOUNT_VALUE AS NUMERIC))/SUM(CAST(SALES AS NUMERIC)))*100, 2) burn_rate_percentage  
FROM DQLAB_SALES_STORE DSS
WHERE ORDER_STATUS = 'Order Finished'
GROUP BY 1
ORDER BY 1 ;

-- Promotion Effectiveness and Efficiency by Product Sub Category
SELECT 
	TO_CHAR(ORDER_DATE, 'yyyy') years,
	PRODUCT_SUB_CATEGORY ,
	PRODUCT_CATEGORY ,
	SUM(SALES) sales,
	SUM(DISCOUNT_VALUE) promotion_value,
	ROUND((SUM(CAST(DISCOUNT_VALUE AS NUMERIC))/SUM(CAST(SALES AS NUMERIC)))*100, 2) burn_rate_percentage
FROM 
	DQLAB_SALES_STORE DSS 
WHERE TO_CHAR(ORDER_DATE, 'yyyy') = '2012' AND ORDER_STATUS = 'Order Finished'
GROUP BY 1,2,3
ORDER BY 4 DESC;

-- Customers Transactions per Year
SELECT 
	TO_CHAR(ORDER_DATE, 'yyyy') years,
	COUNT(DISTINCT CUSTOMER) number_of_customer
FROM 
	DQLAB_SALES_STORE DSS 
WHERE ORDER_STATUS = 'Order Finished'
GROUP BY 1;

-- number of customer by order_status and years
SELECT 
	TO_CHAR(ORDER_DATE, 'yyyy') years,
	ORDER_STATUS ,
	COUNT(DISTINCT CUSTOMER) number_of_customer
FROM 
	DQLAB_SALES_STORE DSS 
GROUP BY 1,2;

-- Percentage Possible Churn by year
WITH diff_transaction as(
SELECT
	CUSTOMER ,
	max(ORDER_DATE) first_order,
	(SELECT max(ORDER_DATE) FROM DQLAB_SALES_STORE DSS WHERE TO_CHAR(ORDER_DATE, 'yyyy') = '2009') max_order_date,
	(SELECT max(ORDER_DATE) FROM DQLAB_SALES_STORE DSS WHERE TO_CHAR(ORDER_DATE, 'yyyy') = '2009') - max(ORDER_DATE) diff_transaction_date
FROM 
	DQLAB_SALES_STORE DSS 
WHERE TO_CHAR(ORDER_DATE, 'yyyy') = '2009'
GROUP BY 1
)
SELECT 
	ROUND(CAST(COUNT(DISTINCT CASE WHEN DF.DIFF_TRANSACTION_DATE > 90 THEN df.CUSTOMER END) AS NUMERIC) / CAST(COUNT(DISTINCT dss.customer) AS NUMERIC), 2) POSSIBLE_CHURN,
	ROUND(CAST(COUNT(DISTINCT CASE WHEN DF.DIFF_TRANSACTION_DATE <= 90 THEN df.CUSTOMER END) AS NUMERIC) / CAST(COUNT(DISTINCT dss.customer) AS NUMERIC), 2) NORMAL
FROM
	DQLAB_SALES_STORE dss
JOIN 
	diff_transaction df
		ON dss.customer = df.customer;

