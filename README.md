# GoogleByCSV README
Function that reads a one-column csv file of search terms, and outputs a csv file containing 2 columns: search terms, and google search query hyperlink.

## How to Use
**Language: R**

1. Load these files into your working directory
    * GoogleByCSV.R script
    * 1-column CSV file (included "example.csv" in this repo)
2. Call GoogleByCSV function (arguments shown in bullets below)
    * **csv_filename**: character string of 1-column CSV file
    * _optional_ **website**: character string of the site you'd like to append to the search query (via Google method "site:")
    * _optional_ **header**: boolean showing whether the 1-character CSV file has a header or not

## Use Cases
* General case: The user needs to manually search through a list of search terms
* My use case: I created this to aid in my job search in mid-2015.  I copy+pasted a list of company names from [Atlanta Journal Constitution's "Top Workplaces"](http://www.ajc.com/s/business/topworkplaces/#top-stories) into a CSV file, and ran the GoogleByCSV function to create the new CSV file, and used the new google search hyperlink column to get information on the companies, and added it to the CSV.
