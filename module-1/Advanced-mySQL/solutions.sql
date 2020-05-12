# Challenge 1 - Most Profiting Authors

# Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT titleauthor.`title_id`,titleauthor.`au_id`,
(titles.`advance`*titleauthor.`royaltyper`/100) as advance, 
(titles.`price`*sales.`qty`*titles.`royalty`/100*titleauthor.`royaltyper`/100) as sales_royalty
FROM titleauthor 
INNER JOIN titles
On titleauthor.`title_id`=titles.`title_id`
INNER JOIN sales
On titleauthor.`title_id`=sales.`title_id`;



# Step 2: Aggregate the total royalties for each title and author
SELECT step_2.`au_id`,step_2.`title_id`,sum(step_2.sales_royalty) as royalty, sum(step_2.advance) as advance
FROM (
SELECT titleauthor.`title_id`,titleauthor.`au_id`,
(titles.`advance`*titleauthor.`royaltyper`/100) as advance, 
(titles.`price`*sales.`qty`*titles.`royalty`/100*titleauthor.`royaltyper`/100) as sales_royalty
FROM titleauthor 
INNER JOIN titles
On titleauthor.`title_id`=titles.`title_id`
INNER JOIN sales
On titleauthor.`title_id`=sales.`title_id`
) 
step_2
GROUP BY step_2.`au_id`,step_2.`title_id`
ORDER BY au_id asc;


#Step 3: Calculate the total profits of each author
SELECT step_3.au_id,sum(step_3.advance + step_3.royalty) as Profits
FROM(SELECT step_2.`au_id`,step_2.`title_id`,sum(step_2.sales_royalty) as royalty, sum(step_2.advance) as advance
FROM (
SELECT titleauthor.`title_id`,titleauthor.`au_id`,
(titles.`advance`*titleauthor.`royaltyper`/100) as advance, 
(titles.`price`*sales.`qty`*titles.`royalty`/100*titleauthor.`royaltyper`/100) as sales_royalty
FROM titleauthor 
INNER JOIN titles
On titleauthor.`title_id`=titles.`title_id`
INNER JOIN sales
On titleauthor.`title_id`=sales.`title_id`
) 
step_2
GROUP BY step_2.`au_id`,step_2.`title_id`
) step_3
GROUP BY step_3.au_id
ORDER BY profits desc
LIMIT 3;





# Challenge 2 - Alternative Solution
# I don't know where I get it wrong?
CREATE TEMPORARY TABLE alternative
SELECT step_2.`au_id`,step_2.`title_id`,sum(step_2.sales_royalty) as royalty, sum(step_2.advance) as advance
FROM (
SELECT titleauthor.`title_id`,titleauthor.`au_id`,
(titles.`advance`*titleauthor.`royaltyper`/100) as advance, 
(titles.`price`*sales.`qty`*titles.`royalty`/100*titleauthor.`royaltyper`/100) as sales_royalty
FROM titleauthor 
INNER JOIN titles
On titleauthor.`title_id`=titles.`title_id`
INNER JOIN sales
On titleauthor.`title_id`=sales.`title_id`
) 
step_2
GROUP BY step_2.`au_id`,step_2.`title_id`

SELECT alternative.au_id,sum(alternative.advance + alternative.royalty) as Profits
FROM alternative
GROUP BY alternative.au_id
ORDER BY Profits desc
LIMIT 3;










