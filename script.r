## EMS trade point NZU prices

# The energy trading company emsTradepoint publishs New Zealand Unit (carbon) prices from it's trading platform.
(today <- Sys.Date())
[1] "2025-02-23"
## latest data
# newest data file https://www.emstradepoint.co.nz/documents/670/NZUTrades_94O1l9s.csv
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
NZUTrades_94O1l9s[["Date...Time"]][1]
[1] "2/14/2025 10:07"                                           # most recent trade date
NZUTrades_94O1l9s[["Date...Time"]][570]
[1] "3/8/2024 12:19"                                            # earliest trade date
NZUTrades_94O1l9s[["Delivery.Date"]][570]
[1] "12-Mar-24"

## earliest data
# Wayback archive 23 May 2024
https://web.archive.org/web/20240523220718/https://www.emstradepoint.co.nz/documents/530/CARBON_TRADE_DATA_24-05-24.csv
# read in data
CARBON_TRADE_DATA_24_05_24 <- read.csv( file = "https://web.archive.org/web/20240523220718/https://www.emstradepoint.co.nz/documents/530/CARBON_TRADE_DATA_24-05-24.csv")
# Create a .csv formatted data file
write.csv(CARBON_TRADE_DATA_24_05_24, file = "CARBON_TRADE_DATA_24-05-24.csv", row.names = FALSE)
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
CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][1]
[1] "27-May-24"
CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1]                      # most recent date - it overlaps with NZUTrades_94O1l9s first date [1] "12-Mar-24"
[1] "23/05/2024 11:11"
CARBON_TRADE_DATA_24_05_24[["Date...Time"]][989]
[1] "17/02/2021 9:56"                                               # that is the first trade

# the two dataframes imclude all trades sinces inception with over lap 12/03/2024 to 27/05/2024
NZUTrades_94O1l9s
CARBON_TRADE_DATA_24_05_24

# reformat date columns
NZUTrades_94O1l9s[["Date...Time"]][1]
[1] "2/14/2025 10:07"
class(NZUTrades_94O1l9s[["Date...Time"]][1])
[1] "character"
# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
NZUTrades_94O1l9s[["Date...Time"]] <- strptime(NZUTrades_94O1l9s[["Date...Time"]],format= "%m/%d/%Y %H:%M")
#
str(NZUTrades_94O1l9s[["Date...Time"]][1])
 POSIXlt[1:1], format: "2025-02-14 10:07:00"

# format to date time NOTE input is %d/%m/%Y dd/mm/yyyy and output is yyyy-mm-dd
NZUTrades_94O1l9s[["Delivery.Date"]] <- as.Date(NZUTrades_94O1l9s[["Delivery.Date"]][1],format= "%d-%b-%y")
str(NZUTrades_94O1l9s[["Delivery.Date"]][1])
Date[1:1], format: "2025-02-18"
# leave out last 4 columns of the older data set that are not in recent files so columns = 11 same in both data
CARBON_TRADE_DATA_24_05_24 <- CARBON_TRADE_DATA_24_05_24 [,-c(12,13,14)]

# format first date to strptime date time
CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1]
[1] "23/05/2024 11:11"

strptime(CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1],format= "%d/%m/%Y %H:%M")
[1] "2024-05-23 11:11:00 NZST"
# format to strptime date time NOTE its %m/%d/%Y mm/dd/yyyy
CARBON_TRADE_DATA_24_05_24[["Date...Time"]] <- strptime(CARBON_TRADE_DATA_24_05_24[["Date...Time"]],format= "%d/%m/%Y %H:%M")
# check class of date time [1]
str(CARBON_TRADE_DATA_24_05_24[["Date...Time"]][1])
POSIXlt[1:1], format: "2024-05-23 11:11:00"

# check delivery date input
CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][1]
[1] "27-May-24"
# check foormat of first date to as.Date
str(as.Date(CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][989],format= "%d-%b-%y"))
 Date[1:1], format: "2021-02-24"
# format to yyyy-mm-dd as.Date format
CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]] <- as.Date(CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]],format= "%d-%b-%y")
str(CARBON_TRADE_DATA_24_05_24[["Delivery.Period"]][1])
 Date[1:1], format: "2024-05-27"

