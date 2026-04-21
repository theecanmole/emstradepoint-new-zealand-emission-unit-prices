## EMS trade point NZU prices

# The energy trading company emsTradepoint publishs New Zealand (emission) Unit (carbon) prices from it's trading platform.

## latest data    https://www.emstradepoint.co.nz/documents/873/NZUTrades_4SOzJmK.csv

(today <- Sys.Date())
[1] "2026-04-21"
# download and read in the latest trades data
NZUTrades_4SOzJmK <- read.csv( file = "https://www.emstradepoint.co.nz/documents/873/NZUTrades_4SOzJmK.csv", header = TRUE)

# Create and write a .csv formatted data file to the working directory
write.csv(NZUTrades_4SOzJmK, file = "NZUTrades_4SOzJmK.csv", row.names = FALSE)

# make second dataframe to use edit and reformat
Tradeslatest <- NZUTrades_4SOzJmK

str(Tradeslatest)
'data.frame':	600 obs. of  11 variables:
 $ Trade.ID        : int  35301 35295 35294 35279 35278 35277 35276 35274 35273 35272 ...
 $ Date...Time     : chr  "4/17/2026 14:40" "4/17/2026 10:59" "4/17/2026 10:59" "4/16/2026 14:34" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Period : chr  "21-Apr-26" "21-Apr-26" "21-Apr-26" "20-Apr-26" ...
 $ Quantity        : int  238 500 1000 128 1000 2000 120 71 1000 200 ...
 $ Unit.Price      : num  47 46.5 46.3 46.2 47.5 ...
 $ Total.Quantity  : int  238 500 1000 128 1000 2000 120 71 1000 200 ...
 $ Value           : num  11186 23250 46300 5920 47500 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

# edit fourth column name
names(Tradeslatest)[4] <- "Delivery.Date"

str(Tradeslatest)

# check most recent trading dates and time and formats
Tradeslatest[["Date...Time"]][1]             # most recent trade date is mm-dd-yyyy H:S
[1] "4/17/2026 14:40"
#[1] "4/1/2026 12:24"
#[1] "3/8/2026 19:08"

# which is the last row of data?
Tradeslatest[["Date...Time"]][451]
[1] ""
Tradeslatest[["Date...Time"]][450]
[1] "5/15/2025 13:19"

# the earliest dates are the rows at the bottom of the dataframe, and rows 451 to 600 are "" or NAs so delete rows 451 to 600
Tradeslatest <- Tradeslatest[1:450,]

# look at last row of dataframe
tail(Tradeslatest,1)
    Trade.ID     Date...Time Product Delivery.Date Quantity Unit.Price
450    29860 5/15/2025 13:19  CP-NZU     19-May-25     1000       55.5
    Total.Quantity Value Off.Market.Trade Broker Anonymous
450           1000 55500                       N         Y
#    Trade.ID    Date...Time Product Delivery.Date Quantity Unit.Price
#420    29794 5/9/2025 13:39  CP-NZU     13-May-25     1000         51
#    Total.Quantity Value Off.Market.Trade Broker Anonymous
#420           1000 51000                       N         Y

# first row
head(Tradeslatest,1)
  Trade.ID     Date...Time Product Delivery.Date Quantity Unit.Price
1    35301 4/17/2026 14:40  CP-NZU     21-Apr-26      238         47
  Total.Quantity Value Off.Market.Trade Broker Anonymous
1            238 11186                       N         Y
#  Trade.ID    Date...Time Product Delivery.Date Quantity Unit.Price
#1    34988 4/1/2026 12:24  CP-NZU      7-Apr-26       50       41.5
#  Total.Quantity Value Off.Market.Trade Broker Anonymous
#1             50  2075                       N         Y

# earliest trade date is 04/17/2026 in mm/dd/yyyy H:M date format

# check earliest delivery date # it follows date of trade by  2 to 4 days and is in dd-mmm-yy format
Tradeslatest[["Delivery.Date"]][450]
[1] "19-May-25"
#[1] "13-May-25"

# what is the class of the date..time column?
class(Tradeslatest[["Date...Time"]][1])
[1] "character"

# how should the date format look like?
strptime(Tradeslatest[["Date...Time"]][1],format= "%m/%d/%Y %H:%M")
[1] "2026-04-17 14:40:00 NZST"
# check class if format changed with strptime
class(strptime(Tradeslatest[["Date...Time"]][1],format= "%m/%d/%Y %H:%M"))
[1] "POSIXlt" "POSIXt"

# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
Tradeslatest[["Date...Time"]] <- strptime(Tradeslatest[["Date...Time"]],format= "%m/%d/%Y %H:%M")

