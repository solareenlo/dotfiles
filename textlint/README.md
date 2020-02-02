# .textlint
- vim で [textlint](https://github.com/textlint/textlint) と prh を使用するための自分なりの構成ファイル．

## Requirement
- git, curl, Node.js, npm, vim

## Install
- 以下は vim 内で textlint と prh を使用するためのインストール方法．
- textlint が Node.js 製なので，npm している．

```bash
mkdir test
cd test
npm init -y
npm i -D textlint
npm i -D textlint-rule-prh
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/textlint/.textlintrc
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/textlint/prh-rules/doc_iotajapan_com.yml
```

- `.textlintrc` の中身を自分が使用する `lint-rules` に変更する．
- 上の例では `doc_iotajapan_com.yml` という `lint-rules` を使用している．

## Usage
後は，vim を開いて，以下を実行する．

```bash
:Textlint // チェックを実行する
:cwindow // エラーを表示する
```

## LICENSE
MIT

## References
- [textlint/textlint](https://github.com/textlint/textlint)
- [yuta-masano/vim-textlint](https://github.com/heavenshell/vim-textlint)
- [prh/prh](https://github.com/prh/prh)
- [textlint-rule/textlint-rule-prh](https://github.com/textlint-rule/textlint-rule-prh)
- [textlint + prhで文章を校正する方法](https://qiita.com/munieru_jp/items/83c2c44fcadb177d2806)
