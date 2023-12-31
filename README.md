# ResorTech App

## ディレクトリ構成

### 主要設定ファイル群
```
android
├── app
|   └── build.gradle
├── build.gradle
├── resortech_app_android.iml (ignored)
└── settings.gradle
```
```
[other settings]
.
├── analysis_options.yaml
├── pubspec.yaml
└── resortech_app.iml
```

### 主要開発ファイル群
```
lib
├── component
|   └── .
├── infrastructure
|   └── .
├── view
|   └── .
└── main.dart
```

### `./lib/component/`
- サイト内で共通して再利用するクラスを管理

### `./lib/infrastructure/`
- 通信やDB管理などに関わるクラスを管理
- バックエンドとの連携処理はここ

### `./lib/view/`
- ページ画面となるクラスを管理
- 他ファイルで定義したクラスを呼び出すかたちでUIを構築

## 開発環境

|       |     |
|  :-:  | --- |
| OS    | Windows 10 Pro |
| IDE   | Visual Studio Code |
| LANG  | Dart (Flutter 3.10.5) |
| PKG  | [camera](https://pub.dev/packages/camera), [cupertino_icons](https://pub.dev/packages/cupertino_icons), [http](https://pub.dev/packages/http) |

## 作成者

[Wassy | Ryoga Washizawa](https://github.com/wassy310)