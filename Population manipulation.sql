--- Overview of the dataset
select * from Covid19..covid

-- Number of rows present in our dataset
select count (*) from Covid19..covid    ---38323 rows are present in the dataset

--Filter out the dataset for Hessen
select * from Covid19..covid where state in ('Hessen')

--- Total Covid cases, deaths and recovered for the three states
select sum(cases) as cases from Covid19..covid 
select sum(deaths) as deaths from Covid19..covid 
select sum(recovered) as recovered from Covid19..covid 

--- Average daily Covid cases for infected people in the 3 states 
select avg(cases) as Hessen from Covid19..covid where state in ('Hessen')
select avg(cases) as Bremen from Covid19..covid where state in ('Bremen')
select avg(cases) as Hamburg from Covid19..covid where state in ('Hamburg')

--- Number of cases by gender that contacted Covid in Hessen and Hamburg
select gender, sum(cases) as gender from Covid19..covid where state in ('Hessen') group by gender
select gender, sum(cases) as gender from Covid19..covid where state in ('Hamburg') group by gender

--- Number of cases by age group that contacted Covid in Hessen
select age_group, sum(cases) as cases from Covid19..covid where state in ('Hessen') group by age_group order by cases desc

--- Age group with the highest number of deaths in the 3 states
select age_group, sum(deaths) as death from Covid19..covid group by age_group order by death desc

--- Age group with the highest recovery rate from the covid 19
select age_group, round(avg(recovered)*100,0) as recovery_rate from Covid19..covid group by age_group order by recovery_rate desc

--- County with the deaths count above 1000 in the 3 states
select distinct county from Covid19..covid
select county, sum(deaths) as death from Covid19..covid group by county having sum(deaths) > 1000

--- Number of cases only for old people with age range between 60 and 80 years
select sum(cases) as cases from Covid19..covid where age_group = '60-79'

--- How many cases do we have in the 2021 summer period (June, July and August)
select county, sum(cases) as cases, DATEDIFF(MONTH,'2021/06/01','2021/09/01') as summer_month from Covid19..covid group by county
