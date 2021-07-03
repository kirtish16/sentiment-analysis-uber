data <- read.csv("Uber_500.csv",stringsAsFactors = TRUE)
data <- data.frame(data)

#Text Cleaning

data_text <- data$Text
data_text <- tolower(data_text)
data_text <- gsub("rt", "", data_text)
data_text <- gsub("@\\w+", "", data_text)
data_text <- gsub("[[:punct:]]", "", data_text)
data_text <- gsub("[[:digit:]]", "", data_text)
data_text <- gsub("http\\w+", "", data_text)
data_text <- gsub("[ |\t]{2,}", "", data_text)
data_text <- gsub("^ ", "", data_text)
data_text <- gsub(" $", "", data_text)

#generate wordcloud

library("wordcloud")
wordcloud(data_text,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 500)

library('syuzhet')
mysentiment_data <-get_nrc_sentiment((data_text))
Sentimentscores_data<-data.frame(colSums(mysentiment_data[,]))

names(Sentimentscores_data)<-"Score"
Sentimentscores_data<-cbind("sentiment"=rownames(Sentimentscores_data),Sentimentscores_data)
rownames(Sentimentscores_data)<-NULL

library('ggplot2')
p <- ggplot(data=Sentimentscores_data,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+theme(legend.position="none")+xlab("Sentiments")+ylab("scores")+ggtitle("Sentiments of people behind the tweets on UBER")
p

sents.value <- get_sentiment(data_text)
most.positive <- data_text[sents.value==max(sents.value)]
cat("\n\nMost positive tweets: ",most.positive)

most.negative <- data_text[sents.value<=min(sents.value)]
most.negative
cat("\n\nMost negative tweets: ",most.negative)

sents.value

category_sent <- ifelse(sents.value>0,"Positive","Negative")

total_positive <- sum(category_sent == "Positive")
total_negative <- sum(category_sent == "Negative")
total <- total_negative + total_positive

pie(c(total_positive,total_negative),c(round(total_positive * 100 / total), round(total_negative * 100 / total)),main = "Tweet Sentiment Pie Chart(in %)",col = c("indianred1", "green"))
legend("topright", legend = c("Positive", "Negative"),fill =  c("indianred1", "green"),cex = 0.7)

df <- data.frame(Tweets=data_text,Category=category_sent)

write.csv(df,"Uber_Category_500.csv")
