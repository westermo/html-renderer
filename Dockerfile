FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /src

COPY Source /src/

CMD dotnet build --configuration Release ./HtmlRenderer/HtmlRenderer.csproj && \
    dotnet build --configuration Release ./HtmlRenderer.WinForms/HtmlRenderer.WinForms.csproj && \
    dotnet build --configuration Release ./HtmlRenderer.WPF/HtmlRenderer.WPF.csproj