# rename settlement date column from "Delivery.Period" to "Delivery.Date" so names the same in both dataframes
names(CARBON_TRADE_DATA_24_05_24)[4]  <- "Delivery.Date"

## Merge dataframes
# no of rows
989 + 570
[1] 1559

# merge or rbind dataframes
# use rbind as the column names and number are identical
trades <- rbind(NZUTrades_94O1l9s, CARBON_TRADE_DATA_24_05_24)
# Full join - Keep 1 each of all rows by 'id' and 'date' of both data frames
# trades <- merge(x = CARBON_TRADE_DATA_24_05_24, y = NZUTrades_94O1l9s, by = "Trade.ID", all.x = TRUE, all.y = TRUE)     # Full join - Keep 1 each of all rows by 'id' of both data frames
str(trades)
'data.frame':	1447 obs. of  21 variables::  ???????
# is 1447 the number of unique trade ids? probably
table(trades$Trade.ID)
 9744  9845 10032 10105 10373 10388 10389 10415 10416 10417 10611 10875 10950
    1     1     1     1     1     1     1     1     1     1     1     1     1
# yes there are 1447 unique Trade IDs but there are 21 columns

# Remove duplicated rows
table(duplicated(trades[["Trade.ID"]]))
FALSE  TRUE
 1447   112

uniquetrades <- trades[!duplicated(trades[["Trade.ID"]]), ]
table(duplicated(uniquetrades[["Trade.ID"]]))
FALSE
 1447
 str(uniquetrades)
'data.frame':	1447 obs. of  11 variables:
 $ Trade.ID        : int  9744 9845 10032 10105 10373 10388 10389 10415 10416 10417 ...
 $ Date...Time     : POSIXlt, format: "2021-02-17 09:56:00" "2021-03-03 13:18:00" ...
 $ Product         : chr  "CP-NZU" "CP-NZU" "CP-NZU" "CP-NZU" ...
 $ Delivery.Date   : Date, format: "2021-02-24" "2021-03-10" ...
 $ Quantity        : int  100 500 500 5 35 20 5000 160 100 10 ...
 $ Unit.Price      : num  40 39 39 39 41.1 ...
 $ Total.Quantity  : int  100 500 500 5 35 20 5000 160 100 10 ...
 $ Value           : num  4000 19475 19500 195 1440 ...
 $ Off.Market.Trade: chr  "" "" "" "" ...
 $ Broker          : chr  "N" "N" "N" "N" ...
 $ Anonymous       : chr  "Y" "Y" "Y" "Y" ...
# save the raw downloaded .csv data file
write.csv(uniquetrades, file = "uniquetrades.csv", row.names = FALSE)

(today <- Sys.Date())
[1] "2025-02-18"

## remove duplicated indexes with zoo by median (or with average) with Date...Time dates
# There aree many trades at different prices each work day. 'Aggregate' function applied to a zoo matrix can calculate a median price for all trades on a work day
# make a zoo time series matrix of unique trades
S2V8ELmdatetimemedianzoocut <- aggregate(S2V8ELmdatetimezoo, as.Date(cut(time(S2V8ELmdatetimezoo), "day")), median)
# create dataframe of dates and prices from the zoo matrix
S2V8ELmdatetimemediandataframe <- data.frame(date = index(S2V8ELmdatetimemedianzoocut),price= round(coredata(S2V8ELmdatetimemedianzoocut),2))

# Create a .csv formatted data file
write.csv(S2V8ELmdatetimemediandataframe, file = "S2V8ELmdatetimemediandataframe.csv", row.names = FALSE)

## charts
# what should the y axis limit be?
max(uniquetrades[["Unit.Price"]] )
[1] 90.5
# create chart of dataframe of unique trades by date time and price
svg(filename="NZUpriceEmsTradePointspot1-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(uniquetrades[["Date...Time"]], uniquetrades[["Unit.Price"]] ,ylim=c(0,95),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col='red',lwd=1,type='l',lty=1)
points(uniquetrades[["Date...Time"]], uniquetrades[["Unit.Price"]] ,col='red',pch=19,cex=0.5)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=0.8,line=-1.1,"Data: 'NZU prices' https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint New Zealand Unit trading prices")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
dev.off()

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
