import calendar

exit = False
while not exit:
    try:
        print("Which day of the week do you want to count?")
        for i in range(1,8):
            print(str(i)+": "+calendar.day_name[i-1])
        print("or 'exit' to quit")
        day = input("Enter day nomber of 'exit':")
        if day == "exit":
            break
        year = input("Enter year:")
        month = input("Enter month:")
            
        dayscount = 0
        for week in calendar.monthcalendar(int(year),int(month)): 
            if week[int(day)-1] != 0:
                dayscount+=1
        print("There are",dayscount,calendar.day_name[int(day)-1],"in",calendar.month_name[int(month)],"in",year)
    except Exception as e:
        print(e)
        print("Sorry, that's not valid input")