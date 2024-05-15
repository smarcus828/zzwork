#!/usr/bin/python3
from yahoo_fin import stock_info as si
from datetime import date

FILE="/home/steven/python_stuff/holdings.csv"
total=0

symbols=["AMZN","NFLX","TSLA","ARKG"]
holds=[250,130,1210,375]

for i in range(len(symbols)):
	#print(symbols[i])
	quote=si.get_live_price(symbols[i])
	value=quote*holds[i]
	#print(round(value,2))
	total=total+value

#print("The total is: " + str(round(total,2)))

f=open(FILE,"a+")
#f.write(str(date.today()) + "," + str(round(total)) + "\n")
f.write(str(date.today()) + "," + str(round(total,2)) + "\n")
f.close()

