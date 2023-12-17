
# Provide Insights To The Revenue Team In The Hospitality Domain



## 1. Problem Statement
AtliQ Grands owns multiple five-star hotels across India. They have been in the hospitality industry for the past 20 years. Due to strategic moves from other competitors and ineffective decision-making in management, AtliQ Grands are losing its market share and revenue in the luxury/business hotels category. As a strategic move, the managing director of AtliQ Grands wanted to incorporate “Business and Data Intelligence” to regain their market share and revenue. However, they do not have an in-house data analytics team to provide them with these insights.

## 2. Data Preparation
The data is collected in different CSV files named as :
 - dim_date
 - dim_hotels
 - dim_rooms
 - fact_aggregated_bookings
 - fact_bookings

## 3. Data Transformation
These data files just needed few transformantions thus while loading datasets in **POWER BI** tools where data type of some columns are changed, removed the redundency from tables, correction of noisy characters is also taken care off, etc.
To link the all tables together it's done through **Data Modeling** process in POWER BI so that while visulising them then can react dynamically at run-time filteration.


![Screenshot 2023-12-17 104210](https://github.com/who-deepanshu/Data-Analysis-Work/assets/129099978/6c3e2ba2-e03a-4722-bd10-63bca02d4421)
 
## 5. Visualization 
After having a ready to go data in all the tables it's time to visualize it by various charts and graphs.
 - **Data Analysis Expressions(DAX) :** These measures are also created while Visualization for for creating calculated columns, measures, and custom tables.
 - All DAX measures are given inside **DAX_Metrics_Liist.xlsx** file.
 - A visual dashboard is created where we can check the in-depth revenue generates on the basis of - **RevPAR - Revenue per available room**, **DSRN - Daily sellable room nights**, **ADR - Average Daily Rate**, **DBRN - Daily Booked Room Nights** and **DURN - Daily Utilized Room Nights**. These all seems very helpfull in leading us towards a better decision making and understanding.


![Screenshot 2023-12-17 104347](https://github.com/who-deepanshu/Data-Analysis-Work/assets/129099978/7dd2c53d-7878-4966-91e8-885f27b36838)

The POWER BI dashboard is given with the file name as - **Revenue Insights.pbix**.

#### Download the zip files to go through Dataset and Dashboard.

