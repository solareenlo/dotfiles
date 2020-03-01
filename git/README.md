# git の構成ファイル
- git の構成ファイルは `.gitconfig` です．
- `.gitconfig` の配置場所は，`~/.gitconfig` です．

# Usage
```bash
cd
culr -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/git/.gitconfig
```

or

```bash
# ユーザー名を登録
git config --global user.name "solareenlo"
# メールアドレスを登録
git config --global user.email "solareenlo@test.com"
# 色づける
git config --global color.ui true
# commitしたときのエディタをvimに設定する
git config --global core.editor vim
# 大文字・小文字を区別する
git config --global core.ignorecase false
git config --system core.ignorecase false
# エイリアスの設定
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cm 'commit -m'
git config --global alias.a 'add .'
# エイリアスの確認
git config --global --list | grep ^alias\.
# 設定一覧を見る
git config -l
# helpを見る
git config --help
```
