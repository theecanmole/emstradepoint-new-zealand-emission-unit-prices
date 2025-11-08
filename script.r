## EMS trade point NZU prices

# The energy trading company emsTradepoint publishs New Zealand Unit (carbon) prices from it's trading platform.

## latest data

(today <- Sys.Date())
[1] "2025-11-07"
# download and read in the latest trades data
NZUTrades_6flplQZ <- read.csv( file = "https://www.emstradepoint.co.nz/documents/808/NZUTrades_6flplQZ.csv" ,header = TRUE)

# Create and write a .csv formatted data file to the working directory
write.csv(NZUTrades_6flplQZ, file = "NZUTrades_6flplQZ.csv", row.names = FALSE)

# make second dataframe to use
NZUTrades <- NZUTrades_6flplQZ

str(NZUTrades)
'data.frame':	600 obs. of  11 variables:
 $ Trade.ID        : int  32389 32379 32378 32377 32370 32354 32226 32210 32151 32150 ...
 $ Date...Time     : chr  "10/30/2025 12:30" "10/30/2025 9:17" "10/30/2025 9:17" "10/30/2025 9:16" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Period : chr  "3-Nov-25" "3-Nov-25" "3-Nov-25" "3-Nov-25" ...
 $ Quantity        : int  1200 360 1000 40 1274 1000 121 663 7500 1500 ...
 $ Unit.Price      : num  52.8 52.9 52.9 52.9 53 54.9 55 55.8 55.9 55.5 ...
 $ Total.Quantity  : int  1200 360 1000 40 1274 1000 121 663 7500 1500 ...
 $ Value           : num  63360 19044 52900 2116 67522 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

# add col names read in from the older csv file
NZUTrades_94O1l9s <- read.csv("olderdata/NZUTrades_94O1l9s.csv")
names(NZUTrades) <- names(NZUTrades_94O1l9s)

str(NZUTrades)

# check most recent trading dates
NZUTrades[["Date...Time"]][1]             # most recent trade date
[1] "10/30/2025 12:30"
#[1] "10/17/2025 9:17"
#[1] "9/25/2025 12:29"
#[1] "8/29/2025 13:25"
#[1] "8/1/2025 17:00"
#[1] "6/25/2025 9:09"
#[1] "5/19/2025 15:32"
#[1] "5/16/2025 16:45"
#[1] "5/1/2025 13:20"
#[1] "4/23/2025 14:35"
#[1] "4/11/2025 14:13"
#[1] "4/4/2025 12:15"
#[1] "3/21/2025 17:49"
#[1] "2/27/2025 13:58"
#[1] "2/14/2025 10:07"

# the earliest dates are the rows at the bottom of the dataframe, and rows 511 to 600 are NAs
NZUTrades[["Date...Time"]][510]
[1] "11/26/2024 13:09"
NZUTrades[["Date...Time"]][511]
[1] ""

# earliest trade date is  26 Nov 2024
NZUTrades[["Date...Time"]][510]
#[1] "11/14/2024 14:52"
#[1] "10/22/2024 14:07"
#[1] "9/25/2024 17:00"
#[1] "8/20/2024 8:00"
#[1] "7/8/2024 12:55"
#[1] "6/4/2024 19:20"
#[1] "6/3/2024 19:37"
#[1] "5/17/2024 19:31"
#[1] "5/13/2024 19:56"
#[1] "5/7/2024 11:37"
#[1] "5/3/2024 13:13"

# check earliest delivery date            # it follows date of trade by some 4 days
NZUTrades[["Delivery.Date"]][510]
[1] "28-Nov-24"
#[1] "18-Nov-24"
#[1] "24-Oct-24"
#[1] "27-Sep-24"
#[1] "22-Aug-24"
#[1] "10-Jul-24"
#[1] "6-Jun-24"
#[1] "5-Jun-24"
#[1] "21-May-24"
#[1] "15-May-24"
#[1] "9-May-24"
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

# check dates
CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1]        # most recent date - it does not overlap with NZUTrades first date 4 June 2024
[1] "23/05/2024 11:11"
CARBON_TRADE_DATA_24_05_24[["Date...Time"]][989]
[1] "17/02/2021 9:56"                                 # that is the first trade

