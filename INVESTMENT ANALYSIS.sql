CREATE TABLE financial_data (
      gender VARCHAR(10),
    age INT,
    invest_in_investment_avenues VARCHAR(3),
    mutual_funds_rank INT,
    equity_market_rank INT,
    debentures_rank INT,
    government_bonds_rank INT,
    fixed_deposits_rank INT,
	public_providendfund_rank INT ,
    gold_rank INT,
    investment_purpose varchar (30),
	         time_period_to_keep_money VARCHAR(20),
	    monitor_rate VARCHAR(10),
    roi_expected VARCHAR(10),
    most_investment VARCHAR(50),
    saving_reason VARCHAR(50),
    reason_for_invest_in_equity VARCHAR(50),
    reason_for_invest_in_mutual_fund VARCHAR(50),
    reason_for_invest_in_govt_bond VARCHAR(50),
    reason_for_invest_in_fixed_deposit VARCHAR(50),
    source_of_information_about_instrument VARCHAR(50) ) ;

SELECT * FROM financial_data ;

copy financial_data (gender,
age,
invest_in_investment_avenues,
mutual_funds_rank,
equity_market_rank,
debentures_rank,
government_bonds_rank ,
fixed_deposits_rank,
public_providendfund_rank,
gold_rank,
investment_purpose,
time_period_to_keep_money,
monitor_rate ,
roi_expected ,
most_investment ,
saving_reason ,
reason_for_invest_in_equity ,
reason_for_invest_in_mutual_fund ,
reason_for_invest_in_govt_bond ,
reason_for_invest_in_fixed_deposit ,
source_of_information_about_instrument) from  'D:\Program Files\pgAdmin 4\FINANCIAL_data 2.csv' delimiter ','
csv header ;

--1. Count of Investors by Gender --
SELECT GENDER, COUNT(*) AS num_investors
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER;

--2) Average Age of Investors by Gender --
SELECT GENDER, AVG(AGE) AS avg_age
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER;

--3) Distribution of Investment Preferences --
SELECT most_investment, COUNT(*) AS count
FROM financial_data
GROUP BY most_investment
ORDER BY count DESC;

-- 4) Top 3 Reasons for Investing in Equity --
SELECT reason_for_invest_in_equity, COUNT(*) AS count
FROM financial_data
GROUP BY reason_for_invest_in_equity 
ORDER BY count DESC limit 3 ;

--5) Distribution of Expected ROI --
SELECT roi_expected , COUNT(*) AS count
FROM financial_data
GROUP BY roi_expected
ORDER BY count DESC; 

--6) Preferred Time Period to Keep Money in Investments --
SELECT time_period_to_keep_money , COUNT(*) AS count
FROM financial_data
GROUP BY time_period_to_keep_money
ORDER BY count DESC;

--7)   Monitoring Frequency of Investments --
SELECT monitor_rate, COUNT(*) AS count
FROM financial_data
GROUP  by monitor_rate
ORDER BY count DESC ;

--8) top 2 Source of Information About Investment Instruments --
SELECT source_of_information_about_instrument, COUNT(*) AS count
FROM financial_data
GROUP BY source_of_information_about_instrument
ORDER BY count DESC LIMIT 2 ;

--9) Ranking of Mutual Funds as an Investment Option --
SELECT mutual_funds_rank, COUNT(*) AS count
FROM financial_data
GROUP BY mutual_funds_rank
ORDER BY count DESC;

--10) Ranking of Equity Market as an Investment Option:
SELECT equity_market_rank, COUNT(*) AS count
FROM financial_data
GROUP BY  equity_market_rank
ORDER BY count DESC;

--11)COUNT  of Reasons for Investing in Government Bonds by Age Group --
SELECT 
    CASE 
        WHEN AGE < 30 THEN 'Under 30'
        WHEN AGE BETWEEN 30 AND 40 THEN '30-40'
        ELSE 'Over 40'
    END AS age_group,
    reason_for_invest_in_govt_bond ,
    COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY age_group, reason_for_invest_in_govt_bond 
ORDER BY count DESC; 

--12) Reasons for Investing in Fixed Deposits by Gender --
SELECT GENDER, reason_for_invest_in_fixed_deposit, COUNT(*) AS count
FROM financial_data
where invest_in_investment_avenues = 'Yes'
GROUP BY GENDER,reason_for_invest_in_fixed_deposit
ORDER BY count DESC; 

--13) Count of Investors by Age Group  --
SELECT case when AGE < 30 then 'Under 30'when AGE between 30 AND 40 then '30-40'else  'Over 40'
    END AS age_group, COUNT(*) AS num_investors FROM financial_data WHERE invest_in_investment_avenues = 'Yes'
GROUP BY age_group;

14) --Investment Preferences by Age Group --
SELECT 
    case 
        when AGE < 30 then 'Under 30' when AGE between 30 and 40 then  '30-40' else 'Over 40' end as age_group,most_investment,
        count(*) as count from financial_data group by age_group,most_investment order by count DESC;

