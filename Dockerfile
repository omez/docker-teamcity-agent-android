FROM jetbrains/teamcity-agent
MAINTAINER Alexander Sergeychik <alexander.sergeychik@gmail.com>

ENV ANDROID_SDK_VERSION 24.4.1

#ADD setup-agent.sh /setup-agent.sh

RUN apt-get update && \
	apt-get install -y \
		wget
	
#	adduser default-jre sudo unzip wget && \
#		rm -rf /var/lib/apt/lists/*

RUN wget -qO- http://dl.google.com/android/android-sdk_r$ANDROID_SDK_VERSION-linux.tgz | tar xz -C /opt
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#RUN echo y | android update sdk --filter android-21,tool,platform-tool,build-tools-21.1.2,extra-android-support,extra-android-m2repository --no-ui -a

#RUN adduser teamcity