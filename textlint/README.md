# .textlint
- [textlint](https://github.com/textlint/textlint) で使用するための構成ファイル．

## Usage
- 以下は vim 内で textlint と prh を使用するための方法．

```bash
mkdir test
cd test
npm init -y
npm i -D textlint
npm i -D textlint-rule-prh
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/textlint/.textlintrc
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/textlint/prh-rules/doc_iotajapan_com.yml
```

後は，vim を開いて，以下を実行する．
```bash
:Textlint
:cwindow
```

## References
- [textlint/textlint](https://github.com/textlint/textlint)
- [yuta-masano/vim-textlint](https://github.com/heavenshell/vim-textlint)
- [prh/prh](https://github.com/prh/prh)
- [textlint-rule/textlint-rule-prh](https://github.com/textlint-rule/textlint-rule-prh)
- [textlint + prhで文章を校正する方法](https://qiita.com/munieru_jp/items/83c2c44fcadb177d2806)