# check date again
str(Tradeslatest[["Date...Time"]])
POSIXlt[1:450], format: "2026-04-17 14:40:00" "2026-04-17 10:59:00" "2026-04-17 10:59:00" ...

# put in date and trade number order
Tradeslatest <- Tradeslatest[order(Tradeslatest$Date...Time), ]

# save the latest tradesdata file to a csv file
write.csv(Tradeslatest, file = "Tradeslatest.csv", row.names = FALSE)
# read csv file back into R
#Tradeslatest <- read.csv("Tradeslatest.csv")
-----------------------------------------------------------------------------------------------------------------------------------------------
## Merge latest 2025 and earlier trades dataframes
dim(Tradeslatest)
[1] 450  11

# read the older csv file back into R
Tradesuniqueall <- read.csv("Tradesuniqueall.csv")
# check dimensions
dim(Tradesuniqueall)
[1] 2014   11
# first row
head(Tradesuniqueall,1)
  Trade.ID         Date...Time Product Delivery.Date Quantity Unit.Price
1     9744 2021-02-17 09:56:00  CP-NZU     24-Feb-21      100         40
  Total.Quantity Value Off.Market.Trade Broker Anonymous
1            100  4000                       N         Y
# last row
tail(Tradesuniqueall,1)
     Trade.ID         Date...Time Product Delivery.Date Quantity Unit.Price
2014    34988 2026-04-01 12:24:00  CP-NZU      7-Apr-26       50       41.5
     Total.Quantity Value Off.Market.Trade Broker Anonymous
2014             50  2075                       N         Y

# check if the names are consistent
identical(names(Tradeslatest), names(Tradesuniqueall))
[1] TRUE

# merge or rbind dataframes, use rbind as the column names and number are identical
Tradesuniqueall <- rbind(Tradeslatest, Tradesuniqueall)

dim(Tradesuniqueall)
[1] 2464   11

str(Tradesuniqueall)

# check for duplicated trades by trade id number (rows)
table(duplicated(Tradesuniqueall[["Trade.ID"]]))
FALSE  TRUE
2053   411

# remove duplicated rows
Tradesuniqueall <- Tradesuniqueall[!duplicated(Tradesuniqueall[["Trade.ID"]]), ]
# check there are no duplicated rows
table(duplicated(Tradesuniqueall[["Trade.ID"]]))
FALSE
2053
# that means there are no duplicate trade id numbers and no duplicated rows

# find the NA
Tradesuniqueall[is.na(Tradesuniqueall$Unit.Price), ]
<0 rows> (or 0-length row.names)
# check structure of dataframe
str(Tradesuniqueall)


# check for  NA s in date column
summary(Tradesuniqueall[["Date...Time"]] )
                      Min.                    1st Qu.
"2021-02-17 09:56:00.0000" "2023-06-29 15:11:00.0000"
                    Median                       Mean
"2024-04-04 11:26:00.0000" "2024-03-03 15:38:16.8922"
                   3rd Qu.                       Max.
"2025-01-22 03:07:00.0000" "2025-11-27 15:26:00.0000"

# check for  NA s in price column
summary(Tradesuniqueall[["Unit.Price"]] )
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
  34.00   55.08   62.00   62.31   68.47   90.50

# find the NA
Tradesuniqueall[is.na(Tradesuniqueall$Unit.Price), ]
# none
# remove the NA
# Tradesuniqueall <- Tradesuniqueall[!is.na(Tradesuniqueall$Unit.Price), ]

# check for duplicated dates? that is ok as multiple trades can occur on any date
table(duplicated(Tradesuniqueall[["Date...Time"]]))
FALSE  TRUE
 1693   360
# arrange in trade number order
#Tradesuniqueall <- Tradesuniqueall[order(Tradesuniqueall[["Trade.ID"]] ), ]
Tradesuniqueall <- Tradesuniqueall[order(Tradesuniqueall$Date...Time), ]

head(Tradesuniqueall,1)
      Trade.ID         Date...Time Product Delivery.Date Quantity Unit.Price
11000     9744 2021-02-17 09:56:00  CP-NZU     24-Feb-21      100         40

# Create a .csv formatted data file
write.csv(Tradesuniqueall, file = "Tradesuniqueall.csv", row.names = FALSE)

---------------------------------------------------------------------
## chart of all unique trades by emsTradepoint
# what should the y axis limit be?
max(Tradesuniqueall[["Unit.Price"]] )
[1] 90.5

