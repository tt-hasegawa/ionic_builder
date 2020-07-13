FROM beevelop/ionic:latest

ENV NODEJS_VERSION=10.13.0 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/android/tools:/opt/android/platform-tools:/opt/android/build-tools/27.0.0:/usr/share/ant/bin:/usr/share/maven/bin:/usr/share/gradle/bin:/opt/node/bin
WORKDIR /opt/node
RUN apt-get update && apt-get install -y curl git ca-certificates --no-install-recommends &&     curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 &&     rm -rf /var/lib/apt/lists/* &&     apt-get clean
WORKDIR /tmp
