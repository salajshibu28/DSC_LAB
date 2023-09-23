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