# create chart of dataframe of unique trades by trade date time and price
svg(filename="NZUpriceEmsTradePointspot1-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(Tradesuniqueall[["Date...Time"]], Tradesuniqueall[["Unit.Price"]] ,ylim=c(0,95),tck=0.01,xlab="Year",ylab="",ann=TRUE, las=1,col="#9F116D",lwd=1,type='l',lty=1)
points(Tradesuniqueall[["Date...Time"]], Tradesuniqueall[["Unit.Price"]] ,col="#9F116D",pch=20,cex=0.75)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=1,line=-1.1,"Data: https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint New Zealand Unit (NZU) trading prices")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
mtext(side=4,cex=0.75, line=0.05, adj=0, Sys.Date())
dev.off()

str(Tradesuniqueall[["Date...Time"]] )
POSIXlt[1:1977], format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" "2021-03-31 13:42:00" ...
# need to change from POZIX to date format
as.Date(Tradesuniqueall[["Date...Time"]][1])
[1] "2021-02-17"
class(as.Date(Tradesuniqueall[["Date...Time"]][1]))
[1] "Date"

# create dataframe of dates without H or S and prices from the dataframe
Tradingpricesdataframe <- data.frame(date = as.Date(Tradesuniqueall[["Date...Time"]]), price= Tradesuniqueall[["Unit.Price"]])

str(Tradingpricesdataframe)
'data.frame':	2053 obs. of  2 variables:
 $ date : Date, format: "2021-02-17" "2021-03-03" ...
 $ price: num  40 39 39 39 41.1 ...

library("ggplot2")

# color #B80000				Guardsman Red was "#ED1A3B" Alizarin crimson

svg(filename="NZUpriceEmsTradePointspot1-720by540.svg", width = 8, height = 6, pointsize = 16, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
#png("NZUpriceEmsTradePointspot1-720by540.png", bg="white", width=720, height=540)
ggplot(Tradingpricesdataframe, aes(x = date, y = price)) +
geom_line(colour ="#B80000" ) +
#geom_point(colour = "#ED1A3B") +
theme_bw(base_size = 14) +
scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80))  +
scale_x_date(date_breaks = "year", date_labels = "%Y") +
theme(axis.ticks.length = unit(-3,"pt"), plot.title = element_text(size = 20, hjust = 0.5, vjust= -6 )) +
theme(plot.caption = element_text( hjust = 0.5 )) +
labs(title="emsTradepoint New Zealand Unit (NZU) trading prices", x ="Years", y ="Price $NZD", caption="Data: https://www.emstradepoint.co.nz/#downloads") +
annotate("text", x= max(Tradingpricesdataframe[["date"]]), y = 2, size = 3, angle = 0, hjust = 1, label=R.version.string)
dev.off()
---------------------------------------------------------------------------
------------------------------------------------------------

## create median (or average) daily prices with Zoo

# on some days there are more than one trade which may be at different prices 'Aggregate' function applied to a zoo matrix can calculate a median price for all trades by day
# make a zoo time series matrix of unique trades
# add the zoo timeseries package

library(zoo)

# create a zoo matrix of prices and trade placement dates
uniquetradeszoo <- zoo(x = Tradesuniqueall[["Unit.Price"]], order.by = Tradesuniqueall[["Date...Time"]])

Warning message:
In zoo(x = uniquetrades[["Unit.Price"]], order.by = uniquetrades[["Date...Time"]]) :
  some methods for “zoo” objects do not work if the index entries in ‘order.by’ are not unique
# yes we know there are sometimes multiple prices in a day..

str(uniquetradeszoo)
‘zoo’ series from 2021-02-17 09:56:00 to 2026-04-17 14:40:00
  Data: num [1:2053] 40 39 39 39 41.1 ...
  Index:  POSIXlt[1:2053], format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" "2021-03-31 13:42:00" ...


tail(uniquetradeszoo,4)
2026-04-16 14:34:00 2026-04-17 10:59:00 2026-04-17 10:59:00 2026-04-17 14:40:00
              46.25               46.50               46.30               47.00

# aggregate by day to get median daily prices
dailymedianprices <- aggregate(uniquetradeszoo, by=as.Date(time(uniquetradeszoo)), median)

str(dailymedianprices)
‘zoo’ series from 2021-02-17 to 2026-04-17
  Data: num [1:752] 40 39 39 39 41.1 ...
  Index:  Date[1:752], format: "2021-02-17" "2021-03-03" "2021-03-31" "2021-04-06" "2021-05-17" ...

