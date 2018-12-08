FROM microsoft/dotnet:sdk AS build
WORKDIR /app

COPY *.csproj ./


COPY . ./
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:aspnetcore-runtime AS runtime
WORKDIR /app
RUN echo 'copying my basic .Net Core application'
COPY --from=build /app/out .
ENTRYPOINT ["dotnet","myFirstNetCoreApplication.dll"]
