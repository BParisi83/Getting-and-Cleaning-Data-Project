# Getting-and-Cleaning-Data-Project
This is the course project for the Getting and Cleaning Data Coursera course.
The script is written in R and does the following

1. Loads the tidyverse library
2. Sets the working directory to where the data has been stored
3. Reads the 6 txt files as tables
4. Reads the features and activities labels as tables
5. Applies the features and activies as appropriate to the tables
6. Merges the data from the 6 txt files into a single data frame
7. Pulls only the required means and standard deviations from the fully merge data
8. Groups the data by the Activity Column
9. Uses the summarize function to find the mean of each of the columns
10. Writes the resulting data as a txt file named "Cleaned.txt" into the workding director
