#!/bin/sh

##dotnet
dotnet publish .\\LambdaAPIDemo\\LambdaAPIDemo.sln -c "Release" -f "net6.0" //p:GenerateRunTimeConfigurationFiles=true --runtime linux-x64 --self-contained false

terraform apply --auto-approve