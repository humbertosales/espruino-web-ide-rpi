FROM hypriot/rpi-node:7.4.0

MAINTAINER Humberto Sales

# Install dependencies
RUN apt-get -yqq update && \
    apt-get -yqq --no-install-recommends install bluetooth bluez libbluetooth-dev libudev-dev

#    apt-get -yqq autoremove && \
#    apt-get -yqq clean && \
#    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

RUN ln /usr/local/bin/node /usr/bin/node

RUN npm install -g espruino-web-ide

#    sudo npm cache clean

RUN setcap cap_net_raw+eip $(eval readlink -f `which node`)

# RUN ln /usr/local/bin/node /usr/bin/node

RUN npm install -g serialport

EXPOSE 8080

CMD espruino-server

