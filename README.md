## サービスのURL

今後記載する予定です。

<br />

## サービスの概要

家計簿アプリ。
支出と収入をカテゴリーごとに金額を入力し、登録する。また、複数人と共有を可能とする。

<br />

## 機能一覧
| ユーザ登録画面 |　ログイン画面 |
| ---- | ---- |
| ユーザ登録を行う | ログインを行う |

| 入力画面 |　カレンダー画面 |
| ---- | ---- |
| 収入と支出を入力し、登録する | 収入と支出をカレンダー形式で表示する |

<br />

## 使用技術

| Category          | Technology Stack                                     |
| ----------------- | --------------------------------------------------   |
| Frontend          | Dart, Flutter                                        |
| Database          | Firestore                                            |
| Monitoring        | Sentry, UptimeRobot                                  |
| Design            | Figma使用予定                                         |
| etc.              | Lint, formatter, Git, GitHub                         |

<br />

## システム構成図

記載予定

<br />

## ER図

データ設計
```markdown
user: [
    uid: [
        userInfo: {
            name,
            email
        },
        shared: [ 
            userA, 
            userB 
        ]
    ]
]

categories: [
	uid: [ 
		{
			spendings:[
                '食費',
                '外食費',
                '交通費',
                '衣服',
                '交際費',
                '趣味',
                'その他',
            ]
			income:[
                '給料',
                'その他',
            ]
		}
	]
]

spendings: [
	uid:[
        {
            category,
            memo,
            date,
            money
        },
	]
],

income: [
	uid:[
        {
            category,
            memo,
            date,
            money
        },
	]
]
```

<br />

## 開発ガイド

1. プロジェクトにTODO追加
2. convert to issueでissueの作成（assigneeを設定）
3. ブランチを下記の通りの名前で発行


    | 内容 | ブランチ名 |
    | ---- | ---- |
    | バグ修正 | fix/#issue番号-内容 |
    | 緊急バグ修正 | hot/#issue番号-内容 |
    | 追加機能 | feature/#issue番号-内容 |
    | リファクタリング | refactor/#issue番号-内容 |

4. プルリク作成（developを設定、assigneeを設定、projectを設定）

<br />

## その他

開発によく使うコマンド

```
    dart fix --apply lib    //lint
    dart format lib         //format
    flutter run -t storybook/main.dart -d chrome    //storybook
```

環境構築

```
    flutter pub get
```
firebase_app_id_file.jsonをiosフォルダ配下に
firebase_xxxxx_android.imlをandroidフォルダ配下に