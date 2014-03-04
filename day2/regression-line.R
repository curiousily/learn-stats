duration = faithful$eruptions
waiting = faithful$waiting
plot(duration, waiting, 
     xlab="Eruption durations", ylab="Waiting period", pch=20)
abline(lm(waiting~duration), col="red")
