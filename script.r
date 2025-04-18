## EMS trade point NZU prices

# The energy trading company emsTradepoint publishs New Zealand Unit (carbon) prices from it's trading platform.
## latest data
(today <- Sys.Date())
[1] "2025-04-18"

# download trades data
https://www.emstradepoint.co.nz/documents/698/NZUTrades_NymdlpZ.csv
NZUTrades_NymdlpZ <- read.csv( file = "https://www.emstradepoint.co.nz/documents/698/NZUTrades_NymdlpZ.csv")

# Create a .csv formatted data file
write.csv(NZUTrades_NymdlpZ, file = "NZUTrades_NymdlpZ.csv", row.names = FALSE)

str(NZUTrades_NymdlpZ)
'data.frame':	600 obs. of  11 variables:
 $ Trade.ID        : int  29380 29349 29333 29332 29271 29270 29269 29268 29262 29261 ...
 $ Date...Time     : chr  "4/11/2025 14:13" "4/9/2025 14:56" "4/8/2025 12:56" "4/8/2025 12:46" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : chr  "15-Apr-25" "11-Apr-25" "10-Apr-25" "10-Apr-25" ...
 $ Quantity        : int  110 536 1000 1500 300 100 234 1000 1000 100 ...
 $ Unit.Price      : num  54.5 54.5 54.8 55 55 ...
 $ Total.Quantity  : int  110 536 1000 1500 300 100 234 1000 1000 100 ...
 $ Value           : num  5995 29212 54750 82425 16500 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...
#'data.frame':	600 obs. of  11 variables:
 $ Trade.ID        : int  29271 29270 29269 29268 29262 29261 29260 29259 29248 29246 ...
 $ Date...Time     : chr  "4/4/2025 12:15" "4/4/2025 12:15" "4/4/2025 12:14" "4/4/2025 11:19" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : chr  "8-Apr-25" "8-Apr-25" "8-Apr-25" "8-Apr-25" ...
 $ Quantity        : int  300 100 234 1000 1000 100 1203 829 1500 1000 ...
 $ Unit.Price      : num  55 55 54 55 56 ...
 $ Total.Quantity  : int  300 100 234 1000 1000 100 1203 829 1500 1000 ...
 $ Value           : num  16500 5500 12636 55000 55950 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

NZUTrades_NymdlpZ[["Date...Time"]][1]             # most recent trade date
[1] "4/11/2025 14:13"
#[1] "4/4/2025 12:15"
#[1] "3/21/2025 17:49"
#[1] "2/27/2025 13:58"
#[1] "2/14/2025 10:07"

NZUTrades_NymdlpZ[["Date...Time"]][600]             # earliest trade date is 3 May 2024
[1] "5/7/2024 11:37"
#[1] "5/3/2024 13:13"
NZUTrades_NymdlpZ[["Delivery.Date"]][600]
[1] "9-May-24"
#[1] "7-May-24"

#[1] "4/23/2024 14:28"
#[1] "4/9/2024 14:58"
# [1] "3/8/2024 13:02"

