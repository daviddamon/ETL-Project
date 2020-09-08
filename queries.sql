-- Create tables for raw data to be loaded into
DROP TABLE IF EXISTS cases CASCADE;
CREATE TABLE cases (
	last_update TIMESTAMPTZ NOT NULL,
	fips_code INT PRIMARY KEY NOT NULL,
	county_name VARCHAR(30) NOT NULL,
	state_name VARCHAR(30) NOT NULL,
	total_population INT NOT NULL,
	confirmed INT NOT NULL,
	confirmed_per_100000 FLOAT(2) NOT NULL,
	deaths INT NOT NULL,
	deaths_per_100000 FLOAT(2) NOT NULL
);

DROP TABLE IF EXISTS unemployment CASCADE;
CREATE TABLE unemployment (
	FIPStxt INT NOT NULL FOREIGN KEY,
	Civilian_labor_force_2019 INT NOT NULL, 
	Employed_2019 INT NOT NULL,
	Unemployed_2019 INT NOT NULL,
	Unemployment_rate_2019 FLOAT(2) NOT NULL,
	Median_Household_Income_2018 FLOAT(2) NOT NULL,
	Med_HH_Income_Percent_of_State_Total_2018 FLOAT(2) NOT NULL
	CONSTRAINT pk_unemployment PRIMARY KEY (FIPStxt)
);

--- Query tables to check columns
SELECT * FROM cases;

SELECT * FROM unemployment;

-- Joins tables
SELECT 
	cases.last_update, 
	cases.fips_code,
	cases.county_name,
	cases.state_name,
	cases.total_population,
	cases.confirmed,
	cases.confirmed_per_100000,
	cases.deaths,
	cases.deaths_per_100000,
	unemployment.FIPStxt,
	unemployment.Civilian_labor_force_2019,
	unemployment.Employed_2019,
	unemployment.Unemployed_2019,
	unemployment.Unemployment_rate_2019,
	unemployment.Median_Household_Income_2018,
	unemployment.Med_HH_Income_Percent_of_State_Total_2018
FROM cases
INNER JOIN unemployment
ON cases.fips_code = unemployment.FIPStxt;
