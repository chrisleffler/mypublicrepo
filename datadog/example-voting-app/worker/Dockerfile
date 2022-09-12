FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as builder

WORKDIR /Worker
COPY src/Worker/Worker.csproj .
RUN dotnet restore

COPY src/Worker/ .
RUN dotnet publish -c Release -o /out Worker.csproj

# app image
FROM mcr.microsoft.com/dotnet/core/runtime:3.1

WORKDIR /opt/datadog
COPY ./datadog-dotnet-apm_2.14.0_amd64.deb .
RUN dpkg -i ./datadog-dotnet-apm_2.14.0_amd64.deb && /opt/datadog/createLogPath.sh

WORKDIR /app
ENTRYPOINT ["dotnet", "Worker.dll"]

COPY --from=builder /out .