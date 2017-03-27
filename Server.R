shinyServer(function(input, output) {
  output$IntPlot2 <- renderPlotly({
    "Intplot2" <- IntPlot2
    IntPlot2
  })
  
  output$CreditPlot2 <- renderPlotly({
    "CreditPlot2" <- CreditPlot2
    CreditPlot2
  })
  
  output$HPPlot2 <- renderPlotly({
    "HPPlot2" <- HPPlot2
    HPPlot2
  })
  
  output$ConPlot2 <- renderPlotly({
    "ConPlot2" <- ConPlot2
    ConPlot2
  })
  
  output$Liabplot <- renderPlotly({
    "Liabplot" <- Liabplot
    Liabplot
  })
  
  output$Transplot <- renderPlotly({
    "Transplot" <- Transplot
    Transplot
  })
  
  output$CreditFin <- renderStreamgraph({
    "CreditFin" <- CreditFin
    CreditFin
  })
  
  output$NPFLplot <- renderPlotly({
    "NPFLplot" <- NPFLplot
    NPFLplot
  })

  output$Capplot <- renderStreamgraph({
    "Capplot" <- Capplot
    Capplot
  })
  output$Taxplot <- renderPlotly({
    "Taxplot" = Taxplot
  })
  
  output$Debtplot <- renderPlotly({
    "Debtplot" = Debtplot
  })
  
  output$Defplot <- renderPlotly({
    "Defplot" = Defplot
  })
  
  
}) 