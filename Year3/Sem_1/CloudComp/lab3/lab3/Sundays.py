#Library which contains date and time info =
import datetime

num_of_days = 0
#Loop through years 1901 - 2000 (numbers in range)
#will be added onto 1900 for each iteration
for year in range(1,101):

    #Loop through months 1 - 12 (Jan - Feb)
    for month in range(1,13):

        #Current date to be checked
        date = datetime.date(1900+year, month, 1)

        #Check if the date is a Sunday
        #Increment if it is
        if (date.weekday() == 6):  # 6 is sunday
            num_of_days += 1

#Print answer
print("Number of Sundays :", num_of_days)
