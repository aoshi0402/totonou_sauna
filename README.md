# :bulb:サウナで"ととのう"
サウナで"ととのう"はサウナの検索、レビューサイトです。<br />
全国の登録されたサウナ、レビューにいち早くアクセスできます。

![top-page](https://user-images.githubusercontent.com/68432256/99056606-e1217b00-25dd-11eb-910f-e624366b00fd.jpg)

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

上記の経験を踏まえ、<br />
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
- 今いる自分の位置からすぐ近くにあるサウナの情報にアクセスできるよう**現在地からすぐ近くのサウナにアクセス**できる様に実装しました。

## :books: 機能一覧

https://docs.google.com/spreadsheets/d/1pPd1_RFeBQe0W8Pw1cVKYVdRVoPZQAVPavUzoRps5xM/edit?usp=sharing

<br />

## :orange_book: ER図

https://drive.google.com/file/d/114vR3HL2iOFpXr2NI_hdX1ZD1im7-HSs/view?usp=sharing

<br />

## :wrench: インフラ構成図

![infra](https://user-images.githubusercontent.com/68432256/100052499-6835e500-2e61-11eb-9bce-f0d28f29d2c4.png)


## :closed_book: 使用技術、開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- 仮想環境：Vagrant,VirtualBox
- 本番環境 : AWS(EC2、RDS for MySQL、Route53、S3、Lamda)、Nginx、Puma

<!-- #circleci test -->




