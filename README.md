# README



## userテーブル
|Column          |Type  |Options    |
|----------------|------|-----------|
|nickname        |String|null: false|
|email           |String|null: false|
|password        |String|null: false|
|first_name      |String|null: false|
|last_name       |String|null: false|
|first_name_kana |String|null: false|
|last_name_kana  |String|null: false|


### Association
- has_many :items,dependent: :destroy
- has_many :contract_history,dependent: :destroy
- has_one :destination , dependent: :destroy

## itemsテーブル

|Column      |Type     |Options                           |
|------------|---------|----------------------------------|
|name        |String   |null: false                       |
|status      |String   |null: false                       |
|price       |Integer  |null: false                       |
|brand       |String   |null: false                       |
|category    |String   |null: false                       |
|text        |String   |null: false                       |
|judgement   |Boolean  |null: false                       |
|days        |Integer  |null: false                       |
|user_id     |reference|null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_many :images , dependent: :destroy
- has_one :contract_history, dependent: :destroy




## destinationテーブル

|Column          |Type     |Options                           |
|----------------|---------|----------------------------------|
|last_name       |String   |null: false                       |
|first_name      |String   |null: false                       |
|last_name_kana  |String   |null: false                       |
|first_name_kana |String   |null: false                       |
|prefecture      |String   |null: false                       |
|municipality    |String   |null: false, length: {minimum: 8} |
|postal_code     |String   |null: false                       |
|address         |String   |null: false                       |
|building_name   |String   |null: false                       |
|phone_number    |Boolean  |null: false                       |
|user_id         |reference|null: false, foreign_key: true    |

### Association
- belongs_to :user



## imagesテーブル

|Column  |Type     |Options     |
|--------|---------|------------|
|image   |String   |null: false |
|item_id |String   |null: false |


### Association
- belongs_to :item


## contract_historyテーブル

|Column  |Type     |Options                          |
|--------|---------|---------------------------------|
|item_id |Integer  |null: false, foreign_key: true   |
|user_id |Integer  |null: false, foreign_key: true   |


### Association
- belongs_to :item
- belongs_to :user


