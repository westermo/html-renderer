# escape=`

FROM mcr.microsoft.com/dotnet/sdk:6.0
ARG CONFIGURATION=Release

WORKDIR C:\src

COPY Source C:\src

RUN md C:\output\ && `
    dotnet build --configuration "%CONFIGURATION%" ./HtmlRenderer/HtmlRenderer.csproj && `
    dotnet build --configuration "%CONFIGURATION%" ./HtmlRenderer.WPF/HtmlRenderer.WPF.csproj && `
    dotnet build --configuration "%CONFIGURATION%" ./HtmlRenderer.WinForms/HtmlRenderer.WinForms.csproj && `
    dotnet pack --configuration "%CONFIGURATION%" -o C:/output ./HtmlRenderer/HtmlRenderer.csproj && `
    dotnet pack --configuration "%CONFIGURATION%" -o C:/output ./HtmlRenderer.WPF/HtmlRenderer.WPF.csproj && `
    dotnet pack --configuration "%CONFIGURATION%" -o C:/output ./HtmlRenderer.WinForms/HtmlRenderer.WinForms.csproj

ENV NUGET_TOKEN=

CMD dotnet nuget push "C:\output\*.nupkg" --api-key "%NUGET_TOKEN%" --source https://nuget.pkg.github.com/westermo/index.json --skip-duplicate