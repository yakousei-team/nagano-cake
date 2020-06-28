## NAGANO CAKE
　NAGANO CAKEはRoRを使った洋菓子店の商品を通販するため会員制ECサイトです。

## Description
　会員は商品の購入、配送先の登録、注文履歴の閲覧、退会をすることができます。
管理者は商品の追加、注文の会員・商品・ジャンル・注文などのステータス変更を行うことができます。

## Features
- sessionを使用して注文機能を実装。購入を確定せずにページを移動してもデータを保持することができます。
- 退会ステータスあり。会員は退会すれば同じアドレスで繰り返し新規登録が可能です。

## Requirement
- Ruby 2.5.7
- Rails 5.2.4
- SQlite3 1.4.2
- HTML5
- CSS3

## Installation
ローカルサーバーにアクセスしてご覧ください。
```
$ git clone https://github.com/yakousei-team/nagano-cake.git
$ cd nagano-cake
$ bundle install
$ rails s -b 0.0.0.0
```

## Sign up with
- user  [here](http://localhost:3000/)
- admin [here](http://localhost:3000/admins/sign_up)

## Author
yakousei-team（夜行性）
チーム名に反して、午前から元気に活動しています！

- [keito0410](https://github.com/keito0410)
- [yousukeyashima](https://github.com/yousukeyashima)
- [yurika-shio](https://github.com/yurika-shio)
- [m0chi2](https://github.com/m0chi2)