#install.packages(c("shinydashboard","rsconnect","shiny","plotly","reshape2","SmarterPoland", "dplyr","zoo","viridis","lubridate"))
library(shinydashboard)
library(ggplot2)
#library(httr)
library(rsconnect)
library(shiny)
library(plotly)
library(reshape2)
library(SmarterPoland)
library(dplyr)
library(zoo)
library(viridis)
library(lubridate)
library(streamgraph)
#library(htmlwidgets)
#####################################################
#Property Bubble
#####################################################
#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/InterestRate.RData"))
load(url("https://www.dropbox.com/s/o0sppo8rv5lnkc3/InterestRate.RData?dl=1"))
#Interest <- read.xls("InterestRate.xls", sheet = "Interest")

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/HousePrice.RData"))
load(url("https://www.dropbox.com/s/anniglmx2h3vjt4/HousePrice.RData?dl=1"))
#HousePrice <- read.xls("HousePrice.xls", sheet = "Index")

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/DebtIncome.RData"))
load(url("https://www.dropbox.com/s/bdu0m5akotvuxcd/DebtIncome.RData?dl=1"))
#CreditData <- read.xls("DebtIncome.xls", sheet= "Data")

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/ConstructionQuart.RData"))
load(url("https://www.dropbox.com/s/ntnyv43qy3son45/ConstructionQuart.RData?dl=1"))
#ConQ <- read.xls("ConstructionQuart.xls", sheet = "Index")

Interest <- melt(Interest, id.vars="Time", value.name = "value", variable.name = "Rate")
HousePrice <- melt(HousePrice, id.vars="Time", value.name = "value", variable.name = "Region")
CreditData <- melt(CreditData, id.vars="Time", value.name = "value", variable.name = "Region")
ConQ <- melt(ConQ, id.vars="Time", value.name = "value", variable.name = "Region")

CreditData$Time <-  as.Date(CreditData$Time, format("%Y-%m-%d"))
Interest$Time <- as.Date(Interest$Time, format("%Y-%m-%d"))
ConQ$Time <-  as.Date(ConQ$Time, format("%Y-%m-%d"))
HousePrice$Time <- as.Date(HousePrice$Time, format("%Y-%m-%d"))

IntPlot2 <- plot_ly(Interest, x = ~Time, y = ~value, color = Interest$Rate, colors = "coral2", type = "scatter", mode = "lines")%>%
  layout(title = "Euribor 1 Year Interest Rate",xaxis = list(title = 'Time'),
         yaxis = list(title = 'Percentage'))
CreditPlot2 <- plot_ly(CreditData, x = ~Time, y = ~value, color = CreditData$Region, colors = c("grey35", "green3", "grey60"), type = "scatter", mode = "lines")%>%
  layout(title = "Private Debt To Income Ratio",xaxis = list(title = 'Time'),
         yaxis = list(title = 'Percentage'))

HPPlot2 <- plot_ly(HousePrice, x = ~Time, y = ~value, color = HousePrice$Region, colors = c("grey35", "green3", "grey60"), type = "scatter", mode = "lines")%>%
  layout(title = "House Price Index",xaxis = list(title = 'Time'),
         yaxis = list(title = 'Index(2010 = 100)'))
ConPlot2 <- plot_ly(ConQ, x = ~Time, y = ~value, color = ConQ$Region, colors = c("grey35", "green3", "grey60"), type = "scatter", mode = "lines")%>%
  layout(title = "Construction Output Index",xaxis = list(title = 'Time'),
         yaxis = list(title = 'Index(2010 = 100)'))

#####################################################
#Financial Crisis
#####################################################

#BankData <- read.xls("BankingData.xls", sheet = "Data", check.names = FALSE)
#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/BankingData.RData"))
load(url("https://www.dropbox.com/s/nwtmdd3c7wt4b5t/BankingData.RData?dl=1"))
#BankData <- melt(BankData,  id.vars = c("Series", "Country", "Code"),
                 #variable.name = "Year", 
                 #value.name = "Percentage")

#BankData$Year <-  as.Date(BankData$Year, format("%Y"))
#BankData$Year <- year(BankData$Year)