--15) Investment Avenues Preferred by Investors Not Investing --
SELECT most_investment, COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'No'
GROUP BY most_investment
ORDER BY count DESC;

--16) Reasons for Not Investing in Any Avenues --
SELECT saving_reason , COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'No'
GROUP BY  saving_reason
ORDER BY count DESC;

--17) Average Age of Non-Investors by Gender--
SELECT gender, avg(AGE) AS avg_age
from  financial_data
where  invest_in_investment_avenues = 'No'
group by GENDER;

--18) Top Reasons for Investing in Mutual Funds by Gender --
SELECT GENDER, reason_for_invest_in_mutual_fund, COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER,reason_for_invest_in_mutual_fund
ORDER BY count DESC;

--19)Preferred Sources of Information by Gender --
SELECT gender,source_of_information_about_instrument , COUNT(*) AS count
FROM financial_data
GROUP BY gender , source_of_information_about_instrument 
ORDER BY count DESC;

--20) Expected ROI by Age Group --
select  
    case when AGE < 30 then  'Under 30' when AGE between  30 and  40 then  '30-40' else 'Over 40' end as  age_group,roi_expected,
     COUNT(*) AS count from  financial_data Group by age_group, roi_expected order by count DESC;

--21) Distribution of Age by Gender--
	SELECT GENDER, AGE, COUNT(*) AS count from  financial_data group by GENDER, AGE order by count DESC;

--22) Ranking of fixed deposit as an Investment Option --
select  fixed_deposits_rank, COUNT(*) AS count
from financial_data
group by fixed_deposits_rank
order by  count DESC; 

--23) Preferred Investment Options for Retirement Plans --
SELECT most_investment, COUNT(*) AS count
FROM financial_data
WHERE saving_reason= 'Retirement Plan'
GROUP BY most_investment 
ORDER BY count DESC;

--24) topmost  saving reason --
select * from financial_data ;
select saving_reason , count(saving_reason) as count from financial_data group by saving_reason  order by count desc limit 1; 

--25) Preferred Investment Options for Health Care Saving --
SELECT most_investment, COUNT(*) AS count
FROM financial_data
WHERE saving_reason = 'Health Care'
GROUP BY most_investment
ORDER BY count DESC;

--26) Preferred Investment Options for Education Savings --
SELECT  most_investment , COUNT(*) AS count
FROM financial_data
WHERE saving_reason  = 'Education'
group by most_investment
order by count DESC;

--27) Comparison of Reasons for Investing in Mutual Funds vs. Equities:
SELECT 
    reason_for_invest_in_mutual_fund , 
    COUNT(*) AS mutual_fund_count,
    (SELECT COUNT(*) 
     FROM financial_data 
     WHERE reason_for_invest_in_mutual_fund=reason_for_invest_in_equity) AS equity_count
FROM financial_data
GROUP BY reason_for_invest_in_mutual_fund
ORDER BY mutual_fund_count DESC;

--28) Distribution of Investment Preferences by Monitoring Rate --
SELECT monitor_rate, most_investment, COUNT(*) AS count
FROM financial_data
GROUP BY most_investment,monitor_rate
ORDER BY count DESC;

--29) which 4 investment gives the maximum ROI --
Select most_investment, max(roi_expected) as max_return from financial_data group by most_investment order by max_return desc limit 4;

--30) Average Age of Investors  who have invested by Expected ROI--
select roi_expected ,avg(AGE) as avg_age from financial_data WHERE invest_in_investment_avenues = 'Yes' group by roi_expected ;

--31) Reasons for Investing in Different Avenues by Gender--
SELECT GENDER, 
       reason_for_invest_in_equity AS reason, 
       COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER,  reason_for_invest_in_equity
UNION ALL
SELECT GENDER, 
    reason_for_invest_in_mutual_fund AS reason, 
       COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER, reason_for_invest_in_mutual_fund
UNION ALL
SELECT GENDER, 
       reason_for_invest_in_govt_bond AS reason ,
       COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER, reason_for_invest_in_govt_bond
UNION ALL
SELECT GENDER, 
       reason_for_invest_in_fixed_deposit AS reason, 
       COUNT(*) AS count
FROM financial_data
WHERE invest_in_investment_avenues = 'Yes'
GROUP BY GENDER, reason_for_invest_in_fixed_deposit
ORDER BY count DESC;

--32) Investment Preference Trends based on Monitoring rate --
	SELECT 
    source_of_information_about_instrument,
   most_investment ,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY source_of_information_about_instrument )), 2) AS percentage
FROM financial_data
GROUP BY source_of_information_about_instrument ,most_investment
ORDER BY source_of_information_about_instrument, count DESC;

--33) Correlation Between Age and Preferred Investment Avenues --
SELECT 
    AGE,most_investment,COUNT(*) AS count,ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY AGE)), 2) AS percentage
     from  financial_data GROUP BY AGE,most_investment ORDER BY AGE, count DESC;  




    
    






 






         
        
        
          
         









        
    
    







        
        























   

 
