FROM ubuntu as builder
RUN apt -y update
RUN apt -y install curl
RUN curl https://google.com | wc -c > google-size

FROM alpine
COPY --from=builder /google-size /google-size
ENTRYPOINT echo google home has; cat google-size  