NPFL <- filter(BankData, Series == "Bank nonperforming loans to total gross loans")
CapRatio <- filter(BankData, Series == "Bank capital to assets ratio")
CapRatio <- filter(CapRatio, Year %in% c(2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016))
CreditToPrivate <- filter(BankData, Series == "Domestic credit to private sector by banks")
CreditFromFin <- filter(BankData, Series == "Domestic credit provided by financial sector")
CreditFromFin <- filter(CreditFromFin, Year %in% c(1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015))


#load(url("https://dl.dropboxusercontent.com/u/78100269/nasa_10_f_tr.RData"))
#load(url("https://dl.dropboxusercontent.com/u/78100269/nasa_10_f_bs.RData"))

#nasa_10_f_tr$time <-  as.Date(nasa_10_f_tr$time, format("%Y"))
#nasa_10_f_tr$time <- year(nasa_10_f_tr$time)


#nasa_10_f_bs$time <-  as.Date(nasa_10_f_bs$time, format("%Y"))
#nasa_10_f_bs$time <- year(nasa_10_f_bs$time)

Regions <- c("EU28", "DE", "EL", "IE", "UK", "ES", "FR", "IT", "NL", "PT")

Region <- c("DE","EL", "IE", "FR", "UK","ES","IT")
#Liabdata <- filter(nasa_10_f_bs, finpos == "LIAB", sector == "S12", co_nco == "CO", unit == "PC_GDP", na_item == "F",geo.time %in% Region)
#Transdata <- filter(nasa_10_f_tr, finpos == "ASS", sector == "S12", co_nco == "CO", unit == "PC_GDP", na_item == "F_TR",geo.time %in% Region)

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/Liabdata.Rdata"))
load(url("https://www.dropbox.com/s/g0ejwhhvs3czcbh/Liabdata.Rdata?dl=1"))
#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/Transdata.Rdata"))
load(url("https://www.dropbox.com/s/x1ptn8xuu1avwm2/Transdata.Rdata?dl=1"))



colours = (col=viridis(7))

colours3 = (col=plasma(7))
colours4 = (col=magma(7))


Liabplot <- plot_ly(Liabdata, x = ~time, y=~value, color = ~geo.time, colors = colours, type = "bar")%>%
  layout(barmode = "stack",title = "Total Financial Sector Liabilities", yaxis = list(title = "Percentage of GDP"), xaxis = list(title = "Time"))

Transplot <- plot_ly(Transdata, x = ~time, y=~value, color = ~geo.time, colors = colours, type = "scatter", mode = "lines")%>%
  layout(title = "Net Financial Transactions of Financial Sector", yaxis = list(title = "Percentage Change"), xaxis = list(title = "Time"))


NPFLplot <- plot_ly(NPFL, x = ~Year, y=~Percentage, color = ~Code, colors = colours, type = "bar")%>%
  layout(barmode = "stack",title = "Nonperforming Loans to Total Gross loans", yaxis = list(title = "Percentage"), xaxis = list(title = "Time"))


#CreditFin <-plot_ly(CreditFromFin, x = ~Year, y=~Percentage, color = ~Code, colors = colours,type = "bar")%>%
  #layout(barmode = "stack",title = "Domestic credit provided by financial sector", yaxis = list(title = "Percentage of GDP"), xaxis = list(title = "Time"))

#Capplot <-plot_ly(CapRatio, x = ~Year, y=~Percentage, color = ~Code, colors = colours,type = "bar")%>%
  #layout(barmode = "stack",title = "Financial Sector Capital to Assets Ratio", yaxis = list(title = "Percentage"), xaxis = list(title = "Time"))

#Liabplot <- streamgraph(Liabdata, key = "geo.time", value = "value", date = "time")%>%
  #sg_axis_x(2)%>%
  #sg_fill_manual(colours) %>%
  #sg_legend(show=TRUE, label="Country: ")
#streamgraph(Transdata, key = "geo.time", value = "value", date = "time", offset = "zero")%>%
  #sg_axis_x(2)%>%
  #sg_fill_manual(colours) %>%
  #sg_legend(show=TRUE, label="Country: ")

Capplot <- streamgraph(CapRatio, key = "Code", value = "Percentage", date = "Year", offset = "zero")%>%
  sg_axis_x(2)%>%
  sg_fill_manual(colours) %>%
  sg_legend(show=TRUE, label="Country: ")

