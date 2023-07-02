-- Importing the cleaned data for sql queries--

SELECT * FROM `covid-19`;

-- Find the number of corona patients who faced shortness of breath.
  
select shortness_of_breath, count(corona)
from `covid-19`
where corona='positive' and Shortness_of_breath='True';

/*
Conclusion: There are 1162 number of corona patients who faced shortness of breath
*/

-- Find the number of negative corona patients who have fever and sore_throat. 

select fever, sore_throat, count(corona) 
from `covid-19` where corona='negative'
group by fever,Sore_throat
having fever='True' and Sore_throat='True';

/*
Conclusion: There are 121 corona negative patients who have fever and sore_throat
*/

-- Group the data by month and rank the number of positive cases.

select month(Test_date) as month,COUNT(Ind_ID) as positivecases,
rank() over(order by count(Ind_ID) desc) as "rank"
from `covid-19` 
where corona="positive"
group by month(Test_date);

/*
Conclusion: There are 14694 number of corona positive patients
*/

-- Find the female negative corona patients who faced cough and headache.

select * from `covid-19` 
where Sex = "female" 
and Corona = "negative" 
and Cough_symptoms = "TRUE" 
and Headache = "TRUE";

/*
Conclusion: There are 32 female corona negative patients who faced cough and headache
*/

-- How many elderly corona patients have faced breathing problems?

select count(*)
from `covid-19`
where Age_60_above = "Yes"
and Shortness_of_breath = "TRUE";

/*
Conclusion: There are 291 number of elderly corona patients who faced breathing problems
*/

-- Which three symptoms were more common among COVID positive patients?

select 
	(select count(*) from `covid-19` where Cough_symptoms = "TRUE" and corona = "positive") as Cough_count,
    (select count(*) from `covid-19` where Fever = "TRUE" and corona = "positive") as Fever_count,
    (select count(*) from `covid-19` where Sore_throat = "TRUE" and corona = "positive") as Sore_count,
    (select count(*) from `covid-19` where Shortness_of_breath = "TRUE" and corona = "positive") as shortBreath_count,
    (select count(*) from `covid-19` where Headache = "TRUE" and corona = "positive") as headache_count,
    (select count(*) from `covid-19` where corona = "positive") as positive_count
from `covid-19`
limit 1;

/*
Conclusion:  Cough_Symptoms, Fever and Headache are the most common symptoms among Corona positive patients.
*/

-- Which symptom was less common among COVID negative people?

select 
	(select count(*) from `covid-19` where Cough_symptoms = "TRUE" and corona = "negative") as Cough_count,
    (select count(*) from `covid-19` where Fever = "TRUE" and corona = "negative") as Fever_count,
    (select count(*) from `covid-19` where Sore_throat = "TRUE" and corona = "negative") as Sore_count,
    (select count(*) from `covid-19` where Shortness_of_breath = "TRUE" and corona = "negative") as shortBreath_count,
    (select count(*) from `covid-19` where Headache = "TRUE" and corona = "negative") as headache_count,
    (select count(*) from `covid-19` where corona = "negative") as negative_count
from `covid-19` 
limit 1;

 /*
Conclusion:  Headache, Shortness of Breath, Sore throat symptom was less common among COVID negative people. 
*/


-- What are the most common symptoms among COVID positive males whose known contact was abroad? 

select 
	(select count(*) from  `covid-19` where Cough_symptoms = "TRUE" and corona = "positive" and Known_contact like '%Abroad%') as Cough_count,
    (select count(*) from  `covid-19`where Fever = "TRUE" and corona = "positive" and Known_contact like '%Abroad%') as Fever_count,
    (select count(*) from  `covid-19` where Sore_throat = "TRUE" and corona = "positive" and Known_contact like '%Abroad%') as Sore_count,
    (select count(*) from  `covid-19` where Shortness_of_breath = "TRUE" and corona = "positive" and Known_contact like '%Abroad%') as shortBreath_count,
    (select count(*) from  `covid-19` where Headache = "TRUE" and corona = "positive" and Known_contact like '%Abroad%') as headache_count,
    (select count(*) from  `covid-19` where corona = "positive"  and Known_contact like '%Abroad%') as positive_Abroad
from  `covid-19`
limit 1;

 /*
Conclusion: Cough and Fever are the most common symptoms among COVID positive males whose known contact was abroad.
*/