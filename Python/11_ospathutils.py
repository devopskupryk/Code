
import os
from os import path
import datetime
from datetime import date, time, timedelta
import time


def main():
    # Print the name of the OS
    print(os.name)
    
    # Check for item existence and type
    print("Item exists:", path.exists("/home/sergey/DevOps/Code/Python/textfile"))
    print("Item is a file:", path.isfile("/home/sergey/DevOps/Code/Python/textfile"))
    print("Item is a dir:", path.isdir("/home/sergey/DevOps/Code/Python/textfile"))
    
    # Work with file paths
    print("Item's path:", path.realpath("./Python/textfile"))
    print("Item's path and name:", path.split(path.realpath("./Python/textfile")))

    # Get the modification time
    t = time.ctime(path.getmtime("./Python/textfile"))
    print(t)
    print(datetime.datetime.fromtimestamp(path.getmtime("./Python/textfile")))
    
    # Calculate how long ago the item was modified
    td = datetime.datetime.now() - datetime.datetime.fromtimestamp(path.getmtime("./Python/textfile"))
    print("It has been",td,"since file was modified")
    print("or,",td.total_seconds(), "seconds")
  
if __name__ == "__main__":
    main()
