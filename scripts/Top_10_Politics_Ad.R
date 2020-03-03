library(dplyr)
library(ggplot2)
# This shows the top 10 political ads on facebook.
# This has a strong correlation to have much actualy money was spent
# on advertising. (More money spent = higher chance of getting collected)
# Donald Trump was only the 10th in the number of ads collected. 
# On the other hand, Beto O'Rourke (democratic) is the first among politicians

Top_10_Politics_Ad <- function(df) {
  top10 <- df%>%group_by(title) %>% summarize(count = n()) %>% arrange(-count) %>% slice(1:10)
  ggplot(data=top10, aes(x=reorder(title, -count), y=count)) +
    geom_bar(width = 0.5, stat = "identity")  +
    ggtitle("Top 10 Political Advertisment on Facebook") +
    xlab("Figure") + ylab("Count of Ads") +  theme(legend.position = "topright") + theme_classic() +
    theme(axis.text.x = element_text(angle = 60, hjust = 1))
}