## earliest data
# Wayback archive 23 May 2024
https://web.archive.org/web/20240523220718/https://www.emstradepoint.co.nz/documents/530/CARBON_TRADE_DATA_24-05-24.csv
# read in data
CARBON_TRADE_DATA_24_05_24 <- read.csv( file = "https://web.archive.org/web/20240523220718/https://www.emstradepoint.co.nz/documents/530/CARBON_TRADE_DATA_24-05-24.csv")
# Create a .csv formatted data file
write.csv(CARBON_TRADE_DATA_24_05_24, file = "CARBON_TRADE_DATA_24-05-24.csv", row.names = FALSE)
# read csv file back into R
CARBON_TRADE_DATA_24_05_24 <- read.csv("CARBON_TRADE_DATA_24-05-24.csv")
str(CARBON_TRADE_DATA_24_05_24)
'data.frame':	989 obs. of  14 variables:
 $ Trade.ID        : int  24601 24595 24591 24569 24547 24520 24519 24518 24517 24516 ...
 $ Date...Time     : chr  "23/05/2024 11:11" "22/05/2024 15:22" "22/05/2024 10:35" "20/05/2024 15:33" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Period : chr  "27-May-24" "24-May-24" "24-May-24" "22-May-24" ...
 $ Quantity        : int  100 20 1000 1000 100 3422 100 200 600 352 ...
 $ Unit.Price      : num  45.5 44 45 45 52 ...
 $ Total.Quantity  : int  100 20 1000 1000 100 3422 100 200 600 352 ...
 $ Value           : num  4550 880 45000 45000 5200 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "Y" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...
 $ Voided          : chr  "N" "N" "N" "N" ...
 $ Invoicing.Date  : chr  "24-May-24" "23-May-24" "23-May-24" "21-May-24" ...
 $ Swap            : chr  "N" "N" "N" "N" ...

CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1]                      # most recent date - it overlaps with NZUTrades first date  "4/23/2024 14:28"
[1] "23/05/2024 11:11"
CARBON_TRADE_DATA_24_05_24[["Date...Time"]][989]
[1] "17/02/2021 9:56"                                               # that is the first trade

--------------------------------------------------------------------------
# the two dataframes include all trades sinces trading started in 17/02/2021 with over lap 3/05/2024 to 27/05/2024
NZUTrades_NymdlpZ           starts  7/05/2024    ends  11/04/2025
CARBON_TRADE_DATA_24_05_24  starts 17/02/2021    ends 23/05/2024

# the two dataframes include all trades sinces trading started in 17/02/2021 with over lap 7/05/2024 to 23/05/2024

CARBON_TRADE_DATA_24_05_24

# reformat date columns - check the first date row 1
NZUTrades_NymdlpZ[["Date...Time"]][1]
[1] "4/11/2025 14:13"
#[1] "4/4/2025 12:15"
#[1] "3/21/2025 17:49"
# what is the class?
class(NZUTrades_NymdlpZ[["Date...Time"]][1])
[1] "character"
strptime(NZUTrades_NymdlpZ.csv[["Date...Time"]][1],format= "%m/%d/%Y %H:%M")
[1] "2025-04-11 14:13:00 NZST"
#[1] "2025-04-04 12:15:00 NZDT"
class(strptime(NZUTrades_NymdlpZ.csv[["Date...Time"]][1],format= "%m/%d/%Y %H:%M"))
[1] "POSIXlt" "POSIXt"
# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
NZUTrades_NymdlpZ[["Date...Time"]] <- strptime(NZUTrades_NymdlpZ[["Date...Time"]],format= "%m/%d/%Y %H:%M")

# check date again
str(NZUTrades_NymdlpZ[["Date...Time"]][1],format= "%m/%d/%Y %H:%M")
 POSIXlt[1:1], format: "2025-04-11 14:13:00"
#POSIXlt[1:1], format: "2025-04-04 12:15:00"

# format to date time NOTE input is %d/%m/%Y dd/mm/yyyy and output is yyyy-mm-dd
NZUTrades_NymdlpZ[["Delivery.Date"]] <- as.Date(NZUTrades_NymdlpZ[["Delivery.Date"]],format= "%d-%b-%y")
str(NZUTrades_NymdlpZ[["Delivery.Date"]][1])
Date[1:1], format: "2025-04-15"
#Date[1:1], format: "2025-04-08"
--------------------------------------------------------------------------

# reformat date columns - check the first date row 1
str(NZUTrades_NymdlpZ[["Date...Time"]][1])
 POSIXlt[1:1], format: "2025-04-11 14:13:00"
#POSIXlt[1:1], format: "2025-04-04 12:15:00"
# what is the class?
class(NZUTrades_NymdlpZ[["Date...Time"]][1])
[1] "POSIXlt" "POSIXt"

