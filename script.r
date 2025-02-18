## EMS trade point NZU prices

# The energy trading company emsTradepoint publishs New Zealand Unit (carbon) prices from it's trading platform.

(today <- Sys.Date())
[1] "2025-02-18"

The company emsTradepoint/Energy Market Services (EMS) ("https://www.emstradepoint.co.nz/#downloads") hosts csv files of recent New Zealand Unit (NZU) prices on its website.

S2V8ELm <- read.csv( file = "https://www.emstradepoint.co.nz/documents/665/NZUTrades_S2V8ELm.csv")
str(S2V8ELm)

S2V8ELm[["Date...Time"]] <- strptime(S2V8ELm[["Date...Time"]],format= "%m/%d/%Y %H:%M")
S2V8ELm[["Delivery.Date"]] <- as.Date(S2V8ELm[["Delivery.Date"]],format= "%d-%b-%y")
S2V8ELm[["Date...Time"]] <- as.Date(S2V8ELm[["Date...Time"]] )

library(zoo)
S2V8ELmdatetimezoo <- zoo(x = S2V8ELm[["Unit.Price"]] , order.by = S2V8ELm[["Date...Time"]])
S2V8ELmdeliverydatezoo <- zoo(x = S2V8ELm[["Unit.Price"]] , order.by = S2V8ELm[["Delivery.Date"]])

## remove duplicated indexes with zoo by median (or with average) with Date...Time dates
S2V8ELmdatetimemedianzoocut <- aggregate(S2V8ELmdatetimezoo, as.Date(cut(time(S2V8ELmdatetimezoo), "day")), median)
# create dataframe
S2V8ELmdatetimemediandataframe <- data.frame(date = index(S2V8ELmdatetimemedianzoocut),price= round(coredata(S2V8ELmdatetimemedianzoocut),2))

# Create a .csv formatted data file
write.csv(S2V8ELmdatetimemediandataframe, file = "S2V8ELmdatetimemediandataframe.csv", row.names = FALSE)

# create chart of dataframe of spot date and price
svg(filename="NZUpriceEmsTradePointspot1-720by540.svg", width = 8, height = 6, pointsize = 12, onefile = FALSE, family = "sans", bg = "white", antialias = c("default", "none", "gray", "subpixel"))
par(mar=c(2.7,2.7,1,1)+0.1)
plot(S2V8ELmdatetimemediandataframe,ylim=c(0,75),tck=0.01,xlab="",ylab="",ann=TRUE, las=1,col='red',lwd=1,type='l',lty=1)
points(S2V8ELmdatetimemediandataframe,col='red',pch=19,cex=0.5)
grid(col="darkgray",lwd=1)
axis(side=4, tck=0.01, las=0,tick=TRUE,labels = FALSE)
mtext(side=1,cex=0.8,line=-1.1,"Data: 'NZU prices' https://www.emstradepoint.co.nz/#downloads")
mtext(side=3,cex=1.5, line=-2.2,expression(paste("emsTradepoint New Zealand Unit prices 2024 2025")) )
mtext(side=2,cex=1, line=-1.3,"$NZ Dollars/tonne")
mtext(side=4,cex=0.75, line=0.05,R.version.string)
dev.off()

# the csv file from 19 January 2024
(today <- Sys.Date())
[1] "2024-01-19"
carbontradedata150124 <- read.csv( file = "https://www.emstradepoint.co.nz/documents/459/CARBON_TRADE_DATA_15-01-24.csv")

str(carbontradedata150124)
