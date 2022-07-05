
from curses.ascii import isspace
from html.parser import HTMLParser
from operator import length_hint

paragraphs = 0

class MyHTMLParser(HTMLParser):
    def handle_comment(self, data):
        print("Encountered a comments:", data)
        pos = self.getpos()
        print("At line",pos[0],"position",pos[1])

    def handle_starttag(self, tag, attrs):
        print("Encountered a start tag:", tag)
        pos = self.getpos()
        print("At line",pos[0],"position",pos[1])
        global paragraphs
        if tag == "p":
            paragraphs += 1
        if len(attrs) > 0:
            print("Attributes:")
            for atts in attrs:
                print("\t",atts[0],"=",atts[1])

    def handle_data(self, data):
        if data.isspace():
            return
        print("Encountered a text data:", data)
        pos = self.getpos()
        print("At line",pos[0],"position",pos[1])
        pass

def main():
    # instantiate the parser and feed it some HTML
    parser = MyHTMLParser()
    
    f = open("samplehtml.html")
    if f.mode == "r":
        contents = f.read() # read the entire file
        parser.feed(contents)    

    print("Paragraphs cout:", paragraphs)

if __name__ == "__main__":
    main()
  