## DOCKER DEMO

# Make sure locally projects looks good

    xxxx-MacBook-Pro:~ xxxxxx$ $ dotnet restore
    Restoring packages for /Users/xxxxxxxxxx/Documents/Projects/firstApp/firstApp.csproj...
    Lock file has not changed. Skipping lock file write. Path: /Users/xxxxxxxxxx/Documents/Projects/firstApp/obj/project.assets.json
    Restore completed in 823.47 ms for /Users/xxxxxxxxxx/Documents/Projects/firstApp/firstApp.csproj.
    
    NuGet Config files used:
        /Users/xxxxxxxxxx/.nuget/NuGet/NuGet.Config
    
    Feeds used:
        https://api.nuget.org/v3/index.json

    xxxx-MacBook-Pro:~ xxxxxx$ dotnet build
    Microsoft (R) Build Engine version 15.1.548.43366
    Copyright (C) Microsoft Corporation. All rights reserved.

    firstApp -> /Users/xxxxxx/Documents/Projects/firstApp/bin/Debug/netcoreapp1.1/firstApp.dll

    Build succeeded.
        0 Warning(s)
        0 Error(s)

    Time Elapsed 00:00:01.70
    xxxx-MacBook-Pro:~ xxxxxx$ dotnet run
    Hosting environment: Production
    Content root path: /Users/xxxxxxxxxx/Documents/Projects/firstApp
    Now listening on: http://*:5000
    Application started. Press Ctrl+C to shut down.
    ^CApplication is shutting down...

# Create Dockerfile

    refer file Dockerfile for more information

# Run below commands to create docker image

    xxxxxs-MacBook-Pro:firstApp xxxxxxxxxx$ docker build -t firstapp:v0.1 .
    Sending build context to Docker daemon 578.6 kB
    Step 1/9 : FROM microsoft/dotnet:latest
    latest: Pulling from microsoft/dotnet
    6d827a3ef358: Pull complete 
    2726297beaf1: Pull complete 
    7d27bd3d7fec: Pull complete 
    356c89a63697: Pull complete 
    2b9a54d027b9: Pull complete 
    3fde2ac3b0d2: Pull complete 
    Digest: sha256:7e0cf72d69a673ff830afed794b7ad8f3e1a90ad073e6c4e31ca751554546c93
    Status: Downloaded newer image for microsoft/dotnet:latest
    ---> d4fa886c8c0b
    Step 2/9 : RUN mkdir /app
    ---> Running in abcf5ee5f557
    ---> 3024041a7393
    Removing intermediate container abcf5ee5f557
    Step 3/9 : WORKDIR /app
    ---> 27c2bb1ed882
    Removing intermediate container 41960afe0077
    Step 4/9 : COPY . /app
    ---> e6c5aa3b0199
    Removing intermediate container 54955649afbe
    Step 5/9 : RUN ls /app
    ---> Running in 048a71e9a2d2
    Dockerfile
    Program.cs
    ReadMe.MD
    Startup.cs
    bin
    firstApp.csproj
    obj
    wwwroot
    ---> d7e33c4ee3e1
    Removing intermediate container 048a71e9a2d2
    Step 6/9 : RUN dotnet restore
    ---> Running in b2ecb7234e40
    Restoring packages for /app/firstApp.csproj...
    Generating MSBuild file /app/obj/firstApp.csproj.nuget.g.props.
    Writing lock file to disk. Path: /app/obj/project.assets.json
    Restore completed in 719.85 ms for /app/firstApp.csproj.
    
    NuGet Config files used:
        /root/.nuget/NuGet/NuGet.Config
    
    Feeds used:
        https://api.nuget.org/v3/index.json
    ---> e0a08c0c1684
    Removing intermediate container b2ecb7234e40
    Step 7/9 : RUN dotnet build
    ---> Running in 71c93336714b
    Microsoft (R) Build Engine version 15.1.548.43366
    Copyright (C) Microsoft Corporation. All rights reserved.

    firstApp -> /app/bin/Debug/netcoreapp1.1/firstApp.dll

    Build succeeded.
        0 Warning(s)
        0 Error(s)

    Time Elapsed 00:00:02.73
    ---> 99a5ffb16f41
    Removing intermediate container 71c93336714b
    Step 8/9 : EXPOSE 5000/tcp
    ---> Running in 440d83e64546
    ---> 93b9c0a4cd1b
    Removing intermediate container 440d83e64546
    Step 9/9 : CMD dotnet run
    ---> Running in d6446be32f4c
    ---> 32918a6601b5
    Removing intermediate container d6446be32f4c
    Successfully built 32918a6601b5
    xxxxxs-MacBook-Pro:firstApp xxxxxxxxxx$ 

# Run below commands to run docker image

    xxxxxs-MacBook-Pro:firstApp xxxxxxx$ docker run -it firstapp:v0.1
    Hosting environment: Production
    Content root path: /app
    Now listening on: http://*:5000
    Application started. Press Ctrl+C to shut down.

# Other userful docker commands

    Last login: Wed Apr 12 23:16:55 on ttys002
    xxxx-MacBook-Pro:~ xxxxxx$ docker images
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    firstapp            v0.1                32918a6601b5        18 seconds ago      880 MB
    microsoft/dotnet    latest              d4fa886c8c0b        4 hours ago         879 MB
    xxxx-MacBook-Pro:~ xxxxxx$ docker ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    xxxx-MacBook-Pro:~ xxxxxx$ docker version
    Client:
    Version:      17.03.1-ce
    API version:  1.27
    Go version:   go1.7.5
    Git commit:   c6d412e
    Built:        Tue Mar 28 00:40:02 2017
    OS/Arch:      darwin/amd64

    Server:
    Version:      17.03.1-ce
    API version:  1.27 (minimum version 1.12)
    Go version:   go1.7.5
    Git commit:   c6d412e
    Built:        Fri Mar 24 00:00:50 2017
    OS/Arch:      linux/amd64
    Experimental: true

# How to ensure docker image is running
    xxxxxs-MacBook-Pro:~ xxxxxxxxx$ clear
    CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                    NAMES
    fdc37cc2b491        firstapp:v0.1       "dotnet run"        About a minute ago   Up About a minute   0.0.0.0:5000->5000/tcp   nostalgic_davinci

    # curl http://localhost:5000
    Hello World!#
