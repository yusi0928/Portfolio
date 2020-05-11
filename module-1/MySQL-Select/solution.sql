# Challenge 1 - Who Have Published What At Where?
select authors.`au_id` as 'AUTHOR ID', authors.au_lname as 'LAST NAME',authors.au_fname as 'FIRST NAME', title as 'TITLE',pub_name as 'PUBLISHER' 
from publishers 
inner join titles
on publishers.pub_id=titles.pub_id
inner join titleauthor 
on titles.title_id=titleauthor.title_id
inner join `authors` 
on titleauthor.au_id=`authors`.au_id


# Challenge 2 - Who Have Published How Many At Where?
select authors.`au_id` as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',publishers.`pub_name`as 'PUBLISHER', count(titles.title_id) as 'TITLE COUNT'
from publishers 
inner join titles
on publishers.pub_id=titles.pub_id
inner join titleauthor 
on titles.title_id=titleauthor.title_id
inner join `authors` 
on titleauthor.au_id=`authors`.au_id
group by authors.au_id, publishers.`pub_id`


# Challenge 3 - Best Selling Authors
select authors.`au_id` as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', count(sales.qty) as 'TOTAL'
from publishers
inner join titles
on publishers.pub_id=titles.pub_id
inner join titleauthor 
on titles.title_id=titleauthor.title_id
inner join sales
on sales.`title_id`=titleauthor.`title_id`
inner join `authors` 
on authors.`au_id`=titleauthor.`au_id`
group by authors.au_id
order by count(sales.qty) desc
limit 3;


# Challenge 4 - Best Selling Authors Ranking
select authors.`au_id` as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', ifnull(sum(sales.qty),0) as 'TOTAL'
from publishers
right join titles
on publishers.pub_id=titles.pub_id
left join titleauthor 
on titles.title_id=titleauthor.title_id
right join sales
on sales.`title_id`=titleauthor.`title_id`
right join `authors` 
on authors.`au_id`=titleauthor.`au_id`
group by authors.au_id
order by sum(sales.qty) desc
