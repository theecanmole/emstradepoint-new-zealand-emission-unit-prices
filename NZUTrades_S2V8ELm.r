The company emsTradepoint/Energy Market Services (EMS) ("https://www.emstradepoint.co.nz/#downloads") hosts csv files of recent New Zealand Unit (NZU) prices on its website.
getwd()
[1] "/home/user/R/nzu/ems"
# download the csv file
S2V8ELm <- read.csv( file = "https://www.emstradepoint.co.nz/documents/665/NZUTrades_S2V8ELm.csv")
# save the raw downloaded .csv data file
write.csv(S2V8ELm, file = "NZUTrades_S2V8ELm.csv", row.names = FALSE)
S2V8ELm <- read.csv( file = "NZUTrades_S2V8ELm.csv")
S2V8ELm[["Date...Time"]][1]
[1] "2025-02-07"
S2V8ELm[["Date...Time"]][570]
[1] "2024-03-04"

# reformat date columns
S2V8ELm[["Date...Time"]] <- strptime(S2V8ELm[["Date...Time"]],format= "%m/%d/%Y %H:%M")
S2V8ELm[["Delivery.Date"]] <- as.Date(S2V8ELm[["Delivery.Date"]],format= "%d-%b-%y")
#S2V8ELm[["Date...Time"]] <- as.Date(S2V8ELm[["Date...Time"]] )
S2V8ELm[["Date...Time"]][1]

# add zoo timeseries package
library(zoo)
# create a zoo matrix of prices and trade placement dates
S2V8ELmdatetimezoo <- zoo(x = S2V8ELm[["Unit.Price"]] , order.by = S2V8ELm[["Date...Time"]])
# create a zoo matrix of prices and NZU delivery/settlement dates -  settlement date is usually two business Days after the trade day
S2V8ELmdeliverydatezoo <- zoo(x = S2V8ELm[["Unit.Price"]] , order.by = S2V8ELm[["Delivery.Date"]])