--------------------------------------------------------------------------
# the two dataframes include all trades sinces trading started in 17/02/2021 with a gap from 23/05/2024 to 22/10/2024.
NZUTrades                   earliest trade date is 26/11/2024 and end date 30/10/2025
CARBON_TRADE_DATA_24_05_24  starts 17/02/2021    ends 23/05/2024

# the two dataframes do not include all trades sinces trading started in 17/02/2021, there's a gap from 23/05/2024 to 03/06/2024

## so another file of trades is needed to fill gap, the file from 23/02/2025
#(today <- Sys.Date())
#[1] "2025-02-23"
# 23 Feb 2025 data file https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv
NZUTrades_94O1l9s <- read.csv( file = "https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv")
# Create a .csv formatted data file
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

## check and reformat date columns for consistency between files- check the first date row 1
NZUTrades_94O1l9s[["Date...Time"]][570]
[1] "3/8/2024 12:19"
class(NZUTrades_94O1l9s[["Date...Time"]][570])
[1] "character"

class(NZUTrades_94O1l9s[["Delivery.Date"]][570])
[1] "character"
NZUTrades_94O1l9s[["Delivery.Date"]][570]
[1] "12-Mar-24"

# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
NZUTrades_94O1l9s[["Date...Time"]] <- strptime(NZUTrades_94O1l9s[["Date...Time"]],format= "%m/%d/%Y %H:%M")
# format to date time NOTE input is %d/%m/%Y dd/mm/yyyy and output is yyyy-mm-dd
NZUTrades_94O1l9s[["Delivery.Date"]] <- as.Date(NZUTrades_94O1l9s[["Delivery.Date"]],format= "%d-%b-%y")

NZUTrades[["Date...Time"]][1]
[1] "10/30/2025 12:30"
#[1] "10/17/2025 9:17"
#[1] "9/25/2025 12:29"
#[1] "8/1/2025 17:00"
#[1] "6/25/2025 9:09"
#[1] "5/19/2025 15:32"
#[1] "4/23/2025 14:35"
#[1] "4/11/2025 14:13"
#[1] "4/4/2025 12:15"
#[1] "3/21/2025 17:49"
# what is the class?
class(NZUTrades[["Date...Time"]][1])
[1] "character"
# how would date format be?
strptime(NZUTrades[["Date...Time"]][1],format= "%m/%d/%Y %H:%M")
[1] "2025-10-17 09:17:00 NZDT"
#[1] "2025-09-25 12:29:00 NZST"
#[1] "2025-08-01 17:00:00 NZST"
#[1] "2025-06-25 09:09:00 NZST"
#[1] "2025-05-19 15:32:00 NZST"
#[1] "2025-05-01 13:20:00 NZST"
#[1] "2025-04-23 14:35:00 NZST"
#[1] "2025-04-11 14:13:00 NZST"
#[1] "2025-04-04 12:15:00 NZDT"
# check class
class(strptime(NZUTrades[["Date...Time"]][1],format= "%m/%d/%Y %H:%M"))
[1] "POSIXlt" "POSIXt"
# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
NZUTrades[["Date...Time"]] <- strptime(NZUTrades[["Date...Time"]],format= "%m/%d/%Y %H:%M")

# check date again
str(NZUTrades[["Date...Time"]][1],format= "%m/%d/%Y %H:%M")
 POSIXlt[1:1], format: "2025-10-30 12:30:00"
# POSIXlt[1:1], format: "2025-10-17 09:17:00"
# POSIXlt[1:1], format: "2025-09-25 12:29:00"
# POSIXlt[1:1], format: "2025-08-01 17:00:00"
# POSIXlt[1:1], format: "2025-06-25 09:09:00"
# POSIXlt[1:1], format: "2025-05-19 15:32:00"
# POSIXlt[1:1], format: "2025-05-01 13:20:00"
# POSIXlt[1:1], format: "2025-04-23 14:35:00"
# POSIXlt[1:1], format: "2025-04-11 14:13:00"
# POSIXlt[1:1], format: "2025-04-04 12:15:00"