CreditFin <- streamgraph(CreditFromFin, key = "Code", value = "Percentage", date = "Year", offset = "zero")%>%
  sg_axis_x(2)%>%
  sg_fill_manual(colours) %>%
  sg_legend(show=TRUE, label="Country: ")

#####################################################
#Fiscal Crisis
#####################################################

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/Tax.RData"))
load(url("https://www.dropbox.com/s/7j0zhanld5icreo/Tax.RData?dl=1"))
#TaxData <- read.xls("Tax.xls", sheet = "Sheet",check.names = FALSE)

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/SpenData.RData"))
load(url("https://www.dropbox.com/s/op27e28f4d1isl9/SpenData.RData?dl=1"))
#SpenData <- read.xls("BudgetStatistics2016.xls", sheet = "Spending")

#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/DefData.RData"))
load(url("https://www.dropbox.com/s/b7xwd8wuldofn9z/DefData.RData?dl=1"))
#DefData <- read.xls("BudgetStatistics2016.xls", sheet = "Deficit")
#load(url("https://dl.dropboxusercontent.com/u/78100269/Irish%20Crisis/GovDebt.RData"))
load(url("https://www.dropbox.com/s/qegbksmllwfpyc3/GovDebt.RData?dl=1"))
#GovDebt <- read.xls("EuroStatDebt.xls")

GovDebt <- melt(GovDebt, id.vars="Time", value.name = "value", variable.name = "Country")
TaxData <- melt(TaxData,  id.vars = "Type",
                variable.name = "Year", 
                value.name = "value")
DefData <- melt(DefData,  id.vars = "Year",
                variable.name = "Type", 
                value.name = "value")

TaxData$Year <-  as.Date(TaxData$Year, format("%Y-%m-%d"))
SpenData$Year <-  as.Date(SpenData$Year, format("%Y-%m-%d"))
DefData$Year <-  as.Date(DefData$Year, format("%Y-%m-%d"))
GovDebt$Time <-  as.Date(GovDebt$Time, format("%Y-%m-%d"))

TaxData$Year <- year(TaxData$Year)
SpenData$Year <- year(SpenData$Year)
DefData$Year <- year(DefData$Year)
GovDebt$Time <- year(GovDebt$Time)




DaTax <- filter(TaxData, Type != "Total")
Def2 <- filter(DefData, Type != "Total")
Def3 <- filter(DefData, Type == "Total")
y <- list(
  title = "€ in 000s")
y2 <- list(
  title = "€ in Ms")
y3 <- list(
  title = "As a % of GDP")

colours = (col=viridis(10))

colours2 = c("blue","lightskyblue")
colours3 = (col=plasma(10))
colours4 = (col=magma(10))


Taxplot <- plot_ly(DaTax, x = ~Year, y = ~value) %>%
  add_bars(color = DaTax$Type, colors = colours) %>%
  add_lines(x = ~SpenData$Year, y = SpenData$value, name = "Total Government Expenditure", line = list(color = "dodgerblue")) %>%
  layout(title = "Government Spending and Tax Revenue", barmode = "stack", yaxis = y, shapes = list(
    list(type = "rect",
         fillcolor = "grey", line = list(color = "grey"), opacity = 0.3,
         x0 = "2008", x1 = "2010", xref = "x",
         y0 = 0, y1 = 76000000, yref = "y")))

Defplot <- plot_ly(Def2, x = ~Year, y = ~value) %>%
  add_bars(color = Def2$Type ,colors = "Set1")%>%
  add_lines(x = Def3$Year, y = Def3$value, name = "Total", colors = "blue")%>%
  layout(title = "Exchequer Balance", yaxis = y2, shapes = list(
    list(type = "rect",
         fillcolor = "grey", line = list(color = "grey"), opacity = 0.3,
         x0 = "2008", x1 = "2010", xref = "x",
         y0 = -25000, y1 = 10000, yref = "y")))

Debtplot <- plot_ly(GovDebt, x = ~Time, y = ~value)%>%
  add_lines(color = ~Country, colors = c("grey80",'grey60', 'green3', "grey30"))%>%
  layout(title = "Debt to GDP Ratio", yaxis = y3, shapes = list(
    list(type = "rect",
         fillcolor = "grey", line = list(color = "grey"), opacity = 0.3,
         x0 = "2008 ", x1 = "2010", xref = "x",
         y0 = 0, y1 = 120, yref = "y")))

