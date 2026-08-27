USE [Indian Election Results]

SELECT * FROM constituencywise_details

SELECT * FROM constituencywise_results


SELECT * FROM partywise_results

SELECT * FROM states

SELECT * FROM statewise_results




-- 1. Total Seats

SELECT 
COUNT(DISTINCT [Parliament_Constituency]) AS Total_Seats
FROM constituencywise_results


-- 2. What are the total number of seats available for elections in each state?


SELECT 
s.[State],
COUNT(cr.[Parliament_Constituency]) AS Total_Seats
FROM
constituencywise_results AS cr
JOIN 
statewise_results AS sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states AS s
ON sr.State_ID = s.State_ID
GROUP BY s.[State]


/* While analysing this question i also see that there is an
bad column in our data which is state in statewise_results table */



-- 3. Total Seats Won by NDA Alliance 
 

-- Alliances of NDA
/* 
Bharatiya Janata Party (BJP): 240 seats
Telugu Desam Party (TDP): 16 seats
Janata Dal (United) - JD(U): 12 seats
Shiv Sena (SHS - Eknath Shinde faction): 7 seats
Lok Janshakti Party (Ram Vilas) - LJPRV: 5 seats
Janata Dal (Secular) - JD(S): 2 seats
Rashtriya Lok Dal (RLD): 2 seats
Jana Sena Party (JSP): 2 seats
Nationalist Congress Party (NCP - Ajit Pawar faction): 1 seat
Asom Gana Parishad (AGP): 1 seat
United People's Party Liberal (UPPL): 1 seat
Sikkim Krantikari Morcha (SKM): 1 seat
All Jharkhand Students Union (AJSU): 1 seat
Hindustani Awam Morcha (Secular) - HAM-S: 1 seat
Apna Dal (Soneylal) - ADAL: 1 seat

*/


Select * from partywise_results
where party like '%Bharatiya Janata Party%'
-- Bharatiya Janata Party - BJP

Select * from partywise_results
where party like '%Telugu Desam%'
-- Telugu Desam - TDP

Select * from partywise_results
where party like '%Janata Dal%'

-- Janata Dal  (Secular) - JD(S)
-- Janata Dal  (United) - JD(U)


Select * from partywise_results
where party like '%Shiv Sena %'
-- Shiv Sena - SHS


Select * from partywise_results
where party like '%Nationalist Congress Party %'
-- Nationalist Congress Party - NCP

Select * from partywise_results
where party like '%Lok Janshakti Party%'
--Lok Janshakti Party(Ram Vilas) - LJPRV

Select * from partywise_results
where party like '%JanaSena%'
-- Janasena Party - JnP

Select * from partywise_results
where party like '%Rashtriya Lok Dal%'
-- Rashtriya Lok Dal - RLD

Select * from partywise_results
where party like '%Asom Gana Parishad%'
-- Asom Gana Parishad - AGP


Select * from partywise_results
where party like '%United People_s Party%'
-- United People’s Party, Liberal - UPPL


Select * from partywise_results
where party like '%Sikkim Krantikari Morcha%'
-- Sikkim Krantikari Morcha - SKM


Select * from partywise_results
where party like '%Hindustani Awam Morcha%'
-- Hindustani Awam Morcha (Secular) - HAMS


Select * from partywise_results
where party like '%Apna Dal (Soneylal)%'
-- Apna Dal (Soneylal) - ADAL


SELECT 
SUM(CASE WHEN Party in (
					'Bharatiya Janata Party - BJP',
					'Telugu Desam - TDP',
					'Janata Dal  (Secular) - JD(S)',
					'Janata Dal  (United) - JD(U)',
					'Shiv Sena - SHS',
					'Nationalist Congress Party - NCP',
					'Lok Janshakti Party(Ram Vilas) - LJPRV',
					'Janasena Party - JnP',
					'Rashtriya Lok Dal - RLD',
					'Asom Gana Parishad - AGP',
					'United People’s Party, Liberal - UPPL',
					'Sikkim Krantikari Morcha - SKM',
					'Hindustani Awam Morcha (Secular) - HAMS',
					'Apna Dal (Soneylal) - ADAL'
					)
THEN Won ELSE 0 END) AS Total_Seats
FROM partywise_results




-- 4. Seats Won by NDA Alliance Parties 

SELECT 
	Party,
	Won AS  Seats_Won
