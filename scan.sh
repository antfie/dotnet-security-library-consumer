#!/usr/bin/env bash

rm -rf veracode veracode.zip bin obj build build.zip
docker run --rm -it -v "$(pwd):/app" --workdir /app mcr.microsoft.com/dotnet/sdk:7.0 dotnet publish -c Debug -o veracode && \
cd veracode && \
zip -r ../veracode.zip ./* && \
cd .. && \
rm -rf veracode && \
zipinfo veracode.zip && \
docker run --rm -it \
    -v "$(pwd)/veracode.zip:/home/luser/veracode/veracode.zip" \
    -v ~/.veracode/internal:/home/luser/.veracode/credentials \
    veracode/api-wrapper-java:cmd \
        -action UploadAndScan \
        -deleteincompletescan 2 \
        -createprofile false \
        -appname "Antfie.SecurityLibraryConsumer" \
        -version "`date +"%Y-%m-%dT%H-%M-%SZ"`" \
        -filepath veracode