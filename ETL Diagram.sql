CREATE TABLE "cases" (
  "last_update" DATETIME,
  "fips_code" INT PRIMARY KEY,
  "county_name" VARCHAR(30),
  "state_name" VARCHAR(30),
  "total_population" INT,
  "confirmed" INT,
  "confirmed_per_100000" FLOAT(2),
  "deaths" INT,
  "deaths_per_100000" FLOAT(2)
);

CREATE TABLE "unemployment" (
  "FIPStxt" INT PRIMARY KEY,
  "Civilian_labor_force_2019" INT,
  "Employed_2019" INT,
  "Unemployed_2019" INT,
  "Unemployment_rate_2019" FLOAT(2),
  "Median_Household_Income_2018" FLOAT(2),
  "Med_HH_Income_Percent_of_State_Total_2018" FLOAT(2)
);

ALTER TABLE "unemployment" ADD FOREIGN KEY ("FIPStxt") REFERENCES "cases" ("fips_code");
