shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    bd_x_pais(nacion = input$pais, lin = input$tamlinea, 
              ejx = input$rangex, ejy = input$rangey)
  })
  
  output$disparidad <- renderPlot({
    disparidad(nacion= input$pais2, lin=input$tamlinea2,
               ejx=input$rangex2, ejy=input$rangey2)
  })
  
  output$independent <- renderUI({
    checkboxGroupInput("independent", 
                       "Independent variable:",
                       names(bdu3)[-c(1:5,19:20)],
                       selected = c("gender"))
  })
  
  bd <- reactive({
    if(input$pais3=="a_nivel_mundial"){
      bd <- bdu3
    }else{
      bd <- bdu3[bdu3$country==input$pais3,]
    }
  })
  
  runRegression <- reactive({
    
    if(input$interaccion==FALSE){
      glm(as.formula(paste(input$dependent, "~", paste(input$independent, collapse = "+"))),
          data = bd(),
          family = "binomial")
    }else{
      glm(as.formula(paste(input$dependent," ~ ",
                           paste(paste(input$independent,
                                       rep("*gender",length(input$independent)),
                                       sep = ""),
                                 collapse="+"))),
          data=bd(),
          family = "binomial")
    }
  })
  
  output$Resumen3 <- renderPrint({
    summary(runRegression())
  })
  
  #Grafico multivariado
  bd_graf_multi <- reactive({
    if(input$pais4=="a_nivel_mundial"){
      bd_graf_multi <- bdu3
    }else{
      bd_graf_multi <- bdu3[bdu3$country==input$pais4,]
    }
  })
  
  output$independent2 <- renderUI({
    checkboxGroupInput("independent2", 
                       "Independent variable:",
                       names(bdu3)[-c(1:5,19:20)],
                       selected = c("gender"))
  })
  
  output$grafico_multivariado <- renderPlot({
    
    if(length(input$independent2)==1){
      g1 <- ggplot(bd_graf_multi(), aes_string(x=input$independent2[1], fill=input$independent2[1])) +
        geom_bar(stat = "count") + facet_wrap(as.formula(paste("~",input$dependent2)),ncol = input$col) + 
        geom_text(stat="count",aes(label=..count..)) +
        theme_bw() +
        theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5))
      print(g1)
    }else{
      if(length(input$independent2)>1){
        g1 <- ggplot(bd_graf_multi(), aes_string(x=input$independent2[1], fill=input$independent2[1])) +
          geom_bar(stat = "count") + 
          facet_wrap(as.formula(paste("~",input$dependent2,"*",paste(input$independent2[-1], collapse = "*"))),ncol = input$col) +
          geom_text(stat="count",aes(label=..count..)) + 
          theme_bw() +
          theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5))
        print(g1)
      }
    }
    
  })
  
  #output$grafico_multivariado <- renderGvis({
  #f <-gvisColumnChart(bd(),input$independent,"age")
  #plot(f)
  #})
  
})