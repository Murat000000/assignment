* change working directory
cd Downloads\osfstorage-archive\raw

log using "assignment.log", text replace
import delimited "worldbank-lifeexpectancy-raw.csv", clear
drop if gdp == ".." // drop missing values
drop if life == ".."
gen ppp = real(gdp) // generate a new variable with float value
gen expc = real(lifeexpectancy)
sum expc, detail // summerize for deatils, and to create a new categories(by 25%, 4 categories)
sum ppp, detail 

gen pppcat = 1 if ppp<2970
replace pppcat=2 if (ppp>=2970)&(ppp<8678)
replace pppcat=3 if (ppp>=8678)&(ppp<22394)
replace pppcat=4 if ppp>=22394

gen expccat = 1 if expc<62.4
replace expccat=2 if (expc>=62.4)&(expc<70.63)
replace expccat=3 if (expc>=70.63)&(expc<75.23)
replace expccat=4 if expc>=75.23

sort pppcat
by pppcat: sum expccat // summerize by categories

sort expccat
by expccat: sum pppcat

graph bar, over(pppcat) over(expccat) stack asyvar percentage // graph by categories in percentage, but each category has nearly same observations.

twoway (scatter ppp expc) (lowess ppp expc) // scatter plot with lowess

log close