FROM alpine
WORKDIR /src/main/
COPY /src/main/java/com/coveros/demo/ /src/main/
RUN apk add openjdk8
ENV JAVA_HOME  /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN set classpath=
ENTRYPOINT java src/main/java/com/coveros/demo/
