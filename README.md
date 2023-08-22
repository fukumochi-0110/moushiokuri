# README

## アプリケーション名
TaskyRelay


## アプリケーション概要
介護施設運営に必要な連絡事項の申し送りとタスク管理のアプリケーションです。引き継ぎに必要な申し送り機能とやるべきことを管理するタスク機能が実装されています。申し送り機能とタスク管理機能は日付ごとに管理されており、一つの画面で確認、操作することができます。


## URL
https://moushiokuri.onrender.com

## テスト用アカウント
### Basic認証
	ID : admin
	Pass : 199001

### ログインに必要な情報
	メールアドレス : aaa@aaa
	パスワード : aaa111


## 利用方法
新規登録後、事業所内にユニットや階層がある場合、それを作成し選択します。その後、home画面にて日付に紐づいた申し送りの作成ができ、タスク作成も行うことができます。

	・トップページ
    新規登録とログインができます。事業所名で登録していただきます。

	・ユニット選択画面
    事業所内に複数のユニットや階層があるあることもあるのでこの機能を作りました。ユニットや階層によって申し送りやタスクが異なるからです。それらを分けるための機能です。
    
	・home画面
    この画面で申し送りとタスクを作成することができます。


## アプリケーションを作成した背景
私自身、介護福祉士として働いており、日々の業務の中で重要な情報が埋もれてしまうことや、やらなければいけないタスクが見過ごされてしまうことがありました。そのような問題の解決のため、私が開発したアプリケーションは、介護施設に勤める多くの介護士たちの支援を目指しています。

日々の業務に追われ、必要な情報が十分に共有されずに困っている介護士の役に立ちたいと思いました。このアプリケーションが、介護の現場で働く方にとって助けになれればと思っています。

## 洗い出した要件
[洗い出したシートのリンク](https://docs.google.com/spreadsheets/d/1A1-wKQR2VAKu726efrXxdFFxjhETAZnwgAEfSFpLbdo/edit?usp=sharing)

## 実装した機能についての画像やGIFおよびその説明
[![トップページ](https://i.gyazo.com/b8b225cb428137284c45bf5d233f37e5.gif)](https://gyazo.com/b8b225cb428137284c45bf5d233f37e5)

利用開始ボタンをクリックすると新規登録画面・ログイン画面に遷移します。

ユーザー管理機能
[![ユーザー管理機能](https://i.gyazo.com/322735b620265103661df487fc5603bb.png)](https://gyazo.com/322735b620265103661df487fc5603bb)

deviseを用いて、新規登録とログイン機能を実装しました。

階層選択機能
[![階層選択機能](https://i.gyazo.com/41266bfaaa4d1404499898991e8421c0.png)](https://gyazo.com/41266bfaaa4d1404499898991e8421c0)

同じ施設内でも階層があったり、ユニットがあったりと所属する場所によって必要な情報が異なるために、ここで分岐できるようになっています。

日付機能
[![日付機能](https://i.gyazo.com/3456355d8cbe2c14bdd1a09635da2f6d.png)](https://gyazo.com/3456355d8cbe2c14bdd1a09635da2f6d)

日付がリンクになっていてそれぞれ結びついている申し送りを表示できるようになっています。

申し送り機能
[![申し送り機能](https://i.gyazo.com/deafeba778274e77a28122d1436b1263.png)](https://gyazo.com/deafeba778274e77a28122d1436b1263)

申し送りと名前は必須となっています。上部のフォームから保存すると、下に表示されるようになっています。日付を入力しなくても本日の日付が保存されます。写真を一枚任意で保存することができます。編集画面へのリンクをクリックすると編集画面に遷移します。削除ボタンをクリックすると削除されます。

タスク管理機能
[![タスク管理機能](https://i.gyazo.com/595295170558b06dc130d5aa37c6b4c7.png)](https://gyazo.com/595295170558b06dc130d5aa37c6b4c7)

申し送りと名前、期限は必須となっています。上部のフォームから保存すると、下に表示されるようになっています。チェックボックスをクリックすると非同期通信で完了済みに移動します。編集画面へのリンクをクリックすると編集画面に遷移します。


## 実装予定の機能
	検索機能を実装に実装中。

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/688b764a06fb3b0b113f83a558ed0367.png)](https://gyazo.com/688b764a06fb3b0b113f83a558ed0367)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/915e3fee49e5df976f944b9f669b59c0.png)](https://gyazo.com/915e3fee49e5df976f944b9f669b59c0)

## 開発環境
* Ruby
* Ruby on Rails
* HTML
* CSS
* JavaScript
* GitHub
* Visual Studio Code


## ローカルでの動作方法

```
% git clone https://github.com/fukumochi-0110/moushiokuri
% cd moushiokuri
% bundle install
% yarn install
```

## 工夫したポイント
私自身、介護福祉士として働いており、日々の業務の中で重要な情報が埋もれてしまうことや、やらなければいけないタスクが見過ごされてしまうことがありました。申し送りとタスクの情報を分けつつ、一つの画面に効率的に表示出来ないかと考え、このアプリケーションを作成しました。

このアプリケーションの工夫点は、日付と申し送りを結びつけられるようにした点です。毎日職員が引き継ぎのために申し送りを作成しているので、日付ごとに分ける必要があると考えたからです。

今回の開発は自分の経験を基にして行いましたが、今後はアンケートや聞き取りなどを通じて、お客様から直接ニーズを吸い上げ、更に使いやすいアプリケーションを開発することや新しいアプリケーション開発に興味を持っています。


## Usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
has_many :units

## Unitsテーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| name    | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association
	belongs_to :user
	has_many :messages
	has_many :tasks

## Messagesテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| text          | string     | null: false                    |
| name          | string     | null: false                    |
| event_date_id | references | null: false, foreign_key: true |
| unit_id       | references | null: false, foreign_key: true |

### Association
	belongs_to :unit
	belongs_to :event_date

## Tasksテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| text          | string     | null: false                    |
| name          | string     | null: false                    |
| event_date_id | references | null: false, foreign_key: true |
| unit_id       | references | null: false, foreign_key: true |
| completed     | boolean    | null: false, default: false    |
| due_date      | datetime   | null: false                    |

### Association
	belongs_to :unit
	belongs_to :event_date


## Event_datesテーブル

| Column     | Type | Options |
|------------|------|---------|
| event_date | date |         |

### Association
	has_many :messages
	has_many :tasks