#!/usr/bin/env bash

rm -rf bin obj
docker run --rm -it -v "$(pwd):/app" --workdir /app -p 8080:8080 mcr.microsoft.com/dotnet/sdk:7.0 dotnet run