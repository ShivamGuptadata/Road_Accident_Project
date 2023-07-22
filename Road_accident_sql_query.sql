
SELECT * FROM Road_Accident_Data

select count(*) as Total_data from Road_Accident_Data

select top 5 * from Road_Accident_Data
where year(accident_date) = '2022'
order by YEAR(accident_date) asc

select top 5 * from Road_Accident_Data
where year(accident_date) = '2022'
order by YEAR(accident_date) desc

SELECT SUM(Number_of_Casualties) as CY_Casualities
from Road_Accident_Data
where year(accident_date) = '2022' 

SELECT SUM(Number_of_Casualties) as CY_Casualities
from Road_Accident_Data
where year(accident_date) = '2022' and Road_Surface_Conditions = 'Dry'

select count(distinct Accident_Index) as CY_Accident 
from Road_Accident_Data
where YEAR(Accident_Date) ='2022'

SELECT SUM(Number_of_Casualties) as CY_Fatal_Casualities
from Road_Accident_Data
where year(accident_date) = '2022' and Accident_Severity = 'Fatal'

SELECT SUM(Number_of_Casualties) as CY_Serious_Casualities
from Road_Accident_Data
where year(accident_date) = '2022' and Accident_Severity = 'Serious'

SELECT SUM(Number_of_Casualties) as CY_Slight_Casualities
from Road_Accident_Data
where year(accident_date) = '2022' and Accident_Severity = 'Slight'

SELECT cast(SUM(Number_of_Casualties) as decimal(10,2))*100/
(select cast(SUM(number_of_casualties) as decimal(10,2)) from Road_Accident_Data)
as per_Casualities from Road_Accident_Data
where Accident_Severity = 'Serious'

select datename(month, accident_date) as month_name, sum(number_of_casualties) as PY_Casualties
from Road_Accident_Data
where YEAR(accident_date) = '2022'
group by DATENAME(month, accident_date)

select road_type, sum(number_of_casualties) as CY_casualties 
from Road_Accident_Data
where year(accident_date) = '2022'
group by Road_Type

select Urban_or_Rural_Area, sum(number_of_casualties) as CY_casualties
from Road_Accident_Data
where year(accident_date) = '2022'
group by Urban_or_Rural_Area

select Urban_or_Rural_Area, cast(SUM(Number_of_Casualties) as decimal(10,2))*100/
(select cast(SUM(Number_of_Casualties) as decimal(10,2)) from Road_Accident_Data where YEAR(accident_date) = '2022')
as CY_casualties
from Road_Accident_Data
where year(accident_date) = '2022'
group by Urban_or_Rural_Area

select
	CASE
		when vehicle_type in ('Agricultural vehical') then 'Agricultural'
		when Vehicle_Type in ('Car','Taxi/Private hire car') then 'Cars'
		when vehicle_type in ('Motercycle 125cc and under','Motercycle 50cc and under','Motercycle over 125cc and up to 500cc','Motercycle over 500cc','Pedal cycle') then 'Bike'
		when Vehicle_Type in ('Van / Goods 3.5 tonnes mgw or under','Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t.') then 'Van'
		when Vehicle_Type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') then 'Bus'
		else 'Oters'
	end as vehicle_group,
	sum(number_of_casualties) as CY_Casulaties
from Road_Accident_Data
where year(accident_date) = '2022'
Group by
	CASE
		when Vehicle_Type in ('Agricultural vehical') then 'Agricultural'
		when Vehicle_Type in ('Car','Taxi/Private hire car') then 'Cars'
		when vehicle_type in ('Motercycle 125cc and under','Motercycle 50cc and under','Motercycle over 125cc and up to 500cc','Motercycle over 500cc','Pedal cycle') then 'Bike'
		when vehicle_type in ('Van / Goods 3.5 tonnes mgw or under','Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t.') then 'Van'
		when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') then 'Bus'
		else 'Oters'
	END

select Light_Conditions from Road_Accident_Data

select
	case
		when light_conditions in ('Daylight') then 'Day'
		else 'Night'
	end as Light_group,
	sum(number_of_casualties) as CY_casualties
from Road_Accident_Data
where year(accident_date) = '2022'
Group by
	case
		when light_conditions in ('Daylight') then 'Day'
		else 'Night'
	end 


