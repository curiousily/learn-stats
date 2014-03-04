duration = faithful$eruptions
waiting = faithful$waiting
correlation = cor(duration, waiting)
print(correlation)
