import urllib.request

def main():
    weburl = urllib.request.urlopen("http://google.com")
    print("result code:",weburl.getcode())
    print(weburl.read())

if __name__ == "__main__":
    main()
