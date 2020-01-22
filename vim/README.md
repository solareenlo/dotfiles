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
    ```bash
    :call dein#install()
    ```

## 使い方
### fzf.vim の使い方
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

### dein を使ったプラグインのアップデートの仕方
```bash
:call dein#update()
```

### leader 確認
```bash
:echo mapleader
```
