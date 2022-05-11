# テーブル設計

## usersテーブル
| Column             | Type   | Option                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders



## itemsテーブル
| Column             | Type       | Option                         |
|--------------------|------------|--------------------------------| 
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_burden_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :orders





## destinationsテーブル
| Column        | Type       | Option                        |
|---------------|------------|-------------------------------|
| postcode      | integer(7) | null:false                    |
| prefecture_id | integer    | null:false                    |
| city          | string     | null:false                    |
| block         | string     | null:false                    |
| building      | string     |                               |
| phone_number  | integer    | null:false                    |

### Association
- belongs_to :order



## ordersテーブル 
| Column | Type       | Option                        |
|--------|------------|-------------------------------|
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination