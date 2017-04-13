FROM microsoft/dotnet:latest
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN ls /app
RUN ["dotnet", "restore"]
RUN ["dotnet", "build"]
EXPOSE 5000/tcp
CMD ["dotnet", "run"]