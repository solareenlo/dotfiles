# tmux の構成ファイル
- tmux の構成ファイルは`.tmux.conf`です．
- 配置場所は `~/.tmux.conf` です．

## Usage
```bash
cd
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/tmux/.tmux.conf
# Mac の場合はそのまま使える
# Ubuntu の場合は Mac Win 用の行をコメントアウトしてから以下を実行する

# ターミナルの再読込
exec $SHELL -l
```

### tmux の基本的な操作方法
- `.tmux.conf` のコメントで色々書かれています．

## References
- [tmuxを必要最低限で入門して使う](https://qiita.com/nl0_blu/items/9d207a70ccc8467f7bab)
- https://github.com/Neos21/dotfiles/blob/master/.tmux.conf

## License
MIT
