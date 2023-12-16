
# T20 World Cup Cricket Analysis
The goal of this project is to analyse cricket data and create a POWER BI dashboard where we can visualize perfromance of each player which will help in creating a playing 11.


## 1. Problem Statement
Build a team of 11 players by considering the following parameters into mind :
 - Opener Batsman
 - Middle Order Batsman
 - Lower Order Batsman
 - All Rounders
 - Bowlers

We can check these parameters in the **Parameter Scoping** file.

## 2. Data Description
I have got data in the JSON format which is converted into CSV files using Python(Pandas, Numpy).


## 3. Data Preparation
The data from JSON files is pre-processed using **Python** and stored in separate 4 CSV files named as :
 - Batting Summary
 - Bowling Summary
 - Match Summary
 - Players
To see the steps wise data cleaning work it's availabel in **t20_data_preprocessing.ipynb** file.
## 4. Data Transformation
The data is transformed while loading in **POWER BI** tools where data type of some columns are changed, removed the redundency from tables, correction of noisy characters is also taken care off, etc.
To link the all tables together it's done through **Data Modeling** process in POWER BI so that while visulising them then can react dynamically at run-time filteration.
 
## 5. Visualization 
After having a ready to go data in all the tables it's time to visualize it by various charts and graphs.
 - **Data Analysis Expressions(DAX) :** These measures are also created while Visualization for for creating calculated columns, measures, and custom tables.
 - All DAX measures are given inside **DAX Measures and Calculated columns.xlsx** file.
 - A visual dashboard is created where we can analyse the performance of each player separately and on the basis of that we'll be able to pick out best playing 11 team.
 - The POWER BI dashboard is given with the file name as - **Final_11.pbix**.

Download the zip file to see the in-depth project work.

