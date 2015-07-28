# GoogleByCSV: takes a 1-column csv file containing a list of items and creates a new csv file with 
# a column containing google search strings

# Set name of csv file: replace the text in quotes with actual csv file name
#  one_column_csv_file <- "example.csv"

GoogleByCSV <- function(csv_filename = "", website = ""){
  
  ## Assign variable website_string ----
    # [website] error check: not character vector
    if (!is.character(website)){
      stop("value of variable website must be character")
    }  
    
    # [website] is not ""
    if (website != ""){
      website_string <- paste("%20site%3A", website, sep="")
    }
    
    # [website] is "" (this is the default)
    else if (website == ""){
      website_string <- ""
    }

  ## Read in csv_filename ----
    # csv filename integrity check against working directory
    if (!(csv_filename %in% list.files())){
      stop("csv file not found in working directory")
    }
    
    # Read in csv data file
    csv_data <- read.csv(csv_filename)
   
    # Check for number of columns in csv file (must be 1)
    if (length(csv_data[1,]) != 1) {
      stop("csv needs to be one column")
    }
  
  # Create vector of google search paths
  google_path_full <- paste(rep(paste("https://www.google.com/search?q=",website_string,sep=""),
                               times = length(csv_data)), 
                            gsub("\\s", "%20", csv_data[,1]), sep="")
  
  # Combine csv 1st column & google search path vector into data frame
  df <- data.frame(csv_data[,1],google_path_full)
  
  # Write df to new csv file
  write.csv(data.frame("column1" = csv_data[,1], "google.search.path" = google_path_full), 
            "GoogleByCSV_output.csv", row.names=FALSE)
}