FROM esolang/dotnet-base

RUN git clone --depth 1 https://codeberg.org/Timwi/Funciton.git ~/Function && \
    cd ~/Function/Src && \
    printf '<Project Sdk="Microsoft.NET.Sdk">\n  <PropertyGroup>\n    <OutputType>Exe</OutputType>\n    <TargetFramework>net10.0</TargetFramework>\n    <LangVersion>12</LangVersion>\n    <Nullable>enable</Nullable>\n    <ImplicitUsings>disable</ImplicitUsings>\n    <GenerateAssemblyInfo>false</GenerateAssemblyInfo>\n  </PropertyGroup>\n  <ItemGroup>\n    <Reference Include="Mono.Cecil">\n      <HintPath>../Thirdparty/Mono.Cecil.dll</HintPath>\n    </Reference>\n    <Reference Include="Mono.Cecil.Rocks">\n      <HintPath>../Thirdparty/Mono.Cecil.Rocks.dll</HintPath>\n    </Reference>\n  </ItemGroup>\n</Project>\n' > Funciton.csproj && \
    /root/dotnet-sdk/dotnet publish -c Release -o ~/Function/out && \
    rm -rf ~/.nuget /tmp/* && \
    ln -s /bin/script /bin/function2d

COPY script /root/script
