# README



## userテーブル
|Column             |Type  |Options    |
|-------------------|------|-----------|
|nickname           |String|null: false|
|email              |String|null: false|
|encrypted_password |String|null: false|
|first_name         |String|null: false|
|last_name          |String|null: false|
|first_name_kana    |String|null: false|
|last_name_kana     |String|null: false|


### Association
- has_many :items,dependent: :destroy
- has_many :contract_history,dependent: :destroy
- has_one :address, dependent: :destroy


## itemsテーブル

|Column         |Type     |Options                           |
|---------------|---------|----------------------------------|
|name           |String   |null: false                       |
|status         |String   |null: false                       |
|price          |Integer  |null: false                       |
|brand          |String   |null: false                       |
|category_id    |Integer  |null: false                       |
|text           |Text     |null: false                       |
|judgement_id   |Integer  |null: false                       |
|days_id        |Integer  |null: false                       |
|prefecture     |String   |null: false                       |
|user           |reference|null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_many :images, dependent: :destroy
- has_one :contract_history, dependent: :destroy



## addressテーブル

|Column          |Type     |Options                           |
|----------------|---------|----------------------------------|
|prefecture      |String   |null: false                       |
|municipality    |String   |null: false                       |
|postal_code     |String   |null: false                       |
|address         |String   |null: false                       |
|building_name   |String   |                                  |
|phone_number    |Integer  |null: false                       |
|user            |Integer  |null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_one :contract_history



## contract_historysテーブル

|Column   |Type     |Options                           |
|---------|---------|----------------------------------|
|item     |Reference|null: false, foreign_key: true    |
|address  |Reference|null: false, foreign_key: true    |

### Association
- belongs_to :item
- belongs_to :address




