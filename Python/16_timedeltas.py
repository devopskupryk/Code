
from datetime import date
from datetime import time
from datetime import datetime
from datetime import timedelta

# TODO: construct a basic timedelta and print it
print(timedelta(days=365, hours=3, minutes=5, seconds= 10))

# TODO: print today's date
now = datetime.now()
print("Today is", now)
print("One year from now it will be", str(now+timedelta(days=365)))

# TODO: print today's date one year from now
print("In to weeks and tree days it will be", str(now+timedelta(weeks=2, days=3)))

# TODO: create a timedelta that uses more than one argument
t = datetime.now() - timedelta(weeks=1)
s = t.strftime("%A %B %d, %Y")
print("One week ago it was",s) 

# TODO: calculate the date 1 week ago, formatted as a string
today = date.today()
afd = date(today.year, 4, 1)

### How many days until April Fools' Day?
if afd < today:
    print("April Fools' Day already went by:", ((today-afd).days))
    afd = afd.replace(year=today.year+1)

# TODO: use date comparison to see if April Fool's has already gone for this year
# if it has, use the replace() function to get the date for next year
print("It is", (afd-today).days,"days until next AFD")

# TODO: Now calculate the amount of time until April Fool's Day  