---------------------------------------
# leave out last 4 columns of the older data set that are not in recent files so columns = 11 same in both data
CARBON_TRADE_DATA_24_05_24 <- CARBON_TRADE_DATA_24_05_24 [,-c(12,13,14)]

# check format first date to strptime date time

str(CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1])
 chr "23/05/2024 11:11"

strptime(CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1],format= "%d/%m/%Y %H:%M")
[1] "2024-05-23 11:11:00 NZST"
#[1] "2024-05-23 11:11:00 NZST"
# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
CARBON_TRADE_DATA_24_05_24[["Date...Time"]] <- strptime(CARBON_TRADE_DATA_24_05_24[["Date...Time"]],format= "%d/%m/%Y %H:%M")
# check class of date time [1]
str(CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1])
POSIXlt[1:1], format: "2024-05-23 11:11:00"

# check delivery date input
CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][1]
[1] "27-May-24"
# check format of first date to as.Date
str(as.Date(CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][989],format= "%d-%b-%y"))
 Date[1:1], format: "2021-02-24"
# format to yyyy-mm-dd as.Date format
CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]] <- as.Date(CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]],format= "%d-%b-%y")
# check date again
str(CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][1])
 Date[1:1], format: "2024-05-27"

# rename settlement date column from "Delivery.Period" to "Delivery.Date" so names the same in both dataframes
names(CARBON_TRADE_DATA_24_05_24)[4]  <- "Delivery.Date"

## Merge dataframes
# no of rows
989 + 600
[1] 1589

# merge or rbind dataframes
# use rbind as the column names and number are identical
trades <- rbind(NZUTrades_NymdlpZ, CARBON_TRADE_DATA_24_05_24)
# Full join - Keep 1 each of all rows by 'id' and 'date' of both data frames
# trades <- merge(x = CARBON_TRADE_DATA_24_05_24, y = NZUTrades_94O1l9s, by = "Trade.ID", all.x = TRUE, all.y = TRUE)     # Full join - Keep 1 each of all rows by 'id' of both data frames
str(trades)

table(duplicated(uniquetrades[["Trade.ID"]]))

# Remove duplicated rows
table(duplicated(trades[["Trade.ID"]]))
FALSE  TRUE
 1561   28

uniquetrades <- trades[!duplicated(trades[["Trade.ID"]]), ]
table(duplicated(uniquetrades[["Trade.ID"]]))
FALSE
 1561
str(uniquetrades)

# save the raw downloaded .csv data file
write.csv(uniquetrades, file = "uniquetrades.csv", row.names = FALSE)
# read csv file back into R
#uniquetrades <- read.csv("uniquetrades.csv")
# last trade
uniquetrades[["Date...Time"]][1]
[1] "2025-04-11 14:13:00 NZST"
#[1] "2025-04-04 12:15:00 NZDT"
# first trade
uniquetrades[["Date...Time"]][nrow(uniquetrades)]
[1] "2021-02-17 09:56:00 NZDT"
#[1] "2021-02-17 09:56:00 NZDT"

str(uniquetrades[["Date...Time"]][1])
 POSIXlt[1:1], format: "2025-04-11 14:13:00"
# POSIXlt[1:1], format: "2025-04-04 12:15:00"

# Create a .csv formatted data file
write.csv(uniquetrades, file = "uniquetrades.csv", row.names = FALSE)

## chart
# what should the y axis limit be?
max(uniquetrades[["Unit.Price"]] )
[1] 90.5
# create chart of dataframe of unique trades by date time and price
svg(filename="NZUpriceEmsTradePointspot1-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(uniquetrades[["Date...Time"]], uniquetrades[["Unit.Price"]] ,ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col="#9F116D",lwd=1,type='l',lty=1)
points(uniquetrades[["Date...Time"]], uniquetrades[["Unit.Price"]] ,col="#9F116D",pch=20,cex=0.9)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=1,line=-1.1,"Data: Carbon https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint New Zealand Unit trading prices")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
dev.off()

