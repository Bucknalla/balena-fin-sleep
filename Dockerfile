FROM balenalib/fincm3-python:3-stretch-build

# Defines our working directory in container
WORKDIR /usr/src

# install required packages
RUN apt-get update && apt-get install -yq --no-install-recommends \
    ftdi-eeprom \
    git \
    build-essential \
    libtool \
    pkg-config \
    autoconf \
    automake \
    texinfo \
    libusb-1.0 \
    libftdi-dev \
    screen \
    telnet \
    make \
    && git clone --depth 1 https://github.com/balena-io-modules/FT2232H-56Q-openocd && \
      cd FT2232H-56Q-openocd && chmod -R +x ./* && autoreconf -f -i && ./configure && make && \
      make install

# enable systemd init system in the container
ENV INITSYSTEM on

# Copy requirements.txt first for better cache on later pushes
COPY requirements.txt requirements.txt

# pip install python deps from requirements.txt on the resin.io build server
RUN pip install -r requirements.txt

# This will copy all files in our root to the working  directory in the container
COPY . ./

# Enable udevd so that plugged dynamic hardware devices show up in our container.
ENV UDEV=1

# Start app
CMD ["bash", "app/start.sh"]