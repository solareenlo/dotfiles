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

3. ディレクトリなどの絵文字を表示するための nerd フォントをインストールする.

- https://github.com/ryanoasis/nerd-fonts#patched-fonts

- Linux の場合
  - パッチ済みフォントを直接ダウンロードする方法
    - 上記のリンクから好きなフォントを選んで, `nerd-fonts/patched-fonts/Hack/Regular/complete/` のように進んで, `*.ttf` や `*.otf` を `~/.fonts` ディレクトリに保存する.
      ```bash
      # そして以下を実行する
      fc-cache -fv
      ```
  - リリースアーカイブから直接フォントをダウンロードする方法
    - https://github.com/ryanoasis/nerd-fonts/releases/latest に行って，`Hack.zip` を `~/.fonts` に解凍する．
      ```bash
      # そして，以下を実行する
      fc-cache -fv
      ```
  - curl を使う方法
    ```bash
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    ```
- macOS の場合
  - brew を使う方法
    ```bash
    brew tap homebrew/cask-fonts
    brew cask install font-hack-nerd-font
    ```
  - curl を使う方法
    ```bash
    cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    ```

4. 日本語用のプログラミング用のフォントの [miiton/Cica](https://github.com/miiton/Cica) をインストールする．
  - 上記サイトから Cica フォントをビルドしても，リリースアーカイブからダウンロードしてもよいので，`*.ttf` ファイルを `~/.fonts` に保存する．
      ```bash
      # Linux の場合は，以下を実行する
      fc-cache -fv
      ```
  - 上記を実行して，端末のフォント設定で Cica が選択できないときは，`gsettings` を利用して設定する．
      ```bash
      # プロファイルのリストを取得する
      gsettings get org.gnome.Terminal.ProfilesList list
      > ['b1dcc9dd-5262-4d8d-a863-c897e6d979b9']
      # 上記のプロファイルのインデックスは0なので，以下のように0を指定して，プロファイルのキーのリストの中から font が有ることを確認する
      gsettings list-keys org.gnome.Terminal.Legacy.Profile:/:0/ | grep font
      > use-system-font
      > font
      # 以下でダウンロードした Cica の表記の仕方を確認する
      fc-list | grep Cica
      > /path/to/the/.fonts/Cica-BoldItalic.ttf: Cica:style=Bold Italic
      > /path/to/the/.fonts/Cica-RegularItalic.ttf: Cica:style=Italic
      > /path/to/the/.fonts/Cica-Bold.ttf: Cica:style=Bold
      > /path/to/the/.fonts/Cica-Regular.ttf: Cica:style=Regular
      # 以下で Cica Regular フォントを設定する
      gsettings set org.gnome.Terminal.Legacy.Profile:/:0/ font Cica:style=Regular
      ```

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
```vim
:call dein#update()
```

### leader 確認
```vim
:echo mapleader
```

### vim-textlint + prh の使い方
- [textlint](https://github.com/textlint/textlint) ... テキストをリントしてくれる node.js 製ツール．
- [vim-textlint](https://github.com/heavenshell/vim-textlint) ... textlint を vim で使えるようにしたもの．
- [textlint-rule-prh](https://github.com/textlint-rule/textlint-rule-prh) .. textlint で [prh](https://github.com/prh/prh) を使えるようにしたもの．
- の3つを使用する．

#### Install & Usage
##### 単に vim-textlint に prh を使う方法
- https://github.com/solareenlo/dotfiles/tree/master/textlint を参照のこと．

##### 自分なりの rule を作成して，それを npm に登録して，.vimrc から使う方法
1. my-lint-rule を作成するか，[lint 例](https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule)から lint-rules をダウンロードする．
2. npm に my-lint-rule を登録する．
3. `~/.vimrc` の textlint 部分に登録した my-lint-rule を追加する．
4. vim で markdown を開いて以下を実行する．
    ```vim
    :Textlint -c @solareenlo/my-lint-rule // markdown に対して指定したルールで lint をかけてくれる
    :cwindow // エラーを表示する
    ```

  Referece: [heavenshell/vim-textlint](https://github.com/heavenshell/vim-textlint)
