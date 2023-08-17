FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app
COPY HelloWorldApp.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o out
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 1234
ENTRYPOINT ["dotnet", "HelloWorldApp.dll"]
