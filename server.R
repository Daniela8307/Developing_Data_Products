library(shiny)
shinyServer(function(input, output) {
    
    output$out1 <- renderText(input$box1) 
    model<-reactive({
        X<-input$numeric1
        Y<-input$numeric2
        if(input$opc=="Add")
            multi<-X+Y
        else if(input$opc=="Substract")
            multi<-X-Y
        else if(input$opc=="Divide")
            multi<-X/Y
        else multi<-X*Y
    })
    
    output$multi<-renderText({paste("Answer: ",model())})
    
    model2<-reactive({
    s<-input$numeric1+input$numeric2
    r<-input$numeric1-input$numeric2
    m<-input$numeric1*input$numeric2
    d<-input$numeric1/input$numeric2
    d<-data.frame("Order"=c("1","2","3","4"),"Operation"=c("Add","Substract","Multiply","Divide"), "Outcome"=c(s,r,m,d))
    })
    
    output$table1<-renderTable(model2())
    
    output$plot1 <- renderPlot({
      plot(x=model2()$Order,y=model2()$Outcome, xlab=c("Order"),ylab=c("Outcome"),main="An example", col=c("red"))
    })#,legend(x = "topright", legend = c("1.Add","2.Substract", "3.Multiply","4.Divide"),title = "Operation")
        #ggplot(model2(),
         #     aes(x = model2$index, y = model2$opera) + 
          #       geom_point())
        
    })
    

