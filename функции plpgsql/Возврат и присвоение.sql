CREATE OR REPLACE FUNCTION get_total_number_of_goods() RETURNS bigint AS $$
BEGIN
	RETURN sum(units_in_stock)
	FROM products;
END;
$$ LANGUAGE plpgsql

SELECT get_total_number_of_goods()


CREATE OR REPLACE FUNCTION get_max_price_from_discontinued() RETURNS bigint AS $$
BEGIN
	RETURN MAX(unit_price)
	FROM products
	WHERE discontinued = 1;
END;
$$ LANGUAGE plpgsql;

SElECT get_max_price_from_discontinued(); 

CREATE OR REPLACE FUNCTION get_price_boundaries
(OUT max_price real, OUT min_price real) AS $$
BEGIN
	--max_price := MAX(unit_price) FROM products;
	--min_price := MIN(unit_price) FROM products;
	SELECT MAX(unit_price), MIN(unit_price)
	INTO max_price, min_price
	FROM products;
END;

$$ LANGUAGE plpgsql;

SELECT get_price_boundaries()

CREATE OR REPLACE FUNCTION get_sum
(x int, y int, OUT RESULT int) AS $$
BEGIN
	result := x + y;
	RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_sum(1, 2);

DROP FUNCTION get_customers_by_country
CREATE FUNCTION get_customers_by_country
(customer_country varchar)
RETURNS SETOF customers AS $$
BEGIN
	RETURN QUERY
	SELECT *
	FROM customers
	WHERE country = customer_country;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_customers_by_country('USA');