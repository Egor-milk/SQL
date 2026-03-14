SELECT *
FROM customers

SELECT *
INTO tmp_customers
FROM customers

SELECT *
FROM tmp_customers

UPDATE tmp_customers
SET region = 'unknown'
WHERE region IS NULL;

CREATE OR REPLACE FUNCTION fix_customer_region() 
	RETURNS void AS $$
		UPDATE tmp_customers
		SET region = 'unknown'
		WHERE region IS NULL
	$$ language SQL

SELECT fix_customer_region();

SELECT *
FROM tmp_customers