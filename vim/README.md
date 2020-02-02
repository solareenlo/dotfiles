# vim-config
vimの設定ファイル.

## Usage
1. まずはdeinをインストールする.
- https://github.com/Shougo/dein.vim

2. 次にvimのバックアップ用のディレクトリを作成する.
    ```bash
    cd
    mkdir .vimbackup
    ```

3. ディレクトリなどの絵文字を表示するためのフォントをインストールする.

- https://github.com/ryanoasis/nerd-fonts#patched-fonts

- Linux の場合、上記のリンクから好きなフォントを選んで, `nerd-fonts/patched-fonts/Ubuntu/Regular/complete/` のように進んで, `*.ttf` や `*.otf` を `~/.fonts` ディレクトリに保存する.
- macOS の場合は、上記のリンクの README.md ファイルを読んで brew を使ってインストールするのが楽です.

4. ターミナルを開いて, 先程インストールしたフォントを設定する.

5. [junegunn/fzf](https://github.com/junegunn/fzf#using-git)をインストールする．
    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    ```

6. `.vimrc`をダウンロードする.
    ```bash
    cd
    curl -O https://raw.githubusercontent.com/solareenlo/vim-config/master/.vimrc
    ```

7. `dein.vim`を使ってプラグインをインストールする.
    ```vim
    :call dein#install()
    ```

## 使い方
### fzf.vim の使い方
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

### dein を使ったプラグインのアップデートの仕方
```
:call dein#update()
```

### leader 確認
```bash
:echo mapleader
```

### vim-textlint + prh の使い方
- [textlint](https://github.com/textlint/textlint) ... テキストをリントしてくれる node.js 製ツール．
- [vim-textlint](https://github.com/heavenshell/vim-textlint) ... textlint を vim で使えるようにしたもの．
- [textlint-rule-prh](https://github.com/textlint-rule/textlint-rule-prh) .. textlint で [prh](https://github.com/prh/prh) を使えるようにしたもの．
- の3つを使用する．

#### インストール
1. textlint が node.js で動くので，まずは `npm init -y` を行う．
    ```bash
    mkdir test
    cd test
    npm init -y
    npm i -D textlint
    npm i -D textlint-rule-prh
    ./node_modules/.bin/textlint --init
    ```
2. [Collection of textlint rule](https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule) から使用するリントルールをインストールする．
    ```bash
    ```
1. my-lint-rule を作成するか，[lint 例](https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule)からダウンロードする．
2. npm に my-lint-rule を登録する．
3. `~/.vimrc` の textlint 部分に登録した my-lint-ruru を追加する．
4. vim で markdown を開いて以下を実行する．
    ```vim
    :Textlint - c @solareenlo/my-lint-rule // markdown に対して指定したルールで lint をかけてくれる
    :cwindow // エラーを表示する
    ```

Referece: [heavenshell/vim-textlint](https://github.com/heavenshell/vim-textlint)
