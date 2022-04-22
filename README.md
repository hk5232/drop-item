# アプリケーション名
 DropItem

# アプリケーション概要
 落とし物情報共有サイト

# URL
 GitHub https://github.com/hk5232/drop-item <br>
 Heroku https://drop-item.herokuapp.com/

# テスト用アカウント
- Basic認証ID ： admin
- Basic認証パスワード : pass
- メールアドレス : aa@aa
- パスワード : aaaaa1

# 利用方法

## 落とし物を拾った側 :
### 新規登録、もしくはログイン後に、トップページ右下の登録するボタンから必要情報を入力し、落とし物情報を登録する。

## 落とし物を探している側 :
### 新規登録、もしくはログイン後に、トップページ右下の探すボタンから落とした場所を検索し、詳細ページへ移動。<br>詳細ページから拾ったボタンを推し、コメントを残す。

# アプリケーションを作成した背景
昔、Ipodを無くした際に１日中外にいた日でどこに落としたかわからない時があり、探しに行くにしても候補がたくさんあり、警察に届け出するにも落とした場所がわからない時があった。<br>
そんな時に落とし物の情報をまとめているアプリがあったらいいなと思っていたため、今回実装した。

# 洗い出した要件
要件定義シート https://docs.google.com/spreadsheets/d/12nDHkufLm2bz0HZxFLuBqMxAzGhiLXD_mc8cBQ12GKg/edit?usp=sharing

# 実装した機能についての画像

## ユーザー詳細機能
・取得済みのアイテムには取得済みのラベルがある
・未取得と取得済みのアイテムが別で表示されている
[![Image from Gyazo](https://i.gyazo.com/dfb620f73657fef624cdbfc7e6b87b44.gif)](https://gyazo.com/dfb620f73657fef624cdbfc7e6b87b44)
## アイテム投稿機能
・Googleマップを動かすと緯度経度が自動で更新される
・Googleマップの検索機能がある
[![Image from Gyazo](https://i.gyazo.com/f0eae602a6b0d1a9def6cd36dc568ba5.gif)](https://gyazo.com/f0eae602a6b0d1a9def6cd36dc568ba5)
## アイテム詳細機能
・Googleマップに位置情報を元にしたマーカーが表示されている
[![Image from Gyazo](https://i.gyazo.com/5d7ba87fc88eeee9422272ae28bed7a0.gif)](https://gyazo.com/5d7ba87fc88eeee9422272ae28bed7a0)
## アイテム検索機能
・DBに登録されているアイテムの位置情報の場所にマーカーが出ている
・全てのマーカーに名前と場所の吹き出しが出ている
・マップ範囲内のアイテムの情報が右のリストに出ている
[![Image from Gyazo](https://i.gyazo.com/4eccc0a7e11367714969b6a5898bad57.gif)](https://gyazo.com/4eccc0a7e11367714969b6a5898bad57)
・マップ検索機能が実装されている
・マップ検索機能後にマーカーと右のリストが更新されている
[![Image from Gyazo](https://i.gyazo.com/86ae459e36baf95439f03c03775a25ae.gif)](https://gyazo.com/86ae459e36baf95439f03c03775a25ae)

# データベース設計
ER図
[![Image from Gyazo](https://i.gyazo.com/1268754ae4602a45861eea68fa639fac.png)](https://gyazo.com/1268754ae4602a45861eea68fa639fac)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/1a01f6714e54c66432ddfeba51d34e1f.png)](https://gyazo.com/1a01f6714e54c66432ddfeba51d34e1f)

# 開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code /

# ローカルでの動作方法
% git clone https://github.com/hk5232/drop-item.git
% cd drop-item
% bundle install
% yarn install

# 工夫したポイント
非同期処理で部分テンプレートを更新すること。
マップ内に表示されているマーカーをリストにしたいと考えた際、コントローラーを介した際に帰ってくる変数を利用したeach文、もしくはfor文を想定していたのだが処理がうまくいかなかった。<br>そのため帰ってくる値をHTML形式に指定し、帰ってきたHTMLを部分テンプレートに投げることで非同期処理での更新に成功した。
