install.packages("randomForest")
data("iris")

library(randomForest)
set.seed(123) # set seed for reproducibility

# spliting the data into training and testing sets (7:3 ratio)
sample_indices <- sample(1:nrow(iris), 0.7*nrow(iris))
train_data <- iris[sample_indices, ]
test_data <- iris[-sample_indices, ]

# model creation
rf_model <- randomForest(Species ~., data = train_data, ntree = 500)

# make predictions on the test data
predictions = predict(rf_model,test_data)

accuracy <- sum(predictions == test_data$Species)/nrow(test_data)
cat("Accuracy : ",accuracy,"\n")


"""
# Installing package
install.packages("caTools") # For sampling the dataset
install.packages("randomForest") # For implementing random forest algorithm
# Loading package
library(caTools)
library(randomForest)
# Loading data
data(iris)
# Structure
str(iris)
# Splitting data in train and test data
split <- sample.split(iris, SplitRatio = 0.7)
split
train <- subset(iris, split == "TRUE")
test <- subset(iris, split == "FALSE")
# Fitting Random Forest to the train dataset
set.seed(120) # Setting seed
classifier_RF = randomForest(x = train[-5],
y = train$Species,
ntree = 500)
classifier_RF
# Predicting the Test set results
y_pred = predict(classifier_RF, newdata = test[-5])
# Confusion Matrix
confusion_mtx = table(test[, 5], y_pred)
confusion_mtx
# Plotting model
plot(classifier_RF)
# Importance plot
importance(classifier_RF)
# Variable importance plot
varImpPlot(classifier_RF)
"""
