import os
from os import path

#os.mkdir("./Result")
resultfile = open("./Result/result","w+")
dircomtents = sorted(os.listdir("."))
totalbytecount = 0
resultfile.write("File list:\n")
resultfile.write("____________________\n")

for n, item in enumerate(dircomtents):
    if path.isfile(item):
        #print(item)
        resultfile.write(item+"\n")
        totalbytecount = totalbytecount + os.path.getsize(item)
resultfile.write("Total bytecount:"+str(totalbytecount))
resultfile.close()