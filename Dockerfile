# syntax=docker/dockerfile:1.3
FROM golang:1.16-bullseye AS build
RUN go get -u github.com/eliukblau/pixterm/cmd/pixterm
WORKDIR /movie
RUN --mount=type=bind,target=/context \
    cp /go/bin/pixterm /pixterm && \
    bash /context/bin/movie-generate.sh /context/frames /movie/raw && \
    ls -lach /movie/raw && \
    cp -a /context/bin /movie

FROM alpine:3
CMD ["bash", "/movie/bin/movie-play.sh", "/movie/raw"]
RUN apk --no-cache add bash ncurses
COPY --from=build /movie /movie
