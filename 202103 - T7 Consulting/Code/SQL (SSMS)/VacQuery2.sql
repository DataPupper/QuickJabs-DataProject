select distinct country,
	MAX(total_vaccinations) as total,
	SUM(daily_vac) as daily_sum,
	ABS((MAX(total_vaccinations)-SUM(daily_vac))/MAX(total_vaccinations)) as perc_diff
into clean_check from clean
group by country

select * from clean_check order by country

drop table clean_check

alter table clean alter column daily_vac float
alter table clean alter column total_vaccinations float
