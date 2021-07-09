select DISTINCT (country), [Med  Age] as median_age, 
	ABS((25 - [Med  Age])/25) as median_age_effi,
	SQRT(ABS((25 - [Med  Age])/25)) as score_median_age
into winner_age from clean3

select * from winner_age order by score_median_age DESC

drop table winner_age

update clean3 set [Med  Age] = NULL where [Med  Age] = 'N.A.'

alter table clean3 alter column [Med  Age] float
update clean3 set [Med  Age] = 40 where country = 'England'
update clean3 set [Med  Age] = 41 where country = 'Wales'
update clean3 set [Med  Age] = 42 where country = 'Scotland'
update clean3 set [Med  Age] = 38 where country = 'Northern Ireland'