# aggregate by year to calculate number of trades per annum
# create a zoo matrix with price =1 and all the dates
# dummy prices 1 x nrow(uniquetrades)
pricesdummy <- rep(1,nrow(Tradesuniqueall))

uniquetradesyearzoo <- zoo(x = pricesdummy , order.by = Tradesuniqueall[["Date...Time"]])
str(uniquetradesyearzoo)

# how many trades each year?
tradesperannum <- aggregate(uniquetradesyearzoo, as.Date(cut(time(uniquetradesyearzoo), "year")), sum)

str(tradesperannum)

# print number of trades per year
2021-01-01 2022-01-01 2023-01-01 2024-01-01 2025-01-01 2026-01-01
        37        252        515        548        510        191
sum(coredata(tradesperannum))
[1] 2053

# create bar chart of trades by year
svg(filename="NZUtradesEmsTradePoint-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(3,3,3,1)+0.1)
barplot2 <- barplot(tradesperannum,las=1,xlab="NZU trades per annum",col="#9F116D")  # colour is  Jazzberry Jam dark purple)
text(barplot2, tradesperannum + 10, tradesperannum, xpd = TRUE, col = "black",cex=0.9)
mtext(side=3,cex=1.5, line=0.5,expression(paste("emsTradepoint annual volume of NZU trades")))
dev.off()

# create dataframe of dates and prices from the zoo matrix
dailymedianpricesdataframe <- data.frame(date = index(dailymedianprices),price= round(coredata(dailymedianprices),2))

str(dailymedianpricesdataframe)
'data.frame':	752 obs. of  2 variables:
 $ date : Date, format: "2021-02-17" "2021-03-03" ...
 $ price: num  40 39 39 39 41.1 ..

# write a csv file
write.csv(dailymedianpricesdataframe, file = "dailymedianprices.csv", row.names = FALSE)
# read in csv file
#dailymedianpricesdataframe <- read.csv("dailymedianprices.csv",colClasses =c("Date","numeric"))

head(dailymedianpricesdataframe,1)
       date price
1 2021-02-17    40
tail(dailymedianpricesdataframe,1)
          date price
752 2026-04-17  46.5

## chart
# what should the y axis limit be?
max(dailymedianpricesdataframe[["price"]] )
[1] 88.4
# colour [1] was "#E41A1C" Alizarin Crimson, is now BBC red "Guardsman" #B80000

svg(filename="NZUpriceEmsTradePointMedian-720by540.svg", width = 8, height = 6, pointsize = 16, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
#png("NZUpriceEmsTradePointMedian-720by540.png", bg="white", width=720, height=540)
ggplot(dailymedianpricesdataframe, aes(x = date, y = price)) +
geom_line(colour = "#B80000") +
#geom_point(colour = "#B80000") +
theme_grey(base_size = 16) +
scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80))  +
scale_x_date(date_breaks = "year", date_labels = "%Y") +
theme(axis.ticks.length = unit(-3,"pt"), plot.title = element_text(size = 18, hjust = 0.5, vjust= -8 )) +
#theme(plot.title = element_text(size = 18, hjust = 0.5, vjust= -8 )) +
theme(plot.caption = element_text( hjust = 0.5 )) +
labs(title="emsTradepoint New Zealand Unit (NZU) median daily prices", x ="Years", y ="Price $NZD", caption="Data: https://github.com/theecanmole/emstradepoint-new-zealand-emission-unit-prices") +
annotate("text", x= max(dailymedianpricesdataframe[["date"]]), y = 2, size = 3, angle = 0, hjust = 1, label=R.version.string)
dev.off()

# create chart of dataframe of unique trades by date time and price
svg(filename="NZUpriceEmsTradePointMedian-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(dailymedianpricesdataframe, ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col="#E41A1C",lwd=1,type='l',lty=1)
points(dailymedianpricesdataframe ,col="#E41A1C",pch=20,cex=0.8)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=1,line=-1.3,"Data: https://www.emstradepoint.co.nz/#downloads\nhttps://github.com/theecanmole/emstradepoint-new-zealand-emission-unit-prices")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint median daily prices of New Zealand Unit trading")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
mtext(side=4,cex=0.75, line=0.05, adj=0, Sys.Date())
dev.off()

--------------------------------------------------------------------------------------------
## Download and format earliest data back to 17 February 2021

# Wayback archive 23 May 2024
https://web.archive.org/web/20240523220718/https://www.emstradepoint.co.nz/documents/530/CARBON_TRADE_DATA_24-05-24.csv

# read in data
CARBON_TRADE_DATA_24_05_24 <- read.csv( file = "https://web.archive.org/web/20240523220718/https://www.emstradepoint.co.nz/documents/530/CARBON_TRADE_DATA_24-05-24.csv")

