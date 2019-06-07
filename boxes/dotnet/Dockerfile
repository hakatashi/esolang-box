FROM esolang/build-base

RUN curl -m 30  https://download.visualstudio.microsoft.com/download/pr/76c888e7-cb8e-45c6-be3e-d11ab25a1c7f/b730a4bb06d941b6a5b4bfbbbe4614db/dotnet-sdk-2.2.107-linux-musl-x64.tar.gz -LO && \
    tar xf dotnet-sdk-2.2.107-linux-musl-x64.tar.gz && \
    apk add --update gettext libintl icu