# format to date time NOTE input is %d/%m/%Y dd/mm/yyyy and output is yyyy-mm-dd
NZUTrades[["Delivery.Date"]] <- as.Date(NZUTrades[["Delivery.Date"]],format= "%d-%b-%y")
# check format
str(NZUTrades[["Delivery.Date"]][1])
 Date[1:1], format: "2025-11-03"
#Date[1:1], format: "2025-10-21"
#Date[1:1], format: "2025-09-29"
#Date[1:1], format: "2025-08-05"
# Date[1:1], format: "2025-06-27"
# Date[1:1], format: "2025-05-21"
# Date[1:1], format: "2025-05-05"
#Date[1:1], format: "2025-04-28"
#Date[1:1], format: "2025-04-15"
#Date[1:1], format: "2025-04-08"
--------------------------------------------------------------------------

# reformat date columns - check the first date row 1
str(NZUTrades[["Date...Time"]][1])
 POSIXlt[1:1], format: "2025-10-30 12:30:00"
# POSIXlt[1:1], format: "2025-09-25 12:29:00"
# POSIXlt[1:1], format: "2025-05-01 13:20:00"
# POSIXlt[1:1], format: "2025-04-23 14:35:00"
#POSIXlt[1:1], format: "2025-04-11 14:13:00"
#POSIXlt[1:1], format: "2025-04-04 12:15:00"
# what is the class?
class(NZUTrades[["Date...Time"]][1])
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
989 + 600 + 570
[1] 2159
#[1] 1589

# merge or rbind dataframes
# use rbind as the column names and number are identical
trades <- rbind(NZUTrades, NZUTrades_94O1l9s, CARBON_TRADE_DATA_24_05_24)
# Full join - Keep 1 each of all rows by 'id' and 'date' of both data frames
# trades <- merge(x = CARBON_TRADE_DATA_24_05_24, y = NZUTrades_94O1l9s, by = "Trade.ID", all.x = TRUE, all.y = TRUE)     # Full join - Keep 1 each of all rows by 'id' of both data frames
str(trades)
'data.frame':	2159 obs. of  11 variables:
 $ Trade.ID        : int  32151 32150 32149 32137 32136 32135 32127 32125 32124 32120 ...
 $ Date...Time     : POSIXlt, format: "2025-10-17 09:17:00" "2025-10-17 09:17:00" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : Date, format: "2025-10-21" "2025-10-21" ...
 $ Quantity        : int  7500 1500 1000 1000 325 175 100 1000 300 400 ...
 $ Unit.Price      : num  55.9 55.5 55.9 55.5 56 56 56 56 56 56 ...
 $ Total.Quantity  : int  7500 1500 1000 1000 325 175 100 1000 300 400 ...
 $ Value           : num  419250 83250 55900 55500 18200 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...

# check for duplicated rows
table(duplicated(trades[["Trade.ID"]]))
FALSE  TRUE
 1820   3339
#FALSE  TRUE
 1780   379
#FALSE  TRUE
# 1729   430
#FALSE  TRUE
# 1708   451
# FALSE  TRUE
# 1672   487
# FALSE  TRUE
# 1612   547
# FALSE  TRUE
# 1584    5
# remove duplicated rows
uniquetrades <- trades[!duplicated(trades[["Trade.ID"]]), ]
# check there are no duplicated rows
table(duplicated(uniquetrades[["Trade.ID"]]))
FALSE
1820
# that means there are no duplicate trade id numbers

# save the raw downloaded .csv data file
write.csv(uniquetrades, file = "uniquetrades.csv", row.names = FALSE)
# read csv file back into R
#uniquetrades <- read.csv("uniquetrades.csv")

