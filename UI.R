shinyUI(dashboardPage(
  dashboardHeader(title = "Ireland's Financial Crisis",titleWidth = "100%"),
  dashboardSidebar(
    sidebarMenu(id="menu1",
                menuItem("Introduction", tabName = "Introduction", icon = icon("dashboard")),
                menuItem("Property Bubble", icon = icon("th"), tabName = "PropertyBubble",badgeColor = "green"),
                menuItem("Financial Crisis", icon = icon("th"), tabName = "FinancialCrisis", badgeColor = "green"),
                menuItem("Fiscal Crisis", icon = icon("th"), tabName = "FiscalCrisis", badgeColor = "green")
                
    )
  ),
  dashboardBody(
    fluidPage(
      tabItems(
        tabItem(tabName = "Introduction",
                h2("Introduction",style = "font-family: 'times'; font-si16pt"),
                p("This dashboard is designed to supplement my Final Year Project 'Visualising the Irish Economic Crisis and Recovery.' This dashboard displays the Property Bubble, the Financial Crisis and the Fiscal Crisis. Through the use of a dashboard, more information is displayed to the user from which they can formulate their own conclusions. While not only visualising the data, the dashboard is also interactive allowing the user to manipulate both X and Y axes and to filter the contents of each chart. This was created using R and more specifically the Shiny and Plotly packages. The aim of this dashboard is display the volatility of the Irish economy before, during and after the great recession",style = "font-family: 'times'; font-si16pt"),
                br(),
                h4("Property Bubble",style = "font-family: 'times'; font-si16pt"),
                p("Ireland's property bubble was exceptionally volatile in comparison to nearly every other country in the EU. This can seen in the dashboard as house prices and construction output were considerably higher than the EU average leading up to the crisis. When the property bubble inevitably crashed, the private sector was left heavily indebted, this then led to massive loan defaults and a sharp increase in non-performing loans.",style = "font-family: 'times'; font-si16pt"),
                br(),
                h4("Financial Crisis",style = "font-family: 'times'; font-si16pt"),
                p("After the property bubble, Ireland's financial sector was in disarray as many of the banks were involved in the property sector. Ireland had substantially high financial liabilities in comparison to every other EU country and when the financial markets crashed, the financial sector came close to insolvency. As a result, recapitalisation and bailouts were required. The volatility in the financial sector is seen in the dashboard.",style = "font-family: 'times'; font-si16pt"),
                br(),
                h4("Fiscal Crisis",style = "font-family: 'times'; font-si16pt"),
                p("Ireland's government was poorly positioned for the financial crisis, as the the government depended heavily on cyclical revenue sources while also increasing expenditure in the process. This can be seen in the dashboard as income tax contributes more to revenue today than in 2006. When the crash occured, Ireland needed to take harsh austerity measures to reduce its government deficits and public debt, as seen in the charts. Ireland's fisal volatility exacerbated the effects of the great recession.",style = "font-family: 'times'; font-si16pt"),
                br()
        ),
        
        tabItem(tabName = "PropertyBubble",
                titlePanel("The Property Bubble"), 
                fluidRow(box(plotlyOutput("IntPlot2")),box(plotlyOutput("CreditPlot2"))),
                fluidRow(box(plotlyOutput("HPPlot2")),box(plotlyOutput("ConPlot2")))),
        tabItem(tabName = "FinancialCrisis",
                titlePanel("The Financial Sector Crisis"), 
                fluidRow(box(plotlyOutput("Liabplot"), width = "100%")),
                fluidRow(box(plotlyOutput("Transplot")),box(plotlyOutput("NPFLplot"))), fluidRow(box(title = 'Domestic Credit Provided by the Financial Sector as a % of GDP',streamgraphOutput("CreditFin")), box(title = "Financial Sector Capital to Assets Ratio",streamgraphOutput("Capplot")))),
        tabItem(tabName = "FiscalCrisis",
                titlePanel("The Fiscal Crisis"), 
                fluidRow(box(plotlyOutput("Taxplot"), width = "100%")),
                
                fluidRow(box(plotlyOutput("Defplot")),
                         box(plotlyOutput("Debtplot"))))
      )
    )
  )
  
  
))