FROM partywise_results 
WHERE Party in (
					'Bharatiya Janata Party - BJP',
					'Telugu Desam - TDP',
					'Janata Dal  (Secular) - JD(S)',
					'Janata Dal  (United) - JD(U)',
					'Shiv Sena - SHS',
					'Nationalist Congress Party - NCP',
					'Lok Janshakti Party(Ram Vilas) - LJPRV',
					'Janasena Party - JnP',
					'Rashtriya Lok Dal - RLD',
					'Asom Gana Parishad - AGP',
					'United People’s Party, Liberal - UPPL',
					'Sikkim Krantikari Morcha - SKM',
					'Hindustani Awam Morcha (Secular) - HAMS',
					'Apna Dal (Soneylal) - ADAL'
					)
ORDER BY Won DESC




-- 5. Total Seats Won by I.N.D.I.A. Alliance 
-- Indian National Develoment Inclusive Alliance

SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results




-- 6. Seats Won by I.N.D.I.A. Alliance Parties 

SELECT  Party,
Won AS Seats_Won
FROM 
    partywise_results
WHERE Party in (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
				)
ORDER BY Seats_Won DESC





-- 7. Add new column field in table partywise_results to get the Party Alliance as NDA, I.N.D.I.A and OTHER


ALTER TABLE partywise_results
ADD Party_Alliance NVARCHAR(50)

UPDATE partywise_results
SET Party_Alliance = 'NDA'
WHERE Party IN ('Bharatiya Janata Party - BJP',
					'Telugu Desam - TDP',
					'Janata Dal  (Secular) - JD(S)',
					'Janata Dal  (United) - JD(U)',
					'Shiv Sena - SHS',
					'Nationalist Congress Party - NCP',
					'Lok Janshakti Party(Ram Vilas) - LJPRV',
					'Janasena Party - JnP',
					'Rashtriya Lok Dal - RLD',
					'Asom Gana Parishad - AGP',
					'United People’s Party, Liberal - UPPL',
					'Sikkim Krantikari Morcha - SKM',
					'Hindustani Awam Morcha (Secular) - HAMS',
					'Apna Dal (Soneylal) - ADAL');

UPDATE partywise_results
SET Party_Alliance = 'I.N.D.I.A'
WHERE Party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK');

UPDATE partywise_results
SET Party_Alliance = 'OTHER'
WHERE Party_Alliance is NULL;




-- 8. Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states? 

SELECT 
Party_Alliance,
SUM(Won) AS Total_Seats_Won
FROM partywise_results
GROUP BY Party_Alliance




-- 9. Winning candidate's name, their party name, total votes, and the margin of victory 
-- for a specific state and constituency? 


select S.State, cr.Parliament_Constituency, pr.Party, pr.Party_Alliance, cr.Winning_Candidate, cr.Total_Votes, cr.Margin
FROM constituencywise_results cr
LEFT JOIN
statewise_results sr 
ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN States s 
ON s.State_ID = sr.State_ID
JOIN partywise_results pr
ON pr.Party_ID = cr.Party_ID
WHERE cr.Parliament_Constituency = 'SouthDelhi(7)'



-- 10. What is the distribution of EVM votes versus postal votes for candidates in a specific constituency? 


SELECT 
cd.EVM_votes,
cd.Postal_Votes,
cd.Total_Votes,
cd.Candidate,
cr.constituency_name
FROM constituencywise_details cd
JOIN constituencywise_results cr
ON cr.Constituency_ID = cd.Constituency_ID
WHERE cr.Constituency_Name = 'AMETHI'



-- 11. Which parties won the most seats in a State, and how many seats did each party win? 


SELECT 
s.state,                                    -- This is in each state how much Seats party won
pr.party,
COUNT(*) AS Total_Seats                         
FROM constituencywise_results cr
JOIN statewise_results sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s
ON sr.State_ID = s.State_ID
JOIN partywise_results Pr
ON pr.Party_ID = cr.Party_ID
GROUP BY s.state, pr.party
ORDER BY Total_Seats DESC , s.State ASC



-- To find seperately in each state that how a party perform in each state 

SELECT                                     
pr.party,
COUNT(*) AS Total_Seats                         
FROM constituencywise_results cr
JOIN statewise_results sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s
ON sr.State_ID = s.State_ID
JOIN partywise_results Pr
ON pr.Party_ID = cr.Party_ID
WHERE s.State = 'GUJARAT'
GROUP BY pr.party
ORDER BY Total_Seats DESC



