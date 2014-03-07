#partial correlation coefficient
### From formulas in Sheskin, 3e
### a,b=variables to be correlated, c=variable to be partialled out of both
pcor = function(a,b,c)
{
         (cor(a,b)-cor(a,c)*cor(b,c))/sqrt((1-cor(a,c)^2)*(1-cor(b,c)^2))
}
### end of script
states = as.data.frame(state.x77)
colnames(states)[4] = "Life.Exp" # Life.Exp - response var
colnames(states)[6] = "HS.Grad"
states[, 9] = states$Population * 1000 / states$Area
colnames(states)[9] = "Density"
linear.model = lm(Life.Exp ~ Population + Income + Illiteracy + Murder +
                  HS.Grad + Frost + Area + Density, data=states)
summary(linear.model)
summary.aov(linear.model)
linear.model2 = update(linear.model, .~.-Area) # Remove Area because it is tvalue is smallest with large p value (above 5%)
summary(linear.model2)
anova(linear.model, linear.model2) # compare the two models
linear.model3 = update(linear.model2, .~.-Illiteracy) # Remove Illiteracy
summary(linear.model3)
linear.model4 = update(linear.model3, .~.-Income) # Remove Income
summary(linear.model4)
linear.model5 = update(linear.model4, .~.-Density)
linear.model6 = update(linear.model5, .~.-Population)

# or use this
# step(linear.model, direction="backward")

# confint(linear.model6) # Use for confidence limits on the estimated coefficients

prediction = predict(linear.model6, list(Murder=10, HS.Grad=40, Frost=30))
print(sort(linear.model6$resid))