# check the structure of the dataframe
str(uniquetrades)
'data.frame':	1820 obs. of  11 variables:
 $ Trade.ID        : int  32389 32379 32378 32377 32370 32354 32226 32210 32151 32150 ...
 $ Date...Time     : POSIXlt, format: "2025-10-30 12:30:00" "2025-10-30 09:17:00" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : Date, format: "2025-11-03" "2025-11-03" ...
 $ Quantity        : int  1200 360 1000 40 1274 1000 121 663 7500 1500 ...
 $ Unit.Price      : num  52.8 52.9 52.9 52.9 53 54.9 55 55.8 55.9 55.5 ...
 $ Total.Quantity  : int  1200 360 1000 40 1274 1000 121 663 7500 1500 ...
 $ Value           : num  63360 19044 52900 2116 67522 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...


# last (most recent) trade NB note that the dataframe starts in row 1 with the most recent date and the 'nrow' (last) row is the earliest date
uniquetrades[["Date...Time"]][1]
[1] "2025-10-30 12:30:00 NZDT"
#[1] "2025-10-17 09:17:00 NZDT"
#[1] "2025-09-25 12:29:00 NZST"
#[1] "2025-08-29 13:25:00 NZST"
#[1] "2025-08-01 17:00:00 NZST"
#[1] "2025-06-25 09:09:00 NZST"
#[1] "2025-05-19 15:32:00 NZST"
#[1] "2025-05-01 13:20:00 NZST"
#[1] "2025-04-23 14:35:00 NZST"
#[1] "2025-04-11 14:13:00 NZST"
#[1] "2025-04-04 12:15:00 NZDT"
# first (earliest) trade
uniquetrades[["Date...Time"]][nrow(uniquetrades)]
[1] "2021-02-17 09:56:00 NZDT"      # same as always

str(uniquetrades[["Date...Time"]][1])
 POSIXlt[1:1], format: "2025-10-30 12:30:00"
# POSIXlt[1:1], format: "2025-10-17 09:17:00"
# POSIXlt[1:1], format: "2025-09-25 12:29:00"
# POSIXlt[1:1], format: "2025-06-25 09:09:00"
# POSIXlt[1:1], format: "2025-05-19 15:32:00"
# POSIXlt[1:1], format: "2025-05-01 13:20:00"
# POSIXlt[1:1], format: "2025-04-23 14:35:00"
# POSIXlt[1:1], format: "2025-04-11 14:13:00"
# POSIXlt[1:1], format: "2025-04-04 12:15:00"
check for  NA s in date column
summary(uniquetrades[["Unit.Price"]] )
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NAs
  34.00   55.98   62.50   62.75   69.00   90.50       1

# find the NA
uniquetrades[is.na(uniquetrades$Unit.Price), ]
    Trade.ID Date...Time Product Delivery.Date Quantity Unit.Price
511       NA        <NA>                  <NA>       NA         NA
    Total.Quantity Value Off.Market.Trade Broker Anonymous
511             NA    NA
# remove the NA
uniquetrades <- uniquetrades[!is.na(uniquetrades$Unit.Price), ]

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
#points(uniquetrades[["Date...Time"]], uniquetrades[["Unit.Price"]] ,col="#9F116D",pch=20,cex=0.75)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=1,line=-1.1,"Data: https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint New Zealand Unit (NZU) trading prices")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
mtext(side=4,cex=0.75, line=0.05, adj=0, Sys.Date())
dev.off()

# earliest/first trade and latest trade
tail(uniquetrades[["Date...Time"]],1)
[1] "2021-02-17 09:56:00 NZDT"
head(uniquetrades[["Date...Time"]],1)
[1] "2025-10-30 12:30:00 NZDT"
#[1] "2025-10-17 09:17:00 NZDT"
#[1] "2025-08-29 13:25:00 NZST"
#[1] "2025-08-01 17:00:00 NZST"
#[1] "2025-05-19 15:32:00 NZST"
#[1] "2025-05-01 13:20:00 NZST"
#[1] "2025-04-23 14:35:00 NZST"
#[1] "2025-04-11 14:13:00 NZST"
#[1] "2025-03-21 17:49:00 NZDT"
str(uniquetrades[["Date...Time"]],1)
POSIXlt[1:1728], format: "2025-08-01 17:00:00" "2025-08-01 16:16:00" "2025-08-01 16:03:00" ...

