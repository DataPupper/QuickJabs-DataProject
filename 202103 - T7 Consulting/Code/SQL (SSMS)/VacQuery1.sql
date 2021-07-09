Create database vaccine

select * from country_vaccinations
 --Cleaning Daily Vac Logic
update country_vaccinations set daily_vaccinations_raw = NULL where daily_vaccinations_raw = ''
update country_vaccinations set daily_vaccinations = NULL where daily_vaccinations = ''

select  
	country, iso_code, date,
	coalesce(daily_vaccinations_raw,daily_vaccinations,total_vaccinations) daily_vac,
	                              --OR--
	--case
		--when daily_vaccinations_raw IS NOT NULL then daily_vaccinations_raw
		--when daily_vaccinations_raw IS NULL then daily_vaccinations
		--when daily_vaccinations_raw IS NULL and daily_vaccinations IS NULL then total_vaccinations
	--end as daily_vac,
	total_vaccinations,
	vaccines
into clean from country_vaccinations
order by country

drop table clean 

select * from clean order by country