# Create a .csv formatted data file
write.csv(CARBON_TRADE_DATA_24_05_24, file = "CARBON_TRADE_DATA_24-05-24.csv", row.names = FALSE)

# read original csv file back into R if needed
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

# create new dataframe to clean and edit and reformat
Tradesdata2021 <- CARBON_TRADE_DATA_24_05_24
# check dates
Tradesdata2021[["Date...Time"]][1]        # most recent date - it does not overlap with NZUTrades first date 4 June 2024, in ddmmyyyy format
[1] "23/05/2024 11:11"
Tradesdata2021[["Date...Time"]][989]
[1] "17/02/2021 9:56"                                 # that is the first trade, format is dd/mm/yyyy HH:MM

## check and reformat date columns for consistency between files- check the first date
Tradesdata2021[["Date...Time"]][989]
[1] "2021-02-17 09:56:00 NZDT"
[1] "17/02/2021 9:56"

Tradesdata2021[["Date...Time"]][1]
[1] "23/05/2024 11:11"

#[1] "3/8/2024 12:19"
class(Tradesdata2021[["Date...Time"]][989])
[1] "POSIXlt" "POSIXt"
class(Tradesdata2021[["Date...Time"]][1])
[1] "POSIXlt" "POSIXt"
#[1] "character"

# check date format to strptime date time NOTE format is dmy =  %m/%d/%Y %H:%M
strptime(Tradesdata2021[["Date...Time"]][989],format= "%d/%m/%Y %H:%M")
[1] "2021-02-17 09:56:00 NZDT"
class(strptime(Tradesdata2021[["Date...Time"]][989],format= "%d/%m/%Y %H:%M"))
[1] "POSIXlt" "POSIXt"
strptime(Tradesdata2021[["Date...Time"]][1],format= "%d/%m/%Y %H:%M")
[1] "2024-05-23 11:11:00 NZST"

class(strptime(Tradesdata2021[["Date...Time"]][1],format= "%d/%m/%Y %H:%M"))
[1] "POSIXlt" "POSIXt"

# change date format from mdy to POSIXt dd mm yyyy hs
Tradesdata2021[["Date...Time"]] <- strptime(Tradesdata2021[["Date...Time"]],format= "%d/%m/%Y %H:%M")
# confirm date format is POSIXt
class(Tradesdata2021[["Date...Time"]])
[1] "POSIXlt" "POSIXt"
# check date format
str(Tradesdata2021[["Date...Time"]])
 POSIXlt[1:989], format: "2024-05-23 11:11:00" "2024-05-22 15:22:00" "2024-05-22 10:35:00" ...
# check first row
head(Tradesdata2021,1)
  Trade.ID         Date...Time Product Delivery.Date Quantity Unit.Price
1    24601 2024-05-23 11:11:00  CP-NZU     27-May-24      100       45.5
  Total.Quantity Value Off.Market.Trade Broker Anonymous
1            100  4550
# check last row         Y
tail(Tradesdata2021,1)
    Trade.ID         Date...Time Product Delivery.Date Quantity Unit.Price
989     9744 2021-02-17 09:56:00  CP-NZU     24-Feb-21      100         40
    Total.Quantity Value Off.Market.Trade Broker Anonymous
989            100  4000                       N         Y
# arrange in date time order
Tradesdata2021 <- Tradesdata2021[order(Tradesdata2021$Date...Time), ]
--------------------------------------------------------------------------
## Obtain trades from 2024, the csv file from 23/02/2025

#(today <- Sys.Date())
#[1] "2025-02-23"

# 23 Feb 2025 Obtain data file from https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv
NZUTrades_94O1l9s <- read.csv( file = "https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv")

#  Or read in file if needed
NZUTrades_94O1l9s <- read.csv( file = "NZUTrades_94O1l9s.csv")

# save as  a .csv formatted data file
write.csv(NZUTrades_94O1l9s, file = "NZUTrades_94O1l9s.csv", row.names = FALSE)
str(NZUTrades_94O1l9s)
'data.frame':	570 obs. of  11 variables:
 $ Trade.ID        : int  28410 28392 28391 28390 28384 28370 28369 28368 28367 28366 ...
 $ Date...Time     : chr  "2/14/2025 10:07" "2/12/2025 15:51" "2/12/2025 15:51" "2/12/2025 15:51" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : chr  "18-Feb-25" "14-Feb-25" "14-Feb-25" "14-Feb-25" ...
 $ Quantity        : int  600 80 91 300 300 250 139 92 63 30 ...
 $ Unit.Price      : num  63 63 63 63 62.8 ...
 $ Total.Quantity  : int  600 80 91 300 300 250 139 92 63 30 ...
 $ Value           : num  37800 5040 5733 18900 18825 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

