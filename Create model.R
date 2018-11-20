# create model
library(readr)
library(dplyr)
setwd("E:/api/version1")
titanic_data <- read_csv("train.csv")

transform_titantic_data <- function(input_titantic_data) {
  ouput_titantic_data <- data.frame(
    survived = factor(input_titantic_data$Survived, levels = c(0, 1)),
    pclass = factor(input_titantic_data$Pclass, levels = c(1, 2, 3)),
    female = tolower(input_titantic_data$Sex) == "female",
    age = factor(dplyr::if_else(input_titantic_data$Age < 18, "child", "adult", "unknown"), 
                 levels = c("child", "adult", "unknown"))
  )
}

clean_titanic <- transform_titantic_data(titanic_data)

set.seed(42)
training_rows <- sample(1:nrow(clean_titanic), size = floor(0.7*nrow(clean_titanic)))
train_df <- clean_titanic[training_rows, ]
test_df <- clean_titanic[-training_rows, ]

titanic_glm <- glm(survived ~ pclass + female + age, 
                   data = clean_titanic, family = binomial(link = "logit"))
test_predictions <- predict(titanic_glm, newdata = test_df, type = "response") >= 0.5
test_actuals <- test_df$survived == 1
accuracy <- table(test_predictions, test_actuals)
print(accuracy)
print(paste0("Accuracy: ", round(100 * sum(diag(accuracy))/sum(accuracy), 2), "%"))

saveRDS(titanic_glm, file = "model.Rds", compress = TRUE)
model <- titanic_glm
save(model, file = "C:/Users/thanhnm3/Desktop/api/model.Rdata")
