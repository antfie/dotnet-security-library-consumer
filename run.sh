#!/usr/bin/env bash

rm -rf veracode veracode.zip bin obj build build.zip
docker run --rm -it -v "$(pwd):/app" --workdir /app -p 8080:8080 mcr.microsoft.com/dotnet/sdk:7.0 dotnet run