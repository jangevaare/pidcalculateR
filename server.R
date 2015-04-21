library(shiny)

shinyServer(function(input, output){
output$plot = renderPlot({
	tempdata=data.frame(temp=c(input$temp1, input$temp1, input$temp2), time=c(0, input$deadtime, input$time))
	kp = (input$temp2-input$temp1)/(input$duty2-input$duty1)
	op = input$deadtime
	tp = (input$time-input$deadtime)*0.63
	
	if(input$action == 3){tc = max(c(0.1*tp, 0.8*op))}
	if(input$action == 2){tc = max(c(0.01*tp, 0.08*op))}
	if(input$action == 1){tc = max(c(0.001*tp, 0.008*op))}
		
	plot(x=tempdata$time, y=tempdata$temp, type='l', xlab="Time (seconds)", ylab="Temperature", lwd=0)
		lines(x=c(0, input$deadtime), y=c(input$temp1, input$temp1), col='brown', lwd=4)
	lines(x=c(input$deadtime, input$deadtime+tp), y=c(input$temp1, input$temp1+(input$temp2-input$temp1)*0.63), col='orange', lwd=4)
	lines(x=tempdata$time, y=tempdata$temp, col='black', lwd=4, lty=3)
	text(0, input$temp1+(0.75*(input$temp2-input$temp1)), pos=4, paste("P=", round((1/kp)*(tp + (op/2))/(tc + (op/2)),2), ", I=", round(tp + (op/2),2), ", D=", round((tp*op)/(2*tp+op),2), sep=""))
	legend("bottomright", col=c("brown", "orange"), lwd=4, legend=c("Deadtime", "Process time constant"))})
})