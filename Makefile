.PHONY: build clean doc test vet

excluding_vendor := $(shell go list ./... | grep -v /vendor/)

lib_name := appoptics-go

build:
	go build -i -o $(lib_name)

clean:
	rm $(lib_name)

doc:
	godoc -http=:8080 -index

test:
	go test -v $(excluding_vendor)

vet:
	go vet

release:
	git tag -a $(shell go run cmd/main.go)
