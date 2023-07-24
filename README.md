# README

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

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| text   | string     | null: false                    |
| name   | string     | null: false                    |
| date   | references | null: false, foreign_key: true |
| unit   | references | null: false, foreign_key: true |

### Association
belongs_to :unit
belongs_to :event_date

## Tasksテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| text   | string     | null: false                    |
| name   | string     | null: false                    |
| date   | references | null: false, foreign_key: true |
| unit   | references | null: false, foreign_key: true |


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