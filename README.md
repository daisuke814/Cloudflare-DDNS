編集中

# CloudflareでダイナミックDNSを利用する方法について
このスクリプトはCloudflareでダイナミックDNS（DDNS）を利用するために作成しました。<br>

# DNSの書き換えのプロセス
操作の流れとしてIPアドレスの取得を行い、予め設定しておいたレーコドへ変更するという流れになります。

# ファイルの説明
|ファイル名|説明|
|:---|:---|
|cloud_look.sh|Record_IDを取得するスクリプト|
|cloudflare.sh|指定したレコードへIPアドレスを変更するスクリプト|

# 本スクリプトの使用方法
## 必要な情報
Cloudflareでレコードを変更するには対象となるレコードを有するアカウントの情報が必要です。<br>
|変数名|概要|
|:---|:---|
|Global_Key|CloudflareのグローバルAPIキー|
|Zone_ID|ドメイン毎に割り当てられているID|
|Record_ID|1レコードのID（cloud_look.shで取得しなければならない）|
|Email|Cloudflareにログインするためのメールアドレス|
|Record_Name|変更したいレコード名（サブドメインまで含める）|
以上がスクリプト内ある変数の大まかな説明です。

### グローバルキー（Global_Key）
### ゾーンID（Zone_ID）
### レコードID（Record_ID）
### メールアドレス（Email）
### レコード名（Record_Name）

## レコードID（Record_ID）の取得 ※cloud_look.sh
レコードID（Record_ID）を取得するには`cloud_look.sh`を使用して取得します。<br>
`cloud_look.sh`に必要となる情報を記述して実行します。<br>
まずは、以下の項目に情報を記述します。<br>
```Bash:cloud_look.sh
##################################################################
#   API Key
##################################################################

Global_Key="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Zone_ID="xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
Email="example@example.com"
Record_Name="example.com"
```


# Cronを使用して定期的にCloudflareにIPアドレスを通知
本スクリプトをCronで定期的にCloudflareにIPアドレスを通知する必要があります。<br>
`cron -e`よりCronを記述します。<br>
30分毎に通知する場合は以下の記述を施します。
```
*/30 * * * * cloudflare.sh
```
パーミッションは777へ変更し、適切なディレクトリへの移動とパスをCronへ記述してください。

# 必須となるコマンドと環境
スクリプトにはcurlコマンドを主に使用しています。<br>
また、IPアドレスを取得するために以下のサイトを使用しています。<br>
https://api.ipify.org<br>
hostsファイルで制限されている或いはサイトにアクセスできないなどの場合は`cloudflare.sh`の19行目のアドレスを変更します。<br>

# 参考リンク
https://community.cloudflare.com/t/update-dns-records-via-api/132221
