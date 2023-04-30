#!/bin/bash

pbs=($(ls ./pbs))

for pb in "${pbs[@]}"; do
    basename="${pb%.*}"
    mkdir -p "./golang/$basename"
    protoc --proto_path=./pbs \
        --go_out="./golang/$basename" --go_opt=paths=source_relative \
        --go-grpc_out="./golang/$basename" --go-grpc_opt=paths=source_relative \
        "$pb"
done

go mod tidy
