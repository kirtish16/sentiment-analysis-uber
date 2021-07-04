# Twitter Sentiment Analysis on Uber tweets

## About

### Sentiment analysis

Twitter Sentiment analysis is used to find the sentiments or emotions of people behind the tweet. A review of a person/customer is analyzed via the tweets which helps the companies to further understand what review does a customer has about the product or service provided by the company.

Research has done on the sentiment analysis for 500 tweets, after extracting them the tweets had to be cleaned for stop words, hyper-links, white spaces. Sentiment Analysis involves the usage of natural language processing, text analysis to classify a piece of text as positive (>0), negative (< 0).

### Working

First, we are extracting the tweets from data set. A tweet comprises of many things. In a tweet there are username of twitter user, ‘RT’ which means that it is a replied tweet, punctuation, digits, hash tags. Hence for sentiment analysis of tweet, we need to remove this from the tweets. 

Package 'gsubfn' is used for this data cleaning. After this we are using word cloud for visualizing the frequency of words in tweets. 

Now we are using 'syuzhet' package for getting the sentiment analysis and score of sentiment of tweets. According to the sentiment score, we print the most positive and most negative tweet from all the tweets. Further we are bifurcating the tweets in positive if score is greater than zero and negative otherwise. 

Now for checking the accuracy of this sentiment analysis we are using the classification algorithm Support Vector Machine and Naïve Bayes. 

## Libraries used:
1. Gsubfn
2. Wordcloud
3. Syuzhet
4. Ggplot2
5. Caret
6. E1071
7. Klar

## Results

![image](https://user-images.githubusercontent.com/55601319/124365376-3d1c3b00-dc65-11eb-97b1-8a08751e2db8.png)

Word Cloud is a visual representation of text data in the form of tags, which are typically single words whose importance is visualized by way of their size and color. From this word cloud, we can interpret that the word with biggest size is ‘please’, hence it is most used word in all tweets. From this we can conclude that most frequent words used are ‘please’, ‘via’, ‘section’.

![image](https://user-images.githubusercontent.com/55601319/124365386-4efdde00-dc65-11eb-93ad-af8f84cf9afb.png)

Here we see a bar chart of sentiment vs scores of all tweets. Scores depict number of words in tweets which depict their corresponding sentiment categories. We can see from this figure that highest number of words belong to the positive category. The lowest number of words belong to the disgust category. 

![image](https://user-images.githubusercontent.com/55601319/124365391-53c29200-dc65-11eb-8613-f4d5a23945f3.png)

From this pie chart, we can say that about 85 % of tweets are positive and 15 % of the tweets are negative which means there is high chance that a tweet is positive.

![image](https://user-images.githubusercontent.com/55601319/124365393-591fdc80-dc65-11eb-94f6-b33756cfad77.png)

Here is the scatter plot between the tweets and the ID of tweets. We can say that the variables are not highly correlated.

SVM Linear:

![image](https://user-images.githubusercontent.com/55601319/124365398-5cb36380-dc65-11eb-8361-7d5f5eeaf96f.png)

SVM Radial:

![image](https://user-images.githubusercontent.com/55601319/124365399-5fae5400-dc65-11eb-8cba-e2892ca24599.png)

Naïve Bayes:

![image](https://user-images.githubusercontent.com/55601319/124365404-6341db00-dc65-11eb-8335-4775b22cb1fe.png)

## Conclusions 

Hence, we can see that using a simple function we were able to classify tweets into various categories in a few minutes and without having to go through the tweets manually which might have been a time-consuming job. Then we have used data visualization techniques such as bar chart, pie chart and scatter plot.
- A data set of 499 tweets is used. Out of this 499, 425 tweets were found to be positive and 74 tweets were found to be negative.
- Using Support Vector Machine algorithm and kernel as Linear, the accuracy obtained was 87.24 %.
- Using Support Vector Machine algorithm and kernel as Radial, the accuracy obtained was 85.23 %.
- Using Naïve Bayes algorithm, the accuracy obtained was 87.24 %.



## License
[MIT](https://choosealicense.com/licenses/mit/)
