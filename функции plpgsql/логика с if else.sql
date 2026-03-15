CREATE FUNCTION convert_temp_to
(temperature real, to_celcius bool DEFAULT true)
RETURNS real AS $$
DECLARE
	result_temp real;
BEGIN
	IF to_celcius THEN
		result_temp = (5.0/9.0)*(temperature-32);
	ELSE
		result_temp = (9*temperature+(32*5))/5.0;
	END IF;

	RETURN result_temp;
END;
$$ LANGUAGE plpgsql;

SELECT convert_temp_to(80);
SELECT convert_temp_to(26.7, false);

drop function if exists get_season;
create or replace function get_season(month_number int) returns text AS $$
declare
	season text;
begin
	if month_number BETWEEN 3 and 5 then
		season = 'Spring';
	elsif month_number BETWEEN 6 and 8 then
		season = 'Summer';
	elsif month_number BETWEEN 9 and 11 then
		season = 'Autumn';
	else
		season = 'Winter';
	end if;
	
	return season;

end;
$$ language plpgsql;

select get_season(12)

