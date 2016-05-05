FROM kallikrein/cordova:5.1.1

MAINTAINER Clemens Hübner
RUN \
apt-get update && \
apt-get install -y lib32stdc++6 lib32z1

# download and extract android sdk
RUN curl http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xz -C /usr/local/
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# update and accept licences
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -a --filter platform-tool,build-tools-23.1,android-23

ENV GRADLE_USER_HOME /src/gradle
VOLUME /src
WORKDIR /src

RUN ln -s /src/.debug.keystore /root/.android/debug.keystore

ENV IONIC_VERSION=1.7.14 \
    BOWER_VERSION=1.7.9 \
    CORDOVA_VERSION=6.1.1 \
    PHONEGAP_VERSION=6.1.0 \
    GULP_VERSION=3.9.1

# Install basics
RUN npm install -g bower@"$BOWER_VERSION"
RUN npm install -g cordova@"$CORDOVA_VERSION" 
RUN npm install -g phonegap@"$PHONEGAP_VERSION" 
RUN npm install -g ionic@"$IONIC_VERSION" 
RUN npm install -g gulp@"$GULP_VERSION"
RUN npm cache clear