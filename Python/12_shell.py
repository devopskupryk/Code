
import os
from os import path
import shutil
from shutil import make_archive
from zipfile import ZipFile

def main():
    # make a duplicate of an existing file
    if path.exists("textfile.bak"):
        # get the path to the file in the current directory
        src = path.realpath("textfile")

        # let's make a backup copy by appending "bak" to the name
        # dst = src + ".bak"
        # shutil.copy(src, dst)

        # rename the original file
        #os.rename(src, "./Python/newtextfile")
        
        # now put things into a ZIP archive
        parentdir, tail = path.split(src)
        shutil.make_archive("archive","zip",parentdir)

        # more fine-grained control over ZIP files
        with ZipFile("test.zip","w") as newzip:
            newzip.write("textfile.bak")
            newzip.write("newtextfile")
      
if __name__ == "__main__":
    main()
