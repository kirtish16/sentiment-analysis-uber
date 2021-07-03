data <- read.csv("Uber_Category_500.csv",stringsAsFactors = TRUE )

#Splitting the dataset
library("caret")
intrain <- createDataPartition(y= data$Category,p=0.75,list = FALSE) 
training <-  data[intrain,]
testing <- data[-intrain,]
testing_category <- testing$Category
testing <- subset(testing,select = -Category)

#Plotting
plot(training$X,training$Tweets,col=training$Category,xlab = "X",ylab = "Tweets")

#Linear SVM
library("e1071")
svmfit <- svm( Category ~ .,data=training,kernel="linear",cost=10,scale = FALSE,type = "C")
cat("\n\nSummary of svm model with kernel as linear:")
summary(svmfit)
test_pred <- predict(svmfit,testing)

t<-table(actual = testing_category,predicted = test_pred)

cat("\nConfusion Matrix:\n")
print(t)
acc<-sum(diag(t))/sum(t)
sensitivity <- t[2,2]/sum(t[2,])
specificity <- t[1,1]/sum(t[1,])
precision <- t[2,2]/sum(t[,2])

cat("\n1. Accuracy of the model : ",acc)
cat("\n2. Sensitivity of the model : ",sensitivity)
cat("\n3. Specificity of the model : ",specificity)
cat("\n4. Precision of the model : ",precision)

#Radial SVM
radialsvm <- svm(Category~.,data=training,kernel="radial",cost=0.5,scale = FALSE)

cat("\n\nSummary of svm model with kernel as radial:\n")
summary(radialsvm)
test_pred <- predict(radialsvm,testing)
t<-table(actual = testing_category,predicted = test_pred)

cat("\nConfusion Matrix:\n")
print(t)
acc<-sum(diag(t))/sum(t)
sensitivity <- t[2,2]/sum(t[2,])
specificity <- t[1,1]/sum(t[1,])
precision <- t[2,2]/sum(t[,2])

cat("\n1. Accuracy of the model : ",acc)
cat("\n2. Sensitivity of the model : ",sensitivity)
cat("\n3. Specificity of the model : ",specificity)
cat("\n4. Precision of the model : ",precision)

#Navie Bayers
x <- training[,-3]
y<- training$Category

library("klaR")
nb <- train(x,y,'nb',trControl=trainControl(method='cv',number=10))

test_pred <- predict(nb,newdata = testing )
t<-table(actual = testing_category,predicted = test_pred)

cat("\nConfusion Matrix:\n")
print(t)
acc<-sum(diag(t))/sum(t)
sensitivity <- t[2,2]/sum(t[2,])
specificity <- t[1,1]/sum(t[1,])
precision <- t[2,2]/sum(t[,2])

cat("\n1. Accuracy of the model : ",acc)
cat("\n2. Sensitivity of the model : ",sensitivity)
cat("\n3. Specificity of the model : ",specificity)
cat("\n4. Precision of the model : ",precision)

