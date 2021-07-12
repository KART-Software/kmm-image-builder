# kmm-image-builder
kart-machine-managerのSDカード自動作成ツール

## Requirements
- vagrant
- virtualBox
- make

## Commands
vagrant環境起動
```
make up
```
OSイメージ作成
```
make build-image
```
vagrant環境にsshで接続
```
make ssh
```
vagrant環境の削除
```
make destroy
```

## 注意点
https://github.com/solo-io/packer-builder-arm-image/pull/101/files

provision-build-env.shが悪さをしているので、とりあえずこの変更分は取り消してください。