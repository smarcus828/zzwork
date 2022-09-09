from datetime import date
import yfinance as yf

FILE="holdings.csv"
total=0
days=[1,2,3,6,7,8,9,13,14,15,16,17,20,21,22,23,24]
symbols=["AMZN","NFLX","TSLA"]
holds=[250,130,232]

for i in range(len(days)):
	total=0
	for j in range(len(symbols)):
		tickerData = yf.Ticker(symbols[j])
		#print("index is: " + str(days[i]))
		date1="2020-4-" + str(days[i])
		date2="2020-4-" + str(days[i]+1)
		#print(str(date1) + " " + str(date2))
		tickerDf = tickerData.history(period='1d', start=date1, end=date2)
		quote=tickerDf.iloc[0,3]
		value=quote*holds[j]
		total=total+value
	#print("Total is: " + str(round(total,2)))
	outp="2020-04-" + str(days[i]) + "," + str(round(total,2)) + "\n"
	#print("Total is: " + outp)
	
	f=open(FILE,"a+")
	f.write(outp)
	f.close()

