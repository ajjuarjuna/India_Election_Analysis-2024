
/* While Analysing which party have secured how many seats i came to know about the tables have some
discrepancies */


/*  i joined here constituencywise_result to constituencywise_details to fetch the party of each 
candidate who won  */

SELECT * FROM constituencywise_results cr
LEFT JOIN
constituencywise_details cd
ON cr.Winning_Candidate = cd.Candidate
AND cr.Constituency_ID = cd.Constituency_ID


/* i have joined on candidate name and constituency_id so that i can get candidate in 
different constituencies and their party from cw_details as i assumed their will only one candidate
of one name in each constituency */

-- but the rows increased 

/* then i investigated the reason of their increament by checking are their any dupicates in 
cw_r*/

select Winning_Candidate,count(*) from constituencywise_results
group by Winning_Candidate
having count(*)>1


-- find that only rahul gandhi has won in 2 constituencies so 1 row  i reliable to be increased


-- but there is an increase of more than 1 row so i check the cw_d table

SELECT CANDIDATE, CONSTITUENCY_ID, COUNT(*)
FROM constituencywise_details
GROUP BY CANDIDATE,CONSTITUENCY_ID
HAVING COUNT(*)>1


/* and found has discrepancies/ambiguity in this table i obeserved that i have data quality issue 
here as i saw candidates with same name and same constituency are repeating so i look all the columns
of it do they have differences?
*/

-- By picking one candidate

SELECT *
FROM constituencywise_details
WHERE Candidate = 'MUNNA KUMAR'

/* i came to this conclusion that this candidate have same Constituency_ID in both rows but different
Party which is not possible as one candidate can contest in one constituency from a single party
*/

/* so this is misleading information and as i don't know these candidates with same name are two
different candidates or same that why i donot drop any of them */

-- And try to solve this question with the help of other tables
-- And got partywise_results