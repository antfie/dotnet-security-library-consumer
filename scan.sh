#!/usr/bin/env bash

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