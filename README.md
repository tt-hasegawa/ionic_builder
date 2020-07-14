# ionic_builder
Docker Container for Build Ionic Projects

* CORDOVA_VERSION 9.0.0
* IONIC_VERSION 4.12.0
* Node.js v10.16.0

Ionicアプリをビルドする際に、Beevelop/Ionicコンテナイメージとして利用することが多いと思います。

Beevelop/Ionicのlatestはnode.js v12で、ひとつ前のv5.2.3はnode.js v8が使われています。

Google Firebaseモジュールをインストールする際に、grpcモジュールがnode.js v12ではエラーになるため、node.js v10 環境で同等の環境を作成してみました。

