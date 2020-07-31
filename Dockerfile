FROM golang:1.14-alpine AS build

WORKDIR /src/
COPY . .
RUN CGO_ENABLED=0 go build -o /bin/template

FROM scratch  
COPY --from=build /bin/template /bin/template
ENTRYPOINT ["/bin/template"]