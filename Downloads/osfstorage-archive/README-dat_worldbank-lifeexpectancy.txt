****************************************************************
Prepared for Gabor's Data Analysis

Data Analysis for Business, Economics, and Policy
 by Gabor Bekes and  Gabor Kezdi
 Cambridge University Press 2021
 gabors-data-analysis.com 

Description of the 
worldbank-lifeexpectancy

used in case studies
 8B  How is life expectancy related to the average income of a country?

****************************************************************
Data source

The World Develoipment Indicators (WDI) collected and distributed by the World Bank
"The primary World Bank collection of development indicators, compiled from officially-recognized international sources."
https://datacatalog.worldbank.org/dataset/world-development-indicators

There are several ways to access this data. 
There is and API, and you can download the entire database as a bulk.
We have chosen a third option, dowloading specific variables.
It's on the WDI products page, Open Data & Databank Query database page
https://databank.worldbank.org/source/world-development-indicators

Select
Database: World Development Indicators (default selectio with this url)
Countries: check all, but make sure you select "Countries" (not All or Aggregates)
Series: Life expectancy at birth, total (years) [SP.DYN.LE00.IN]
	Population, total [SP.POP.TOTL]
	GDP per capita, PPP (constant 2011 international $) [NY.GDP.PCAP.PP.KD]
Time:   check all years (in our case last year was 2018)



****************************************************************
Data access and copyright

You can use this dataset for educational purposes.


****************************************************************
Raw data table

(we have renamed the datafile after the WDI download)

worldbank-lifeexpectancy-raw.csv
 observations: country-year panel (n=12,803)
		217 countries, years 1960-2018 
 ID countrycode year
 other variables
	Life expectancy at birth, total (years) [SP.DYN.LE00.IN]
	Population, total [SP.POP.TOTL]
	GDP per capita, PPP (constant 2011 international $) [NY.GDP.PCAP.PP.KD]

****************************************************************
Tidy data table

worldbank-lifeexpectancy
 observations: country-year panel (n=5,029)
		194 countries, years 1990-2017
		unbalanced panel, 160 countries with all 28 years)
 ID countrycode (string) year
 other variables
	lifeexp	   Life expectancy at birth (years)
	population Population, total (million)
	gdppc 	   GDP per capita, PPP (constant 2011 international $)
