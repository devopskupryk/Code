FROM ubuntu
RUN apt -y update
RUN apt -y install curl
RUN curl https://google.com | wc -c > google-size
ENTRYPOINT echo google home has; cat google-size  