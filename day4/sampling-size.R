zstar = qnorm(.975)
sd = 9.48 # standard deviation of student height
E = 1.2 # Margin of error in cm at 95% confidence level
sample.size = zstar^2 * sd^2/E^2
print(sample.size)
