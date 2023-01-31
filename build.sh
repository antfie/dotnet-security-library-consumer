#!/usr/bin/env bash

rm -rf veracode veracode.zip bin obj build
docker run --rm -it -v "$(pwd):/app" --workdir /app mcr.microsoft.com/dotnet/sdk:7.0 dotnet publish -c Release -o build && \
cd build && \
zip -r ../build.zip ./* && \
cd .. && \
rm -rf build && \
zipinfo build.zip