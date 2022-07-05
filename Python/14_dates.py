from cgi import print_form
from datetime import date
from datetime import time
from datetime import datetime

def main():
    ## DATE OBJECTS
    # TODO: Get today's date from the simple today() method from the date class
    print("Today date is:",date.today())

    # TODO: print out the date's individual components
    print("Today components:", date.today().day, date.today().month, date.today().year)
    
    # TODO: retrieve today's weekday (0=Monday, 6=Sunday)
    print("Today's weekday # is:", date.today().weekday())
    days = ["mon","tue","wed","thur","fri","sut","sun"]
    print("which is a", days[date.today().weekday()]) 

    ## DATETIME OBJECTS
    # TODO: Get today's date from the datetime class
    print("Current date and time are", datetime.now())
    
    # TODO: Get the current time
    print("Current time is", datetime.time(datetime.now()))
 

  
if __name__ == "__main__":
    main()
  