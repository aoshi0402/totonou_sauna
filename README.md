# :bulb:サウナで"ととのう"
サウナで"ととのう"はサウナの検索、レビューサイトです。<br />
全国の登録されたサウナ、レビューにいち早くアクセスできます。また全国のサウナーとのコミュニケーションツールとしてもご利用できます！

<img width="900" alt="スクリーンショット 2020-12-13 21 24 18" src="https://user-images.githubusercontent.com/68432256/102011750-aac84e80-3d89-11eb-8b54-6805f854970a.png">
<br />

## :globe_with_meridians: URL
URL: https://totonousauna.work

<br />

## :notebook: 制作の背景
東京で社会人で働いていた時、会社の上司や仲間、仕事で忙しい人をみて以下のような不安や問題点を感じました。  

- **「東京はストレスフルな人が田舎に比べて多すぎる」**
- **「夜遅くまで仕事して睡眠時間が短い」**
- **「１日にゆっくりリラックスする時間を確保している人が少ない」**

<br />

また、私自身も仕事を毎日遅くまでしていたため、  
**「短時間でより、リラックスできて、頭の中を軽くする方法はないか」**
と感じていました。  

そんな悩みを吐露している時、友人がサウナがおすすめだよという提案を受け友人の指示通りにサウナに入ると、頭が軽くなり非常にリラックスできたのです。

<br />

上記の経験を踏まえ、
**「短時間でリラックスがしたい人、健康意識の高い人が**
**身近なサウナを検索でき、レビューをとして生の声にいち早くアクセスできるサービスとサウナ好きをマッチングさせるSNSサービス」**  
があれば上記の課題を解決できること
また、**短期間でより機能を豊富にするため**この題材が合うのではないかと考えたため
のではないかと思い、本アプリを制作しました。 

<br />

## :notebook_with_decorative_cover: サイトを利用するメリット
- 現在地を取得してすぐにサウナを検索できる
- サウナを利用した生の声にすぐアクセスできる
- サウナ好きと繋がれる
- サウナ飯も充実しているためサウナ付近のグルメにもアクセスできる

<br />

## :green_book: 工夫した点
- **直感的なわかりやすさ・使いやすさ**を重視し、一つ一つの機能やデザインをわかりやすくしました。
- **豊富な機能数**(約60個)を実装し、ユーザビリティを上げました。
- 今いる自分の位置からすぐ近くにあるサウナの情報にアクセスできるよう**現在地からすぐ近くのサウナにアクセス**できる様に実装しました。

## :books: 機能一覧
詳細は以下に記載しているので是非ご覧ください！
https://docs.google.com/spreadsheets/d/1pPd1_RFeBQe0W8Pw1cVKYVdRVoPZQAVPavUzoRps5xM/edit?usp=sharing

<br />

## :orange_book: ER図

https://drive.google.com/file/d/114vR3HL2iOFpXr2NI_hdX1ZD1im7-HSs/view?usp=sharing

<img width="1096" alt="スクリーンショット 2020-12-13 21 08 48" src="https://user-images.githubusercontent.com/68432256/102011486-d77b6680-3d87-11eb-846b-826f0cc0c2a0.png">



## :wrench: インフラ構成図

<img width="700" alt="スクリーンショット 2020-12-13 21 17 41" src="https://user-images.githubusercontent.com/68432256/102011627-bf581700-3d88-11eb-9ce4-3a569393a637.png">


## :closed_book: 使用技術、開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- CI/CD: CircleCI
- 仮想環境：Docker,MySQL
- 本番環境 : AWS(EC2、RDS for MySQL、Route53、S3、Lamda、ELB)、Nginx、Puma
