FROM android/ndk:11

RUN apt-get update && apt-get install -y --no-install-recommends \
		automake \
		ant \
        autopoint \
        cmake \
        build-essential \ 
        libtool \
        patch \ 
        pkg-config \
        protobuf-compiler \
        ragel \
        subversion \
	&& rm -rf /var/lib/apt/lists/*

ENV ANDROID_NDK $ANDROID_NDK_HOME