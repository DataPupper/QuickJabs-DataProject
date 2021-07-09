select DISTINCT (country), Population, 
	ABS((10000000 - Population)/10000000) as pop_effi,
	LOG(ABS((10000000 - Population)/10000000)) as log_pop_effi,
	ABS(LOG(ABS((10000000 - Population)/10000000))-5)/10 as pop_score
into winner_pop from clean3

select * from winner_pop order by pop_score DESC

drop table winner_pop

alter table clean3 alter column daily_vac int
alter table clean3 alter column cumulative_vac int
alter table clean3 alter column Population float

select * from clean3