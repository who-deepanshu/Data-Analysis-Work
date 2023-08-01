--looking at the data
select * from dbo.sales_data_sample

--finding unique values from important columns
select distinct status from [dbo].[sales_data_sample] --can be used for plot
select distinct year_id from [dbo].[sales_data_sample]
select distinct PRODUCTLINE from [dbo].[sales_data_sample] --can be used for plot
select distinct COUNTRY from [dbo].[sales_data_sample] --can be used for plot
select distinct DEALSIZE from [dbo].[sales_data_sample] --can be used for plot
select distinct TERRITORY from [dbo].[sales_data_sample] --can be used for plot


--Analyzing the data
--grouping the sales by
--1 Productline to check which product generates highest revenue
select PRODUCTLINE, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by PRODUCTLINE
order by Revenue desc

--2 Year to check which product generates highest revenue
select YEAR_ID, sum(sales) Revenue
from [dbo].[sales_data_sample]
group by YEAR_ID
order by 2 desc
--year 2005 shows lowest revenue 
select distinct MONTH_ID from [dbo].[sales_data_sample]
where YEAR_ID = 2005    --they don't added all month id in 2005 

--3 Dealsize
select  DEALSIZE,  sum(sales) Revenue
from [dbo].[sales_data_sample]
group by  DEALSIZE
order by 2 desc

--Best month for sales 
select  MONTH_ID, sum(sales) Revenue, count(ORDERNUMBER) Orders
from [dbo].[sales_data_sample]
--where YEAR_ID = 2004 
group by MONTH_ID
order by Orders desc

--seems November is the best month for sales
--which product they sell in November ?
select MONTH_ID, PRODUCTLINE, sum(sales) Revenue, count(ORDERLINENUMBER) 
from dbo.sales_data_sample
where MONTH_ID = 11
group by MONTH_ID, PRODUCTLINE
order by 3 desc

--Classic cars is the best product they sell

--Highest sales among the countries?
select COUNTRY, sum(sales) Revenue
from sales_data_sample
group by COUNTRY
order by 2 desc

--USA make highest revenue now which city in USA ?
select city, sum(sales) Revenue
from sales_data_sample
where COUNTRY = 'USA'
group by CITY
order by 2 desc

--Best prodcut in USA ?
select PRODUCTLINE, sum(sales) Revenue
from sales_data_sample
where COUNTRY = 'USA'
group by PRODUCTLINE
order by 2 desc

--Classic cars here also the best product to be sold in USA

--Best customer ? 
--we can find this by using the concept of RFM
DROP TABLE IF EXISTS #rfm
;with rfm as 
(
	select 
		CUSTOMERNAME, 
		sum(sales) MonetaryValue,
		avg(sales) AvgMonetaryValue,
		count(ORDERNUMBER) Frequency,
		max(ORDERDATE) last_order_date,
		(select max(ORDERDATE) from [dbo].[sales_data_sample]) max_order_date,
		DATEDIFF(DD, max(ORDERDATE), (select max(ORDERDATE) from [dbo].[sales_data_sample])) Recency
	from [dbo].[sales_data_sample]
	group by CUSTOMERNAME
),
rfm_calc as
(

	select r.*,
		NTILE(4) OVER (order by Recency desc) rfm_recency,
		NTILE(4) OVER (order by Frequency) rfm_frequency,
		NTILE(4) OVER (order by MonetaryValue) rfm_monetary
	from rfm r
)
select 
	c.*, rfm_recency+ rfm_frequency+ rfm_monetary as rfm_cell,
	cast(rfm_recency as varchar) + cast(rfm_frequency as varchar) + cast(rfm_monetary  as varchar)rfm_cell_string
into #rfm
from rfm_calc c


select * from #rfm

select CUSTOMERNAME , rfm_recency, rfm_frequency, rfm_monetary,
	case 
		when rfm_cell_string in (111, 112 , 121, 122, 123, 132, 211, 212, 114, 141) then 'lost_customers'  --lost customers
		when rfm_cell_string in (133, 134, 143, 244, 334, 343, 344, 144) then 'slipping away, cannot lose' -- (Big spenders who haven�t purchased lately) slipping away
		when rfm_cell_string in (311, 411, 331) then 'new customers'
		when rfm_cell_string in (222, 223, 233, 322) then 'potential churners'
		when rfm_cell_string in (323, 333,321, 422, 332, 432) then 'active' --(Customers who buy often & recently, but at low price points)
		when rfm_cell_string in (433, 434, 443, 444) then 'loyal'
	end rfm_segment

from #rfm
