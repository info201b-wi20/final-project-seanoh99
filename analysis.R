df <- read.csv("fbpac-ads-en-US.csv")
observations <- nrow(df)
write.csv(sample(df, 10000), "sampled-facebook-ads.csv")A