

users テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| email      | string     | null: false,                   |
| password   | string     | null: false,                   |
| name       | string     | null: false,                   |
| profile    | text       | null: false,                   |
| occupation | text       | null: false,                   |
| position   | text       | null: false,                   |

### Association
- has_many :prototypes
- has_many :comments

prototypes テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| title      | string     | null: false,                   |
| catch_copy | text       | null: false,                   |
| concept    | text       | null: false,                   |
| image      | ActiveStorage | null: ,                     |
| user       | references | null: ,                        |

### Association
- has_many :comments
- belongs_to :users

comments (中間)テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| text      | text       | null: false,                   |
| user      | references | null: ,                        |
| prototype | references | null: ,                        |

### Association
- belongs_to :users
- belongs_to :prototypes



t.string :name,               null: false,
      t.text :profile,              null: false,
      t.text :occupation,           null: false,
      t.text :position,             null: false,