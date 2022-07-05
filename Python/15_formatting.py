
from datetime import datetime

def main():
    # Times and dates can be formatted using a set of predefined string
    # control codes 
    now = datetime.now()

    #### Date Formatting ####
    # %y/%Y - Year, %a/%A - weekday, %b/%B - month, %d - day of month
    print(now.strftime("The current year is: %Y"))
    print(now.strftime("%a,%d %B,%y"))

    # %c - locale's date and time, %x - locale's date, %X - locale's time
    print(now.strftime("Local date and time are %c"))
    print(now.strftime("Local date is %x"))
    print(now.strftime("Local time is %X"))

    #### Time Formatting ####
    # %I/%H - 12/24 Hour, %M - minute, %S - second, %p - locale's AM/PM
    print(now.strftime("Current time is %I:%M:%S %p"))
    print(now.strftime("24-hour time is %H:%M"))

if __name__ == "__main__":
    main()
