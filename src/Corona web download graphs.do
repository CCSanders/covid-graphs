
* To download the most recent data, just change the date from the copy command:

copy https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-2020-04-04.xlsx corona_data.xlsx, replace
import excel corona_data, firstrow clear

rename geoId GeoId
rename dateRep DateRep
rename cases Cases
encode GeoId, gen(country)

xtset country DateRep
tsfill, full
xtset country DateRep

by country: gen total = sum(Cases)
label variable total "Total number of cases"

gen cases_gr = ((Cases-L.Cases)/L.Cases)*100
gen total_gr = ((total-L.total)/L.total)*100

twoway  (bar Cases DateRep, yaxis(1)) (dropline total DateRep, yaxis(2))  if GeoId=="CN" & DateRep>=td(1/2/2020), xtitle("")  yscale(r(10000) axis(1))   yscale(r(100000) axis(2)) title("Covid-19 in China") name(china, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline total DateRep, yaxis(2)) if GeoId=="US" & DateRep>=td(18/2/2020), xtitle("") yscale(r(10000) axis(1))   yscale(r(100000) axis(2)) title("Covid-19 in USA") name(usa, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline total DateRep, yaxis(2) ) if GeoId=="IT" & DateRep>=td(18/2/2020), xtitle("") yscale(r(10000) axis(1))   yscale(r(100000) axis(2)) title("Covid-19 in Italy") name(italy, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline total DateRep, yaxis(2)) if GeoId=="ES" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5000) axis(1))   yscale(r(50000) axis(2)) title("Covid-19 in Spain") name(spain, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline total DateRep, yaxis(2)) if GeoId=="JP" & DateRep>=td(18/2/2020), xtitle("") yscale(r(1000) axis(1))   yscale(r(3000) axis(2)) title("Covid-19 in Japan") name(japan, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline  total DateRep, yaxis(2)) if GeoId=="KR" & DateRep>=td(18/2/2020), xtitle("") yscale(r(1500) axis(1))   yscale(r(15000) axis(2)) title("Covid-19 in Korea") name(korea, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline  total DateRep, yaxis(2)) if GeoId=="HR" & DateRep>=td(18/2/2020), xtitle("") yscale(r(1000) axis(1))   yscale(r(3000) axis(2)) title("Covid-19 in Croatia") name(croatia, replace)

twoway  (bar Cases DateRep, yaxis(1)) (dropline  total DateRep, yaxis(2)) if GeoId=="AT" & DateRep>=td(18/2/2020), xtitle("") yscale(r(1000) axis(1))   yscale(r(3000) axis(2)) title("Covid-19 in Austria") name(austria, replace)

graph export "Covid-19 cases Austria.png", as(png) replace

twoway  (bar Cases DateRep, yaxis(1)) (dropline  total DateRep, yaxis(2)) if GeoId=="TR" & DateRep>=td(18/2/2020), xtitle("") yscale(r(1000) axis(1))   yscale(r(3000) axis(2)) title("Covid-19 in Turkey") name(turkey, replace)

graph export "Covid-19 cases Turkey.png", as(png) replace

graph combine china usa italy spain japan korea, altshrink name(combined1, replace) 
graph export "Covid-19 cases.png", as(png) replace
graph combine china usa italy spain japan korea, altshrink ycommon name(combined1a, replace)
graph export "Covid-19 cases (common y).png", as(png) replace

** logged cases
gen lcase = log(Cases)
gen ltotal = log(total)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2))  if GeoId=="CN" & DateRep>=td(1/2/2020), xtitle("")  yscale(r(10) axis(1))   yscale(r(12) axis(2)) title("logged: China") name(china1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2)) if GeoId=="US" & DateRep>=td(18/2/2020), xtitle("") yscale(r(10) axis(1))   yscale(r(12) axis(2)) title("logged: USA") name(usa1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2) ) if GeoId=="IT" & DateRep>=td(18/2/2020), xtitle("") yscale(r(10) axis(1))   yscale(r(12) axis(2)) title("logged: Italy") name(italy1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2)) if GeoId=="ES" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5) axis(1))   yscale(r(10) axis(2)) title("logged: Spain") name(spain1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2)) if GeoId=="JP" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5) axis(1))   yscale(r(10) axis(2)) title("logged: Japan") name(japan1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline  ltotal DateRep, yaxis(2)) if GeoId=="KR" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5) axis(1))   yscale(r(10) axis(2)) title("logged: Korea") name(korea1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2)) if GeoId=="HR" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5) axis(1))   yscale(r(10) axis(2)) title("logged: Croatia") name(croatia1, replace)

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2)) if GeoId=="AT" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5) axis(1))   yscale(r(10) axis(2)) title("logged: Austria") name(austia1, replace)

graph export "Covid-19 logged cases Austria.png", as(png) replace

twoway  (bar lcase DateRep, yaxis(1)) (dropline ltotal DateRep, yaxis(2)) if GeoId=="TR" & DateRep>=td(18/2/2020), xtitle("") yscale(r(5) axis(1))   yscale(r(10) axis(2)) title("logged: Turkey") name(turkey1, replace)

graph export "Covid-19 logged cases Turkey.png", as(png) replace

graph combine china1 usa1 italy1 spain1 japan1 korea1, altshrink name(combined2, replace)
graph export "Covid-19 logged cases.png", as(png) replace
graph combine china1 usa1 italy1 spain1 japan1 korea1, altshrink ycommon name(combined2a, replace)
graph export "Covid-19 logged cases (common y).png", as(png) replace


