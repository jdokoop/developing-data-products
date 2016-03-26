#----------------------------------------------------------------
# Function to estimate number of Internet users (per 100 people)
# using linear models based on World Bank data
#----------------------------------------------------------------
predictUsers <- function(){
  
  #Load data frame from CSV file and select only complete cases
  df <- read.csv("internet_users.csv", na.strings = "..")
  df <- na.omit(df)

  #List with years for availble measurements from 2000-2012
  years <- c(2000:2012)
  
  #Fit a linear model to each row of the data frame
  #Model is users ~ year
  linear.models <- apply(df, 1, function(x) lm(as.numeric(x[3:15]) ~ years))
  
  #Fit an exponential model to each row of the data frame
  #Model is log(users) ~ year
  exp.models <- apply(df, 1, function(x) lm(log(as.numeric(x[3:15])+1E6) ~ years))
  
  #Evaluate linear models for some year
  futureYear = 2018
  futureUsers <- sapply(linear.models, function(x) predict(x, newdata=data.frame(years=c(futureYear))))

  #Add predictions to original data frame
  df <- cbind(df,futureUsers)
  
  #Account for countries that go over 100% in future users
  df$futureUsers <- replace(df$futureUsers, df$futureUsers > 100, 100)
  head(df)
}