# create new dataframe to clean and reformat
Tradesdata2024 <- NZUTrades_94O1l9s

## check and reformat date columns for consistency between files- check the first date row 1
Tradesdata2024[["Date...Time"]][570]
[1] "3/8/2024 12:19"
class(Tradesdata2024[["Date...Time"]][570])
[1] "character"
Tradesdata2024[["Date...Time"]][1]
[1] "2/14/2025 10:07"

# check date format to strptime date time NOTE format is mdy =  %m/%d/%Y %H:%M
strptime(Tradesdata2024[["Date...Time"]][570],format= "%m/%d/%Y %H:%M")
[1] "2024-03-08 12:19:00 NZDT"
strptime(Tradesdata2024[["Date...Time"]][1],format= "%m/%d/%Y %H:%M")
[1] "2025-02-14 10:07:00 NZDT"

class(strptime(Tradesdata2024[["Date...Time"]][1],format= "%m/%d/%Y %H:%M"))
[1] "POSIXlt" "POSIXt"
# change date format from mdy to POSIXt dd mm yyyy hs
Tradesdata2024[["Date...Time"]] <- strptime(NZUTrades_94O1l9s[["Date...Time"]],format= "%m/%d/%Y %H:%M")
# confirm date format is POSIXt
class(Tradesdata2024[["Date...Time"]])
[1] "POSIXlt" "POSIXt"

# put in date order
Tradesdata2024 <- Tradesdata2024[order(Tradesdata2024$Date...Time), ]

---------------------------------------------------------------------
## Merge 2021 and 2024 trades dataframes
dim(Tradesdata2021)
[1] 989  14
dim(Tradesdata2024)
[1] 570  11

str(Tradesdata2021)

# leave out last 4 columns of the older data set Trades2021 that are not in recent files so columns = 11 same in both data
Tradesdata2021 <- Tradesdata2021 [,-c(12,13,14)]

# check if names consistent
identical(names(Tradesdata2021), names(Tradesdata2024))
[1] FALSE
names(Tradesdata2021)
 [1] "Trade.ID"         "Date...Time"      "Product"          "Delivery.Period"   # period not date
 [5] "Quantity"         "Unit.Price"       "Total.Quantity"   "Value"
 [9] "Off.Market.Trade" "Broker"           "Anonymous"
names(Tradesdata2024)
 [1] "Trade.ID"         "Date...Time"      "Product"          "Delivery.Date"
 [5] "Quantity"         "Unit.Price"       "Total.Quantity"   "Value"
 [9] "Off.Market.Trade" "Broker"           "Anonymous"

# changes Delivery.Period to Delivery.Date in Tradesdata2021
names(Tradesdata2021)[4] <- names(Tradesdata2024)[4]
# check if names consistent
identical(names(Tradesdata2021), names(Tradesdata2024))
[1] TRUE

# write to csv file
write.csv(Tradesdata2021, file = "Trades2021.csv", row.names = FALSE)
#  Or read in file if needed
Tradesdata2021 <- read.csv( file = "Tradesdata2021.csv")

# the two dataframes include all trades sinces trading started in 17/02/2021 and up to 14/02/2025

Tradesdata2021  starts 17/02/2021    ends 23/05/2024
Tradesdata2024  earliest trade date is "2024-03-08 12:19:00 NZDT" and end date "2025-02-14 10:07:00 NZDT"

## Merge dataframes
# no of rows
989 + 570
[1] 1559

# merge or rbind dataframes
# use rbind as the column names and number are identical Full join - Keep 1 each of all rows by 'id' and 'date' of both data frames
Trades20212024 <- rbind(Tradesdata2021, Tradesdata2024)

str(Trades20212024)
'data.frame':	1559 obs. of  11 variables:
 $ Trade.ID        : int  9744 9845 10032 10105 10373 10389 10388 10415 10416 10417 ...
 $ Date...Time     : POSIXlt, format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : chr  "24-Feb-21" "10-Mar-21" "9-Apr-21" "13-Apr-21" ...
 $ Quantity        : int  100 500 500 5 35 5000 20 160 100 10 ...
 $ Unit.Price      : num  40 39 39 39 41.1 ...
 $ Total.Quantity  : int  100 500 500 5 35 5000 20 160 100 10 ...
 $ Value           : num  4000 19475 19500 195 1440 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

