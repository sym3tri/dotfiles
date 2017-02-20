#!/bin/bash

curl https://glide.sh/get | sh

go get -u github.com/sgotti/glide-vc
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/mattn/goreman
go get -u github.com/jstemmer/gotags
go get -u github.com/golang/lint/golint

