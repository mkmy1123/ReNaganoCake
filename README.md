<br>

# NAGANO CAKE / ながのCAKE
<br>
<br>

![screen_shot](https://user-images.githubusercontent.com/61111655/81570523-ab57cb80-93db-11ea-8ac2-374789ee3d96.png)
<br>
<br>
## このアプリケーションについて
ご覧いただきありがとうございます。<br>
こちらはDMMWEBCAMPカリキュラム内で作成したWEBアプリケーションです。<br>
架空の洋菓子店の通販用サイトとして作成しています。<br>
<br>
<br>
<br>

## 挙動確認
実際の稼働は
[こちらのページ](https://nagano--cake.herokuapp.com/ "ながのCAKE")からご覧ください。<br>
申し訳ございませんが、あくまで実験的にデプロイしたものであり、動作の保証までには至っておりません。<br>
深くご興味を持っていただける方はお手数ですが、最新のマスターブランチをぜひクローンしていただき、ローカル環境からご使用くださいませ。<br>
<br>

- - - -
<br>

### 簡単な説明
長野県にある架空の小さな洋菓子店が全国的に通販を行うために開発されたアプリケーションです。<br>
ECサイトと管理サイトに分かれており、管理から注文まで使用できるよう設計、実装しました。<br>
会員機能が実装されており、会員種別としては （管理者）ADMIN / （顧客）CUSTOMER と分かれております。<br>
洋菓子店が使用するサイトを管理サイト、顧客側が使用するのがECサイトとして作成しました。<br>
<br>

- - - -
<br>

### 設計書類
[データベース定義書](https://docs.google.com/spreadsheets/d/1POVmOp87sUHgutYseOpbo3gDFQyR1miLRyzKWHD39C4/edit#gid=0 "データベース")<br>
[詳細設計](https://docs.google.com/spreadsheets/d/1uaqupkp2Ck3yhx_JauBulI9MTZytGY0MRpYqtyDevtQ/edit#gid=1763942251 "詳細設計")<br>
上記から閲覧できるようになっています。<br>
<br>

- - - -
<br>

### 使用言語
*  HTML
* CSS(SCSS)
* JavaScript
* Ruby on Rails(5.2.4)

<br>

- - - -
<br>

### 特筆すべきgem
* devise
* refile
* fontawesome
* kaminari
* jquery-rails
* bootstrap

<br>

- - - -
<br>

### 使用方法
seedsファイルにユーザーのお試しが入っております。<br>
Admin { email: test@test.com / password: 'testtest' }<br>
Customer { email: customer@test.com / password: 'customer' }<br>
上記で、どちらの会員種別でもログインしていただけます。<br>
新規顧客登録はお試しでどなたでも追加いただけます。<br>

<br>

- - - -
<br>

### 作者
個人GitHubへのリンクを記載しておきます。<br>
何か問題やアドバイスがございましたら謹んでお受けしたいのでぜひお問い合わせください。<br>
<br>
田中亮[( マヤ )](https://github.com/RyoTanaka0531 "個人GitHub") / 三木辰哉[( みっきー )](https://github.com/MikiTatsuya199699 "個人GitHub") / 宮川真季[( まっきー )](https://github.com/mkmy1123 "個人GitHub")