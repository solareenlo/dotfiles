# zsh の構成ファイル
- oh-my-zsh のカスタマイズが定番．

## Usage
```bash
# oh-my-zsh のインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)")

# Hack Nerd Font のインストール
# Mac なら以下を実行するのが簡単．
brew cask install font-hack-nerd-font
# 自分の好きな Nerd Font をインストールするなら /dotfile/vim/ の項目を参照のこと.

# oh-my-zsh のテーマ powerlevel9k のインストール
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# シンタックスハイライトのプラグインのインストール
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# コマンドの自動保管のプラグインのインストール
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf のインストール
# Mac なら以下を実行する
brew install fzf
$(brew --prefix)/opt/fzf/install
# brew を使わないのであれば以下を参照のこと．
# https://github.com/junegunn/fzf

# 予め作ってある .zshrc のダウンロード
cd
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/zsh/.zshrc

# ターミナルの再読み込み
exec $SHELL -l
```

## `oh-my-zsh` のインストール
- [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) を参照のこと．

## `oh-my-zsh` のテーマ
- `agnoster` がオススメ．

## `oh-my-zsh` の追加要素
```bash
plugins=(git docker docker-compose)
```

## Reference
- [Macのターミナル（iTerm）で生産性を上げるための方法](https://ottan.xyz/terminal-zsh-customize-20190505/)
