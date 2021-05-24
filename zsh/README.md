# zsh の構成ファイル
- oh-my-zsh のカスタマイズが定番．

## Usage
### Mac
```bash
# oh-my-zsh のインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)")

# Hack Nerd Font のインストール
# Mac なら以下を実行するのが簡単．
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
# Linux や自分の好きな Nerd Font をインストールするなら ../vim/ の項目を参照のこと.

# oh-my-zsh のテーマ powerlevel9k のインストール
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# シンタックスハイライトのプラグインのインストール
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# コマンドの自動保管のプラグインのインストール
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf のインストール
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

### Ubuntu
```bash
# 依存関係の更新
sudo apt update
sudo apt upgrade -y

# zsh と oh-my-zsh のカスタマイズに必要なフォントなどインストール
sudo apt install zsh powerline fonts-powerline

# デフォルトのシェルを zsh に変更する
chsh -s $(which zsh)

# oh-my-zsh のインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)")

# oh-my-zsh のテーマ powerlevel9k のインストール
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# シンタックスハイライトのプラグインのインストール
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# コマンドの自動保管のプラグインのインストール
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fzf のインストール
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# 予め作ってある .zshrc のダウンロード
cd
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/zsh/.zshrc.ubuntu
mv .zshrc.ubuntu .zshrc

# ターミナルの再読み込み
exec $SHELL -l
```

## `oh-my-zsh` のインストール
- [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) を参照のこと．

## `oh-my-zsh` のテーマ
- `agnoster` がオススメ．
- `powerlevel9k` がおすすめ．

## Reference
- [Macのターミナル（iTerm）で生産性を上げるための方法](https://ottan.xyz/terminal-zsh-customize-20190505/)
