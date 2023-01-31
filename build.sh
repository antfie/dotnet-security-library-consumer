#!/usr/bin/env bash

rm -rf veracode veracode.zip bin obj target
docker run --rm -it -v "$(pwd):/app" --workdir /app mcr.microsoft.com/dotnet/sdk:7.0 dotnet publish -c Release -o target && \
cd target && \
zip -r ../target.zip ./* && \
cd .. && \
rm -rf target && \
zipinfo target.zip