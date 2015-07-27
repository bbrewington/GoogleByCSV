# GoogleByCSV: takes a 1-column csv file containing a list of items and creates a new csv file with 
# a column containing google search strings

# Set name of csv file: replace the text in quotes with actual csv file name
  one_column_csv_file <- "example.csv"

# csv filename integrity check
  if (!(one_column_csv_file %in% list.files())){
    stop("csv file not found in working directory")
  }

# Read in csv data file
  csv_data <- read.csv(one_column_csv_file)

# Check for number of columns in csv file (must be 1)
  if (length(csv_data[1,]) != 1) {
    stop("csv needs to be one column")
  }

# Create vector of google search paths
  google_path_full <- paste(rep("https://www.google.com/search?q=", times = length(csv_data)), 
                            gsub("\\s", "%20", csv_data[,1]), sep="")

# Combine csv 1st column & google search path vector into data frame
  df <- data.frame(csv_data[,1],google_path_full)

# Write df to new csv file
  write.csv(data.frame("column1" = csv_data[,1], "google.search.path" = google_path_full), 
          "GoogleByCSV_output.csv", row.names=FALSE)

# Clean up R environment
  rm(list=ls())