# ionic_builder
Docker Container for Build Ionic Projects

* CORDOVA_VERSION 9.0.0
* IONIC_VERSION 4.12.0
* Node.js v10.16.0

Ionicアプリをビルドする際に、Beevelop/Ionicコンテナイメージとして利用することが多いと思います。

Beevelop/Ionicのlatestはnode.js v12で、ひとつ前のv5.2.3はnode.js v8が使われています。

Google Firebaseモジュールをインストールする際に、grpcモジュールがnode.js v12ではエラーになるため、node.js v10 環境で同等の環境を作成してみました。


# .gitlab-ci.ymlのサンプル
```

image: tthasegawa/ionic_builder:latest

build_android:
  stage: build
  only:
    - develop
    - feature
  before_script:
    - mkdir -p "${ANDROID_HOME}/licenses"
    - echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "${ANDROID_HOME}/licenses/android-sdk-license"
    - echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "${ANDROID_HOME}/licenses/android-sdk-preview-license"
    - echo -e "\nd975f751698a77b662f1254ddbeed3901e976f5a" > "${ANDROID_HOME}/licenses/intel-android-extra-license"
    - echo -e "\n24333f8a63b6825ea9c5514f83c2829b004d1fee" > "${ANDROID_HOME}/licenses/android-sdk-license"
  script:
    - mkdir ~/.gradle
    - echo org.gradle.jvmargs=-Xmx1536m >>~/.gradle/gradle.properties
    - node -v
    - npm i
    - ionic cordova platform rm android
    - ionic cordova platform add android
    - ionic cordova build android
    - ls ./platforms/android/app/build/outputs/apk/debug/*.apk
  artifacts:
    paths:
      - platforms/android/app/build/outputs/apk/debug

```
