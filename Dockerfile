FROM ubuntu:18.04
RUN mkdir /root/corrade 
RUN \
apt-get update && \
apt-get install unzip wget -y &&  wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb && apt update && apt-get install -y dotnet-sdk-6.0 && apt-get install -y aspnetcore-runtime-6.0 && apt-get install -y dotnet-runtime-6.0 && \
rm -rf /var/lib/apt/lists/*
RUN wget -O /root/corrade/unzip.zip https://corrade.grimore.org/download/corrade/linux-arm64/LATEST.zip && cd /root/corrade && unzip unzip.zip &&  rm unzip.zip
CMD ./root/corrade/Corrade
