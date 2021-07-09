--covert date to day
select *,
	SUM(daily_vac) OVER (PARTITION BY country order by country,date) as cumulative_vac
into clean2 from clean


select * from clean2 where cumulative_vac > 0 order by country

drop table clean2 

alter table clean alter column vaccines NVARCHAR(200)




