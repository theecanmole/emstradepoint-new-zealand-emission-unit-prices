EMS trade point NZU prices

## The company emsTradepoint New Zealand Unit (carbon) prices

(today <- Sys.Date())
[1] "2025-02-17"

The company emsTradepoint/Energy Market Services (EMS) ("https://www.emstradepoint.co.nz/#downloads") hosts csv files of recent New Zealand Unit (NZU) prices on its website.

S2V8ELm <- read.csv( file = "https://www.emstradepoint.co.nz/documents/665/NZUTrades_S2V8ELm.csv")
str(S2V8ELm)
data[["Date...Time"]] <- strptime(data[["Date...Time"]],format= "%m/%d/%Y %H:%M")
data[["Delivery.Date"]] <- as.Date(data[["Delivery.Date"]],format= "%d-%b-%y")
data[["Date...Time"]] <- as.Date(data[["Date...Time"]] )
library(zoo)
datetimezoo <- zoo(x = data[["Unit.Price"]] , order.by = data[["Date...Time"]])
deliverydatezoo <- zoo(x = data[["Unit.Price"]] , order.by = data[["Delivery.Date"]])
## remove duplicated indexes by median or with average with Date...Time dates
datetimemedianzoocut <- aggregate(datetimezoo, as.Date(cut(time(datetimezoo), "day")), median)
datetimemedianzoocutdataframe <- data.frame(date = index(datetimemedianzoocut),price= coredata(datetimemedianzoocut))
# Create a .csv formatted data file
write.csv(datetimemedianzoocutdataframe, file = "datetimemedianzoocutdataframe.csv", row.names = FALSE)

# the csv file from 19 January 2024
(today <- Sys.Date())
[1] "2024-01-19"
carbontradedata150124 <- read.csv( file = "https://www.emstradepoint.co.nz/documents/459/CARBON_TRADE_DATA_15-01-24.csv")

str(carbontradedata150124)