# check for duplicated trades by trade id number (rows)
table(duplicated(Trades20212024[["Trade.ID"]]))

FALSE  TRUE
 1447   112

# remove duplicated rows
Trades20212024 <- Trades20212024[!duplicated(Trades20212024[["Trade.ID"]]), ]
# check there are no duplicated rows
table(duplicated(Trades20212024[["Trade.ID"]]))
FALSE
1447
# that means there are no duplicate trade id numbers and no duplicated rows

# save the raw downloaded .csv data file
write.csv(Trades20212024, file = "Trades20212024.csv", row.names = FALSE)
# read csv file back into R
#Trades20212024 <- read.csv("Trades20212024.csv")

# check the structure of the dataframe
str(Trades20212024)
'data.frame':	1447 obs. of  11 variables:
 $ Trade.ID        : int  9744 9845 10032 10105 10373 10389 10388 10415 10416 10417 ...
 $ Date...Time     : POSIXlt, format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : chr  "24-Feb-21" "10-Mar-21" "9-Apr-21" "13-Apr-21" ...
 $ Quantity        : int  100 500 500 5 35 5000 20 160 100 10 ...
 $ Unit.Price      : num  40 39 39 39 41.1 ...
 $ Total.Quantity  : int  100 500 500 5 35 5000 20 160 100 10 ...
 $ Value           : num  4000 19475 19500 195 1440 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

---------------------------------------------------------------------
## Merge 2021 and 2024 trades dataframes
dim(Tradesdata2021)
[1] 989  14
dim(Tradesdata2024)
[1] 570  11
str(Tradesdata2021)

# leave out last 4 columns of the older data set Trades2021 that are not in recent files so columns = 11 same in both data
Tradesdata2021 <- Tradesdata2021 [,-c(12,13,14)]

# check if names consistent
identical(names(Tradesdata2021), names(Tradesdata2024))
[1] FALSE
names(Tradesdata2021)
 [1] "Trade.ID"         "Date...Time"      "Product"          "Delivery.Period"   # period not date
 [5] "Quantity"         "Unit.Price"       "Total.Quantity"   "Value"
 [9] "Off.Market.Trade" "Broker"           "Anonymous"
names(Tradesdata2024)
 [1] "Trade.ID"         "Date...Time"      "Product"          "Delivery.Date"
 [5] "Quantity"         "Unit.Price"       "Total.Quantity"   "Value"
 [9] "Off.Market.Trade" "Broker"           "Anonymous"

# changes Delivery.Period to Delivery.Date in Tradesdata2021
names(Tradesdata2021)[4] <- names(Tradesdata2024)[4]
# check if names consistent
identical(names(Tradesdata2021), names(Tradesdata2024))
[1] TRUE

# the two dataframes include all trades sinces trading started in 17/02/2021 and up to 14/02/2025

Tradesdata2021  starts 17/02/2021    ends 23/05/2024
Tradesdata2024  earliest trade date is "8/03/2024 12:19:00 NZDT" and end date "14/02/2025 10:07:00 NZDT"

## Merge dataframes
# no of rows
989 + 570
[1] 1559

# merge or rbind dataframes, use rbind as the column names and number are identical
Trades20212024 <- rbind(Tradesdata2021, Tradesdata2024)
dim(Trades20212024)
[1] 1447   11






