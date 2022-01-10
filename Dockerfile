FROM ubuntu:18.04

RUN apt-get -y update

RUN apt-get install -y build-essential sudo
RUN apt-get install -y git wget curl rsync bc apt-transport-https libxml2 libxml2-dev libcurl4-openssl-dev
RUN apt-get install -y gawk libreadline6-dev libyaml-dev autoconf libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
RUN apt-get install -y libmagickwand-dev imagemagick
RUN apt-get install -y nodejs mysql-client vim qt5-default libqt5webkit5-dev xvfb dbus-x11 gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x xfonts-base xfonts-75dpi
RUN apt-get install -y unzip netcat libgconf-2-4 poppler-utils
RUN apt-get install -y libssl1.0-dev

RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb

RUN wget https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/
RUN chmod +x /usr/local/bin/chromedriver

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.bionic_amd64.deb

RUN git clone https://github.com/rbenv/ruby-build.git && \
  PREFIX=/usr/local ./ruby-build/install.sh && \
  ruby-build -v 2.2.0 /usr/local

RUN apt-get install -y libmysqlclient-dev
