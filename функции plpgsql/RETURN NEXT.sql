CREATE FUNCTION return_ints()
RETURNS SETOF int AS $$
BEGIN
	RETURN NEXT 1;
	RETURN NEXT 2;
	RETURN NEXT 3;
	RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM return_ints()

CREATE FUNCTION after_christmas_sale() RETURNS SETOF products AS $$
DECLARE
	product record;
BEGIN
	FOR product IN SELECT * FROM products
	LOOP
		If product.category_id IN (1,4,8) THEN
			product.unit_price = product.unit_price * 0.8;
		ELSEIF product.category_id IN (2, 3, 7) THEN
			product.unit_price = product.unit_price * 0.75;
		ELSE
		 product.unit_price = product.unit_price * 1.1
		END IF;
END;
$$ LANGUAGE plpgsql;