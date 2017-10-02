1. Find the author with the name 'Kara Melton' and then select all the articles she has written.
SELECT * FROM authors WHERE name = 'Kara Melton';
# id   | 8
# name | Kara Melton
# bio  | Kara is a Master’s Candidate in the Department of Gender Studies at Queen’s University. She researches questions of racial progress and spends time thinking on community building, startups, tech and design, board games, and donuts.
SELECT * FROM articles WHERE author_id = 8;


2. Find Ontario in the provinces table and then find all the cities in that province.
SELECT * FROM provinces WHERE name = 'Ontario';
# id |  name   | year_founded | country_id
# ----+---------+--------------+------------
# 14 | Ontario |         1867 |          1
SELECT * FROM cities WHERE province_id = 14;
# id |  name   | year_founded | province_id
# ----+---------+--------------+-------------
#  8 | Toronto |         1793 |          14
# 11 | Ottawa  |         1826 |          14


3. Who wrote the article called 'Coding Bootcamps and Emotional Labor'?
SELECT author_id FROM articles WHERE title = 'Coding Bootcamps and Emotional Labor';
# author_id
# -----------
#         4
SELECT name FROM authors WHERE id = 4;
# name
# -------------------
# Tilde Ann Thurium


4. Write a series of SQL queries to find out how many provinces are in Canada.
SELECT COUNT(DISTINCT name) FROM provinces;
# count
# -------
#    13


5. How many people live at 4740 McDermott Street?
SELECT id FROM residences WHERE address = '4740 McDermott Street';
# id
# ----
#  9
SELECT COUNT(name) FROM persons WHERE residence_id = 9;
# count
# -------
#     2


6. What city is 4740 McDermott Street in?
SELECT city_id FROM residences WHERE address = '4740 McDermott Street';
#  city_id
# ---------
#       11
SELECT name FROM cities WHERE id = 11;
#   name
# --------
#  Ottawa


7. What province is 4740 McDermott Street in?
SELECT province_id FROM cities WHERE id = 11;
#  province_id
# -------------
#           14
SELECT name FROM provinces WHERE id = 14;
#   name
# ---------
#  Ontario


8. What country is 4740 McDermott Street in?
SELECT country_id FROM provinces WHERE id = 14;
#  country_id
# ------------
#           1
SELECT name FROM countries WHERE id = 1;
#   name
# --------
#  Canada


9. Find the person named 'Destini Davis' and then use a series of SQL queries to find what country they live in.
SELECT residence_id FROM persons WHERE name = 'Destini Davis';
#  residence_id
# --------------
#             2
SELECT city_id FROM residences WHERE id = 2;
#  city_id
# ---------
#        8
SELECT province_id FROM cities WHERE id = 8;
#  province_id
# -------------
#           14
SELECT country_id FROM provinces WHERE id = 14;
#  country_id
# ------------
#           1
SELECT name FROM countries WHERE id = 1;
#   name
# --------
#  Canada

SOLUTION 2 using INNER JOIN
---------------------------
SELECT persons.name, countries.name
FROM((((persons
INNER JOIN residences ON persons.residence_id = residences.id)
INNER JOIN cities ON residences.city_id = cities.id)
INNER JOIN provinces ON cities.province_id = provinces.id)
INNER JOIN countries ON provinces.country_id = countries.id)
WHERE persons.name = 'Destini Davis';



10. How many articles has Aditya Mukerjee written?
SELECT id FROM authors WHERE name = 'Aditya Mukerjee';
#  id
# ----
#   2
SELECT COUNT(title) FROM articles WHERE author_id = 2;
#  count
# -------
#      1