-- 12. What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024 


SELECT 
s.State,
SUM(CASE WHEN pr.Party_Alliance = 'NDA' THEN 1 ELSE 0 END) AS Total_NDA_Seats,
SUM(CASE WHEN pr.Party_Alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS Total_INDIA_Seats,
SUM(CASE WHEN pr.Party_Alliance = 'OTHER' THEN 1 ELSE 0 END) AS Total_OTHER_Seats
FROM constituencywise_results cr
JOIN 
statewise_results sr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s
ON s.State_ID = sr.State_ID
JOIN partywise_results pr
ON pr.Party_ID = cr.Party_ID
GROUP BY s.State



-- 13. Which candidate received the highest number of EVM votes in each constituency (Top 10)? 


-- With Window Function

SELECT TOP 10
	Parliament_Constituency,
	Candidate,
	EVM_Votes
FROM (SELECT 
	cr.Parliament_Constituency,
	cd.candidate,
	cd.EVM_Votes,
	DENSE_RANK() OVER(PARTITION BY cr.parliament_constituency ORDER BY cd.EVM_Votes DESC ) as Dr
	FROM constituencywise_details cd
	JOIN  constituencywise_results cr
	ON cr.Constituency_ID = cd.Constituency_ID)t
WHERE Dr = 1
ORDER BY EVM_Votes DESC


-- With Correlated Subquery

SELECT TOP 10
	cr.Constituency_Name,
	cr.constituency_id,
	cd.Candidate,
	cd.EVM_Votes
FROM constituencywise_results cr
JOIN constituencywise_details cd
ON cr.Constituency_ID = cd.Constituency_ID
WHERE cd.EVM_Votes = (SELECT MAX(EVM_Votes) FROM constituencywise_details cd1
						WHERE cd1.Constituency_ID = cd.Constituency_ID)
ORDER BY cd.EVM_Votes DESC







-- 14. Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections? 


SELECT 
	cr.Constituency_Name,
	sr.Leading_Candidate,
	sr.Trailing_Candidate
FROM statewise_results sr
JOIN states s
ON sr.State_ID = s.State_ID
JOIN constituencywise_results cr
ON cr.Parliament_Constituency = sr.Parliament_Constituency
WHERE s.state = 'Maharashtra'




-- If I don't have statewise_results 

SELECT * FROM constituencywise_details   -- And i don't have Total_Votes column in this

WITH T1 AS (SELECT 
				cd.candidate,
				cd.EVM_Votes,
				cd.Postal_Votes,
				cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
				cd.Constituency_ID,
				ROW_NUMBER() OVER(PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS Ranking
			FROM constituencywise_details AS cd
			),

T2 AS (SELECT 
			Constituency_ID,
			MIN(CASE WHEN Ranking = 1 THEN Candidate END) AS Winning_Candidate,
			MIN(CASE WHEN Ranking = 2 THEN Candidate END) AS Runnerup_Candidate
		FROM T1 
		GROUP BY Constituency_ID)

/* With This Joining Different Tables We are just getting constituency name and can see a particular State's constituencies
 at a time other wise this is not mandatory i think because we get in T2 each constituency wise winning and runnerup
 candidate */

SELECT 
	cr.Constituency_name,
	T2.Winning_Candidate,
	T2.Runnerup_Candidate
FROM 
	T2
JOIN 
	constituencywise_results cr ON T2.Constituency_ID = cr.Constituency_ID
JOIN 
	Statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
JOIN 
	States s ON s.State_ID = sr.State_ID

WHERE  s.state = 'Maharashtra'              
ORDER BY cr.Constituency_Name





-- 15. For the state of Maharashtra, what are the total number of seats, total number of candidates, total number of parties,
-- total votes (including EVM and postal), and the breakdown of EVM and postal votes? 

SELECT 
COUNT(DISTINCT cd.candidate) AS Total_Candidates,
COUNT(DISTINCT cr.parliament_constituency) AS Total_Seats,
COUNT(DISTINCT cd.Party) AS Total_Parties,
SUM(cd.Total_Votes) AS Total_Votes,
SUM(cd.EVM_Votes) AS Total_EVM_Votes,
SUM(cd.Postal_votes) AS Total_Postal_Votes

FROM constituencywise_details cd
JOIN 
	constituencywise_results cr ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
	statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
JOIN
	States s ON s.State_ID = sr.State_ID
WHERE s.state = 'Maharashtra'