------------------------------------------------------------------------------
## compare EMS Tradepoint prices with the spot prices repo series

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
(today <- Sys.Date())
[1] "2026-04-11"
# download and read in the latest trades data
NZUTrades_ffVEMLm <- read.csv( file = "https://www.emstradepoint.co.nz/documents/867/NZUTrades_ffVEMLm.csv", header = TRUE)
(today <- Sys.Date())
[1] "2026-03-24"
# download and read in the latest trades data
NZUTrades_o4m7tkZ <- read.csv( file = "https://www.emstradepoint.co.nz/documents/859/NZUTrades_o4m7tkZ.csv", header = TRUE)
(today <- Sys.Date())
[1] "2026-03-06"
# download and read in the latest trades data
NZUTrades_Yqb1Nhp <- read.csv( file = "https://www.emstradepoint.co.nz/documents/856/NZUTrades_Yqb1Nhp.csv", header = TRUE)
(today <- Sys.Date())
[1] "2026-01-19"
# download and read in the latest trades data
NZUTrades_bN7SdbR <- read.csv( file = "https://www.emstradepoint.co.nz/documents/840/NZUTrades_bN7SdbR.csv", header = TRUE)
(today <- Sys.Date())
[1] "2025-12-24"
# download and read in the latest trades data
NZUTrades_OgJ9J3H <- read.csv( file = "https://www.emstradepoint.co.nz/documents/833/NZUTrades_OgJ9J3H.csv", header = TRUE)
(today <- Sys.Date())
[1] "2025-12-06"
https://www.emstradepoint.co.nz/documents/822/NZUTrades_wzN19tu.csv 06.12.2025
[1] "2025-11-07"
# download and read in the latest trades data
NZUTrades_6flplQZ <- read.csv( file = "https://www.emstradepoint.co.nz/documents/808/NZUTrades_6flplQZ.csv" ,header = TRUE)
(today <- Sys.Date())
[1] "2025-10-24"
# download latest trades data
NZUTrades_OQoEh6b <- read.csv( file = "https://www.emstradepoint.co.nz/documents/801/NZUTrades_OQoEh6b.csv" ,header = TRUE)
(today <- Sys.Date())
[1] "2025-10-02"
# download latest trades data
NZUTrades_OpXUE87 <- read.csv( file = "https://www.emstradepoint.co.nz/documents/792/NZUTrades_OpXUE87.csv" ,header = TRUE)
today <- Sys.Date())
[1] "2025-09-04"
# download latest trades data
NZUTrades_4XYvZq5 <- read.csv( file = "https://www.emstradepoint.co.nz/documents/777/NZUTrades_4XYvZq5.csv" ,header = TRUE)
(today <- Sys.Date())
[1] "2025-08-09"
# download latest trades data
NZUTrades_hj8DRbv <- read.csv( file = "https://www.emstradepoint.co.nz/documents/758/NZUTrades_hj8DRbv.csv" ,header = FALSE)(today <- Sys.Date())
[1] "2025-07-02"
https://www.emstradepoint.co.nz/documents/742/NZUTrades_n8BUSp5.csv
[1] "2025-06-01"
https://www.emstradepoint.co.nz/documents/723/NZUTrades_pX7or8E.csv
[1] "2025-05-09"
https://www.emstradepoint.co.nz/documents/712/NZUTrades_Sn5dmiG.csv
#(today <- Sys.Date())
#[1] "2025-04-18"
# download trades data
#https://www.emstradepoint.co.nz/documents/698/NZUTrades_NymdlpZ.csv
#NZUTrades_NymdlpZ <- read.csv( file = "https://www.emstradepoint.co.nz/documents/698/NZUTrades_NymdlpZ.csv")
#[1] "2025-04-07"
#https://www.emstradepoint.co.nz/documents/695/NZUTrades_NymdlpZ.csv.csv
#[1] "2025-03-31"
# https://www.emstradepoint.co.nz/documents/692/NZUTrades_n1nMz0Y.csv
#[1] "2025-03-24"
#NZUTrades_lMxVvM3 <- read.csv( file = "https://www.emstradepoint.co.nz/documents/689/NZUTrades_lMxVvM3.csv")
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

format(as.Date("65-05-14", "%y-%m-%d"), "19%y-%m-%d")

sessionInfo()
R version 4.2.2 Patched (2022-11-10 r83330)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Debian GNU/Linux 12 (bookworm)

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.21.so

locale:
 [1] LC_CTYPE=en_NZ.UTF-8          LC_NUMERIC=C
 [3] LC_TIME=en_NZ.UTF-8           LC_COLLATE=en_NZ.UTF-8
 [5] LC_MONETARY=en_NZ.UTF-8       LC_MESSAGES=en_NZ.UTF-8
 [7] LC_PAPER=en_NZ.UTF-8          LC_NAME=en_NZ.UTF-8
 [9] LC_ADDRESS=en_NZ.UTF-8        LC_TELEPHONE=en_NZ.UTF-8
[11] LC_MEASUREMENT=en_NZ.UTF-8    LC_IDENTIFICATION=en_NZ.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base

other attached packages:
[1] ggplot2_4.0.1 rkward_0.7.5

loaded via a namespace (and not attached):
 [1] withr_3.0.2        dplyr_1.1.4        grid_4.2.2         R6_2.6.1
 [5] lifecycle_1.0.5    gtable_0.3.6       magrittr_2.0.4     scales_1.4.0
 [9] pillar_1.11.1      rlang_1.1.7        cli_3.6.5          farver_2.1.2
[13] vctrs_0.7.1        generics_0.1.4     RColorBrewer_1.1-3 tools_4.2.2
[17] S7_0.2.1           glue_1.8.0         compiler_4.2.2     pkgconfig_2.0.3
[21] tidyselect_1.2.1   tibble_3.3.1