## create median (or average) daily prices with Zoo
# on some days there are more than one trade which may be at different prices 'Aggregate' function applied to a zoo matrix can calculate a median price for all trades by day
# make a zoo time series matrix of unique trades
# add the zoo timeseries package
library(zoo)
# create a zoo matrix of prices and trade placement dates
uniquetradeszoo <- zoo(x = uniquetrades[["Unit.Price"]], order.by = uniquetrades[["Date...Time"]])
Warning message:
In zoo(x = uniquetrades[["Unit.Price"]], order.by = uniquetrades[["Date...Time"]]) :
  some methods for “zoo” objects do not work if the index entries in ‘order.by’ are not unique
# yes we know there are sometimes multiple prices in a day..

str(uniquetradeszoo)
‘zoo’ series from 2021-02-17 09:56:00 to 2025-10-30 12:30:00
  Data: num [1:1819] 40 39 39 39 41.1 ...
  Index:  POSIXlt[1:1819], format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" "2021-03-31 13:42:00" ...

tail(uniquetradeszoo,4)
2025-10-30 09:16:00 2025-10-30 09:17:00 2025-10-30 09:17:00 2025-10-30 12:30:00
               52.9                52.9                52.9                52.8
Warning message:
In zoo(rval[i], index(x)[i]) :
  some methods for “zoo” objects do not work if the index entries in ‘order.by’ are not unique

# aggregate by day to get median daily prices
dailymedianprices <- aggregate(uniquetradeszoo, by=as.Date(time(uniquetradeszoo)), median)

str(dailymedianprices)
‘zoo’ series from 2021-02-17 to 2025-10-30
  Data: num [1:665] 40 39 39 39 41.1 ...
  Index:  Date[1:665], format: "2021-02-17" "2021-03-03" "2021-03-31" "2021-04-06" "2021-05-17" ...

# aggregate by year to calculate number of trades per annum
# create a zoo matrix with price =1 and all the dates
# dummy prices 1 x nrow(uniquetrades)
pricesdummy <- rep(1,nrow(uniquetrades))

uniquetradesyearzoo <- zoo(x = pricesdummy , order.by = uniquetrades[["Date...Time"]])
str(uniquetradesyearzoo)
‘zoo’ series from 2021-02-17 09:56:00 to 2025-10-17 09:17:00
  Data: num [1:1819] 1 1 1 1 1 1 1 1 1 1 ...
  Index:  POSIXlt[1:1819], format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" "2021-03-31 13:42:00" ...

# how many trades each year?
tradesperannum <- aggregate(uniquetradesyearzoo, as.Date(cut(time(uniquetradesyearzoo), "year")), sum)

str(tradesperannum)
‘zoo’ series from 2021-01-01 to 2025-01-01
  Data: num [1:5] 37 252 515 548 467
  Index:  Date[1:5], format: "2021-01-01" "2022-01-01" "2023-01-01" "2024-01-01" "2025-01-01"
# print number of trades per year
tradesperannum
2021-01-01 2022-01-01 2023-01-01 2024-01-01 2025-01-01
        37        252        515        548        467

sum(coredata(tradesperannum))
[1] 1819

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
'data.frame':	665 obs. of  2 variables:
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
665 2025-10-30  52.9
#          date price
#661 2025-10-17  55.9
#          date price
#650 2025-09-25 57.02
#      date price
#623 2025-08-01  56.5

## chart
# what should the y axis limit be?
max(dailymedianpricesdataframe[["price"]] )
[1] 88.4
colour [1] "#E41A1C" Alizarin Crimson,

# create chart of dataframe of unique trades by date time and price
svg(filename="NZUpriceEmsTradePointMedian-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(dailymedianprices, ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col="#E41A1C",lwd=1,type='l',lty=1)
#points(dailymedianprices ,col="#E41A1C",pch=20,cex=0.9)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=1,line=-1.3,"Data: https://www.emstradepoint.co.nz/#downloads\nhttps://github.com/theecanmole/emstradepoint-new-zealand-emission-unit-prices")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint median daily prices of New Zealand Unit trading")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
mtext(side=4,cex=0.75, line=0.05, adj=0, Sys.Date())
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