# earliest/first trade and latest trade
tail(uniquetrades[["Date...Time"]],1)
[1] "2021-02-17 09:56:00 NZDT"
head(uniquetrades[["Date...Time"]],1)
[1] "2025-04-11 14:13:00 NZST"
#[1] "2025-03-21 17:49:00 NZDT"

## remove duplicated indexes with zoo by median (or with average) with Date...Time dates
# on some days there are more than one trade which may be at different prices 'Aggregate' function applied to a zoo matrix can calculate a median price for all trades by day
# make a zoo time series matrix of unique trades
# add zoo timeseries package
library(zoo)
# create a zoo matrix of prices and trade placement dates
uniquetradeszoo <- zoo(x = uniquetrades[["Unit.Price"]], order.by = uniquetrades[["Date...Time"]])
Warning message:
In zoo(x = uniquetrades[["Unit.Price"]], order.by = uniquetrades[["Date...Time"]]) :
  some methods for “zoo” objects do not work if the index entries in ‘order.by’ are not unique
# yes we know there are sometimes multiple prices in a day..
str(uniquetradeszoo)
‘zoo’ series from 2021-02-17 09:56:00 to 2025-02-14 10:07:00
  Data: num [1:1561] 40 39 39 39 41.1 ...
  Index:  POSIXlt[1:1561], format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" "2021-03-31 13:42:00" ...

# aggregate by day to get median daily prices
dailymedianprices <- aggregate(uniquetradeszoo, as.Date(cut(time(uniquetradeszoo), "day")), median)
str(dailymedianprices)
‘zoo’ series from 2021-02-17 to 2025-02-27
  Data: num [1:567] 40 39 39 39 41.1 ...
  Index:  Date[1:567], format: "2021-02-17" "2021-03-03" "2021-03-31" "2021-04-05" "2021-05-16" ...

# aggregate by year to calculate number of trades per annum
# create a zoo matrix with price =1 and all the dates
# dummy prices 1 x nrow(uniquetrades)
pricesdummy <- rep(1,nrow(uniquetrades))
uniquetradesyearzoo <- zoo(x = pricesdummy , order.by = uniquetrades[["Date...Time"]])
str(uniquetradesyearzoo)
‘zoo’ series from 2021-02-17 09:56:00 to 2025-02-14 10:07:00
  Data: num [1:1561] 1 1 1 1 1 1 1 1 1 1 ...
  Index:  POSIXlt[1:1561], format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" "2021-03-31 13:42:00" ...

# how many trades each year?
tradesperannum <- aggregate(uniquetradesyearzoo, as.Date(cut(time(uniquetradesyearzoo), "year")), sum)

str(tradesperannum)
‘zoo’ series from 2021-01-01 to 2025-01-01
  Data: num [1:5] 37 252 515 548 209
  Index:  Date[1:5], format: "2021-01-01" "2022-01-01" "2023-01-01" "2024-01-01" "2025-01-01"

sum(coredata(tradesperannum))
[1] 1561

