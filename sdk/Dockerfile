FROM android/gradle

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get -qqy install libc6:i386 libstdc++6:i386 zlib1g:i386 libncurses5:i386 tar git --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# gradle dex needs a lot of memory

ENV JAVA_OPTS "-Xms1024m -Xmx1600m"
ENV GRADLE_OPTS "-XX:+UseG1GC -XX:MaxGCPauseMillis=1000"

# Download and untar Android SDK
ENV ANDROID_SDK_URL http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
RUN curl -sSL "${ANDROID_SDK_URL}" | tar --no-same-owner -xz -C ${SDK_HOME}
ENV ANDROID_HOME ${SDK_HOME}/android-sdk-linux
ENV ANDROID_SDK ${SDK_HOME}/android-sdk-linux
ENV PATH ${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:$PATH


# provide SDK agreemnt file
# there should be better solution!
# http://stackoverflow.com/questions/40383323/cant-accept-license-agreement-android-sdk-platform-24/40383457
RUN mkdir "$ANDROID_HOME/licenses"
RUN echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"

# Install Android SDK components

ENV ANDROID_COMPONENTS platform-tools,build-tools-25.0.0,build-tools-25.0.1,android-25
ENV GOOGLE_COMPONENTS extra-android-m2repository,extra-google-m2repository

RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}" ; \
    echo y | android update sdk --no-ui --all --filter "${GOOGLE_COMPONENTS}"

RUN mkdir -p /opt/workspace
WORKDIR  /opt/workspace
