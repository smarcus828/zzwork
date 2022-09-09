import yfinance as yf

#define the ticker symbol
tickerSymbol = 'TSLA'

#get data on this ticker
tickerData = yf.Ticker(tickerSymbol)
#print(tickerData)

#get the historical prices for this ticker
#tickerDf = tickerData.history(period='1d', start='2020-4-22', end='2020-4-22')
tickerDf = tickerData.history()

#see your data
#print(tickerDf.iloc[0,3])
#print(tickerDf)