# create chart of trades by year
svg(filename="NZUtradesEmsTradePoint-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(3,3,3,1)+0.1)
barplot(tradesperannum,las=1,xlab="NZU trades per annum",col="#9F116D")  # colour is  Jazzberry Jam dark purple)
mtext(side=3,cex=1.5, line=0.25,expression(paste("emsTradepoint NZU trades by year")))
dev.off()



# create dataframe of dates and prices from the zoo matrix
dailymedianpricesdataframe <- data.frame(date = index(dailymedianprices),price= round(coredata(dailymedianprices),2))
str(dailymedianpricesdataframe)
'data.frame':	567 obs. of  2 variables:
 $ date : Date, format: "2021-02-17" "2021-03-03" ...
 $ price: num  40 39 39 39 41.1 ...

# write a csv file
write.csv(dailymedianpricesdataframe, file = "dailymedianprices.csv", row.names = FALSE)
#dailymedianpricesdataframe <- read.csv("dailymedianprices.csv",colClasses =c("Date","numeric"))

head(dailymedianpricesdataframe,1)
       date price
1 2021-02-17    40
tail(dailymedianpricesdataframe,1)
          date price
567 2025-04-10  54.5
## chart
# what should the y axis limit be?
max(dailymedianpricesdataframe[["price"]] )
[1] 88.4
colour [1] "#E41A1C" Alizarin Crimson,

# create chart of dataframe of unique trades by date time and price
svg(filename="NZUpriceEmsTradePointMedian-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(dailymedianprices, ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col="#E41A1C",lwd=1,type='l',lty=1)
points(dailymedianprices ,col="#E41A1C",pch=20,cex=0.9)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=1,line=-1.3,"Data: 'NZU prices' https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint median daily price New Zealand Unit trading")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
dev.off()

------------------------------------------------------------------------------

spotprice <- read.csv (file="/home/user/R/nzu/nzu-fork-master/apipy/spotprices.csv",  na.strings = "NA", nrows = -1, skip = 0, check.names = TRUE, strip.white = FALSE, blank.lines.skip = TRUE)

str(spotprice)
'data.frame':	2005 obs. of  2 variables:
 $ date : chr  "2010-05-14" "2010-05-21" "2010-05-29" "2010-06-11" ...
 $ price: num  17.8 17.5 17.5 17 17.8 ...
spotprice[["date"]] <- as.Date(spotprice[["date"]])
# identify dates not in ems data
before <- spotprice[["date"]] < as.Date("2021-02-17")
# leave out the 'before' dates
spotprice1 <- spotprice[!before, ]

# identify recent dates not in ems data
after <- spotprice1[["date"]] > as.Date("2025-02-14")
# leave out the 'before' dates
spotprice2 <- spotprice1[!after, ]

str(spotprice2)
'data.frame':	900 obs. of  2 variables:
 $ date : Date, format: "2021-02-23" "2021-02-24" ...
 $ price: num  39.3 39.2 39 39 39 ..
head(spotprice2[["date"]],1)
[1] "2021-02-23"
tail(spotprice2[["date"]],1)
[1] "2025-02-14"

plot(spotprice2[["date"]],spotprice2[["price"]],type='n',xlab="",ylab="")
points(spotprice2[["date"]],spotprice2[["price"]],pch =20,col='4')
points(dailymedianpricesdataframe[["date"]],dailymedianpricesdataframe[["price"]] ,pch=2,col= 'red')
legend("topright", inset=c(0.0,0.0) ,bty="n", legend=c("emsTradepoint NZU price","theecanmole/NZ-emission-unit-prices"),lty = c(NA,NA),  pch = c(1,20),col=c("#E41A1C", "blue"))
legend("topright", inset=c(0.0,0.0) ,bty="n", legend=c("emsTradepoint NZU price","NZ emission unit prices"), pch = c(2,20), col=c("#E41A1C", "blue") )
lines(spotprice2[["date"]],spotprice2[["price"]])
lines(dailymedianpricesdataframe[["date"]],dailymedianpricesdataframe[["price"]] ,col= 'red')


# create chart of median prices vs NZU spotprices
svg(filename="NZUEmsTradePointMedianCarbonnews-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(dailymedianprices, ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col="#E41A1C",lwd=1,type='l',lty=1)
#points(dailymedianprices ,col="#E41A1C",pch=19,cex=0.5)
grid(col="darkgray",lwd=1)
points(spotprice2[["date"]], spotprice2[["price"]] ,col='blue',pch=19,cex=0.5)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
#mtext(side=1,cex=1,line=-1.3,"Data: 'NZU prices' https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint vs Carbonnews NZU prices")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
legend("bottom", inset=c(0.0,0.0) ,bty="n", legend=c("emsTradepoint NZU price","Carbon News NZU price"),lty = c(1,NA),  pch = 19,col=c("#E41A1C", "blue"))
dev.off()



#points(spotprice[["date"]], spotprice[["price"]] ,col='blue',pch=19,cex=0.5)



## Indices
# read in the VWAP ECMI ECQI indices data
ECMI_ECQI_15_01_24 <- read.csv( file = "/home/user/R/nzu/ECMI_ECQI_15-01-24.csv")
str(ECMI_ECQI_15_01_24)
'data.frame':	365 obs. of  4 variables:
 $ Date      : chr  "15-01-2023" "16-01-2023" "17-01-2023" "18-01-2023" ...
 $ Daily.VWAP: num  0 76.1 0 0 0 ...
 $ ECMI      : num  82.7 80.3 80.3 80.3 80.3 ...
 $ ECQI      : num  85.1 84.8 84.8 84.9 84.9 ...

# check if date is date format, no its character format
str(ECMI_ECQI_15_01_24[["Date"]][1])
 chr "15-01-2023"
# check conversion by converting row 1 date to date format
str(as.Date(ECMI_ECQI_15_01_24[["Date"]][1], format = "%d-%m-%Y"))
Date[1:1], format: "2023-01-15"
# format date column to date format
ECMI_ECQI_15_01_24[["Date"]]  <- as.Date(ECMI_ECQI_15_01_24[["Date"]], format = "%d-%m-%Y")
# check format of dataframe again
str(ECMI_ECQI_15_01_24[["Date"]])
 Date[1:365], format: "2023-01-15" "2023-01-16" "2023-01-17" "2023-01-18" "2023-01-19" ...
## chart
# what should the y axis limit be?
summary(ECMI_ECQI_15_01_24 )
      Date              Daily.VWAP         ECMI            ECQI
 Min.   :2023-01-15   Min.   : 0.00   Min.   :44.22   Min.   :52.24
 1st Qu.:2023-04-16   1st Qu.: 0.00   1st Qu.:59.54   1st Qu.:60.98
 Median :2023-07-16   Median : 0.00   Median :66.68   Median :65.18
 Mean   :2023-07-16   Mean   :28.25   Mean   :64.87   Mean   :66.54
 3rd Qu.:2023-10-15   3rd Qu.:64.55   3rd Qu.:70.04   3rd Qu.:69.72
 Max.   :2024-01-14   Max.   :90.50   Max.   :82.74   Max.   :85.15

# Replace zeros with NA on data frame
ECMI_ECQI_15_01_24[ECMI_ECQI_15_01_24 == 0] <- NA
      Date              Daily.VWAP         ECMI            ECQI
 Min.   :2023-01-15   Min.   :37.57   Min.   :44.22   Min.   :52.24
 1st Qu.:2023-04-16   1st Qu.:56.98   1st Qu.:59.54   1st Qu.:60.98
 Median :2023-07-16   Median :65.00   Median :66.68   Median :65.18
 Mean   :2023-07-16   Mean   :62.87   Mean   :64.87   Mean   :66.54
 3rd Qu.:2023-10-15   3rd Qu.:70.00   3rd Qu.:70.04   3rd Qu.:69.72
 Max.   :2024-01-14   Max.   :90.50   Max.   :82.74   Max.   :85.15
                      NAs   :201
Outliers in VWAP?
2023-08-03	84.65
2023-09-20	90.5

# write a csv file
write.csv(ECMI_ECQI_15_01_24, file = "ECMI_ECQI_15_01_24.csv", row.names = FALSE)

# colours
library(scales)
#extract hex color codes for a plot with three elements in ggplot2
hex <- hue_pal()(4)
#display hex color codes
hex 3
[1] "#F8766D" "#00BA38" "#619CFF"
#1] Froly? (red) ; Jade ; Malibu
hex 4
[1] "#F8766D" "#7CAE00" "#00BFC4" "#C77CFF"

plot(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["ECMI"]] ,ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col='red',lwd=1,type='o',lty=1)

# create chart of dataframe of inddicies
svg(filename="NZU-indices-EmsTradePointspot1-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["ECMI"]] ,ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col="#F8766D",lwd=1,type='n',lty=1)
lines(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["ECMI"]] ,col="#F8766D")
lines(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["ECQI"]] ,col="#7CAE00")
lines(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["Daily.VWAP"]] ,col="#00BFC4")
points(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["ECMI"]] ,col="#F8766D",lwd=1,pch=19,cex=0.9)
points(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["ECQI"]] ,col="#7CAE00",pch=19,cex=0.9)
points(ECMI_ECQI_15_01_24[["Date"]], ECMI_ECQI_15_01_24[["Daily.VWAP"]] ,col="#00BFC4",pch=19,cex=0.9)
#points(uniquetrades[["Date...Time"]], uniquetrades[["Unit.Price"]] ,col="#C77CFF",pch=19,cex=0.5)
#lines(dailymedianprices,col="#C77CFF",pch=19,cex=0.5)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
#mtext(side=1,cex=0.8,line=-1.1,"Data: 'NZU prices' https://www.emstradepoint.co.nz/#downloads")
mtext(side=1,cex=1,line=2.5,"Data: 'NZU prices' https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint NZU indices")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
legend("bottom", inset=c(0.0,0.0) ,bty="n", legend=c("ECMI monthly index","ECQI quarterly index","Daily.VWAP volume weighted average price"),lty = 1, pch = 19,col=c("#F8766D", "#7CAE00", "#00BFC4"))
dev.off()

