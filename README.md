# 02-mySQL-database 📼

Just plug and play⬇️

![vhs](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/vhs.gif)


## Goal 📽️

The goal of this project is to build my own database from several csv files.


## Structure 📂

The repository is divided into several folders containing the following files:

- **Folder data:**
   - It contains the raw data and the cleaned files which are used to build the database.

- **Folder notebook:**
   - **main.ipynb**: this file is used to clean and export de .csv

- **Folder img:**
   - the folder to save images and gifs.
   
- **Folder sql:**
   - the folder to save queries and schemes for mySQL workbench.


## Let's do this 🍿

**1. Explore and clean the data**

Data wrangling with Pandas🐼 and Python🐍. The remaining information has been organised in order to create a database in mySQL workbench 🐬.

**2.Build the database**

Once the dataset was exported to mySQL workbench, the connections between tables were made.

![ERD](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/schema.png)

Films was the main table, which had a n:m connection with actors. The rest of the tables have a 1:n identifying relationship.


**3.Queries**

1. All the drama films.
![q1](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q1.png)

2. Actors and actresses with most appearances in horror movies.
![q2](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q2.png)

3. All actors per film.
![q3](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q3.png)

4. Ranking of actors with appearances by genre.
![q4](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q4.png)

5. Actors with most appearances by genre.
![q5](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q5.png)

6. Number of films by genre and shop in the inventory.
![q6](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q6.png)

7. Number of rental by retailer and films.
![q7](https://github.com/charlieciordia/02-mySQL-database/blob/main/img/q7.png)



## Libraries 📚
 
[Pandas](https://pandas.pydata.org/docs/)
