### インストール
- CocoaPodsをインストールする
CocoaPodsはライブラリを管理するソフト
```sh
(you@phf-201609/adokore)
$ sudo gem update --system
$ sudo gem install activesupport -v 4.2.6
$ sudo gem install cocoapods
$ pod setup #ホームにcocoapodsのリポジトリがチェックアウトされる
$ pod install #Podfileに記述したライブラリをインストールする
```

- `adokore.xcworkspace`を開く (xcodeprojの代わりに今後はこれを使う)
- buildを実行する

### phpのデプロイ
```sh
(you@adokore/php)
$ scp service.php niraer@160.16.119.131:/var/www/tadaserver
$ scp ad.php niraer@160.16.119.131:/var/www/tadaserver
$ scp -r images niraer@160.16.119.131:/var/www/tadaserver
```