## older data files
#[1] "2025-04-07"
https://www.emstradepoint.co.nz/documents/695/NZUTrades_NymdlpZ.csv.csv
#[1] "2025-03-31"
# https://www.emstradepoint.co.nz/documents/692/NZUTrades_n1nMz0Y.csv

#[1] "2025-03-24"
#NZUTrades_lMxVvM3 <- read.csv( file = "https://www.emstradepoint.co.nz/documents/689/NZUTrades_lMxVvM3.csv")

#(today <- Sys.Date())
#[1] "2025-02-23"

# newest data file https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv
#NZUTrades_94O1l9s <- read.csv( file = "https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv")

#(today <- Sys.Date())
#[1] "2025-03-21"
#NZUTrades_E3BTdEu <- read.csv( file = "https://www.emstradepoint.co.nz/documents/686/NZUTrades_E3BTdEu.csv")
# (today <- Sys.Date())
#[1] "2025-03-04"
# newest data file https://www.emstradepoint.co.nz/documents/676/NZUTrades_4OjXpYd.csv
#NZUTrades_4OjXpYd <- read.csv( file = "https://www.emstradepoint.co.nz/documents/676/NZUTrades_4OjXpYd.csv")


#write.csv(NZUTrades_4OjXpYd, file = "NZUTrades_4OjXpYd.csv", row.names = FALSE)
# read in local csv file
#NZUTrades_94O1l9s <- read.csv( file = "NZUTrades_94O1l9s.csv")


sessionInfo()
R version 4.4.2 (2024-10-31)
Platform: x86_64-pc-linux-gnu
Running under: Debian GNU/Linux 12 (bookworm)

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.21.so;  LAPACK version 3.11.0

locale:
 [1] LC_CTYPE=en_NZ.UTF-8          LC_NUMERIC=C
 [3] LC_TIME=en_NZ.UTF-8           LC_COLLATE=en_NZ.UTF-8
 [5] LC_MONETARY=en_NZ.UTF-8       LC_MESSAGES=en_NZ.UTF-8
 [7] LC_PAPER=en_NZ.UTF-8          LC_NAME=en_NZ.UTF-8
 [9] LC_ADDRESS=en_NZ.UTF-8        LC_TELEPHONE=en_NZ.UTF-8
[11] LC_MEASUREMENT=en_NZ.UTF-8    LC_IDENTIFICATION=en_NZ.UTF-8

time zone: Pacific/Auckland
tzcode source: system (glibc)

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base

other attached packages:
[1] rkward_0.7.5

loaded via a namespace (and not attached):
[1] compiler_4.4.2 tools_4.4.2
