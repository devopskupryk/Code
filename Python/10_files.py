
def main():  
    # Open a file for writing and create it if it doesn't exist
    #myfile = open("/home/sergey/DevOps/Code/Python/textfile","w+")
    
    # Open the file for appending text to the end
    myfile = open("/home/sergey/DevOps/Code/Python/textfile","a+")

    # write some lines of data to the file
    for i in range(10):
        myfile.write(str(i)+"Line\n")
    
    # close the file when done
    myfile.close()
    
    # Open the file back up and read the contents
    myfile = open("/home/sergey/DevOps/Code/Python/textfile","r")
    if myfile.mode == 'r':
        # contents = myfile.read()
        # print(contents)
        fl = myfile.readlines()
        for i in fl:
            print(i)

if __name__ == "__main__":
    main()
