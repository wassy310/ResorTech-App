# ResorTech App

## ディレクトリ構成

### 主要設定ファイル
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

### 主要開発(UI)ファイル
```
lib
├── component
|   └── .
├── infrastructure
|   └── .
├── provider
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

### `./lib/provider/`
- 状態管理用
- Riverpodを使用

### `./lib/view/`
- ページ画面となるクラスを管理
- 他ファイルで定義したクラスを呼び出すかたちでUIを構築

## 開発環境

|       |     |
|  :-:  | --- |
| OS    | Windows 10 Pro, Ubuntu 22.04(LTS) |
| IDE   | Visual Studio Code |
| LANG  | Dart (Flutter 3.10.5) |
| PKG  | [camera](https://pub.dev/packages/camera), [cupertino_icons](https://pub.dev/packages/cupertino_icons) |

## 作成者

[Wassy | Ryoga Washizawa](https://github.com/wassy310)