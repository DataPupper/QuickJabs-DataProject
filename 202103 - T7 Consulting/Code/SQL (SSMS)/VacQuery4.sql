--adding world population
select *,
	DENSE_RANK() over (PARTITION BY a.country ORDER BY a.country, date) as day,
	cumulative_vac/population as vac_pop_perc
into clean3 from clean2 a
LEFT JOIN population b
ON a.country = b.Location
where cumulative_vac > 0

select * from clean3
alter table clean3 drop column total_vaccinations
alter table clean3 drop column location

drop table clean3


