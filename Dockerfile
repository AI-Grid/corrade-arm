FROM ubuntu:18.04
RUN mkdir /root/corrade 
ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install sudo wget unzip libc6 libgcc1 libgssapi-krb5-2 libicu-dev libssl1.1 libstdc++6 zlib1g-dev mono-complete dialog -y
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && chmod +x dotnet-install.sh
RUN ./dotnet-install.sh -c 6.0
RUN ./dotnet-install.sh -c 6.0 --runtime aspnetcore
RUN ./dotnet-install.sh -c 6.0 --runtime dotnet

RUN wget -O /root/corrade/unzip.zip https://corrade.grimore.org/download/corrade/linux-arm64/LATEST.zip  && cd /root/corrade && unzip unzip.zip &&  rm unzip.zip
CMD ./root/corrade/Corrade
