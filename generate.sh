#!/bin/bash

pbs=($(ls ./pbs))

for pb in "${pbs[@]}"; do
    basename="${pb%.*}"
    mkdir -p ./"$basename"
    protoc --proto_path=./pbs \
        --go_out=./"$basename" --go_opt=paths=source_relative \
        --go-grpc_out=./"$basename" --go-grpc_opt=paths=source_relative \
        "$pb"
done
