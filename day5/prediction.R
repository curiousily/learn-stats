data(airquality)
na.omit(airquality) -> airquality # remove cases with missing values
model <- lm(Ozone ~ Solar.R + Wind + Temp + Month, data=airquality)
print(predict(model, list(Solar.R=200, Wind=11, Temp=80, Month=6), level=0.95, interval="pred"))
