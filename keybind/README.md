# Linux でキーバンドを変更する
**Reference:** [キーバインドの変更 Xmodmapの基本的な設定方法](https://qiita.com/macinjoke/items/746c0c0adb74cfdeb9e7)

## やること
Xmodmap を使ってキーボード配列を変更する．

- **Caps Lock** キーを **Ctrl** キーにする
- **変換**キーと**無変換**キーを **Esc** キーにする
- **カタカナひらがなローマ字**キーを **Alt** キーにする(右 Alt キーが無い場合)

今回はこの設定をしますが自分の好みに合わせて変更可能です．

### この設定をするとうれしいこと
- Ctrl が押しやすくなりショートカットキーが素早く押せる．
- 普段使わない変換キーと無変換キーを有効活用できる．両方の手の親指で Esc が素早く押せる．(Vim 使用時などに便利)
- 右に Alt キーが無いノート PC などでも右 Alt が使える．

## 結果
`~/.Xmodmap` に設定を書くことでキーバインドを変更できる．結果として完成形を先に挙げます．

```bash
# ~/.Xmodmap
remove lock = Caps_Lock

keycode 66 = Control_L
keycode 102 = Escape
keycode 100 = Escape
keycode 101 = Alt_R

add control = Control_L
add mod1 = Alt_R
```

## 調べる
上記の `keycode 102 = Escape` という記述は keycode (物理的なキーのコード)102のキーを Escape という keysym (役割)に割り当てることを意味します．

どのキーがどの keycode に割り当てられているのかを知るためには `xev` コマンドを使います．


```bash
$ xev
```

実行すると Event Tester ウィンドウが現れます．ここで何かキーを押してみると KeyPress event と KeyRelease event の中にそれぞれ keycode と keysym が書かれています．
下記は無変換キーを押した時の例です．

```bash
KeyPress event, serial 37, synthetic NO, window 0x4a00001,
    root 0x9d, subw 0x0, time 19970788, (-774,223), root:(408,275),
    state 0x0, keycode 102 (keysym 0xff22, Muhenkan), same_screen YES,
    XLookupString gives 0 bytes:
    XmbLookupString gives 0 bytes:
    XFilterEvent returns: False

KeyRelease event, serial 37, synthetic NO, window 0x4a00001,
    root 0x9d, subw 0x0, time 19970888, (-774,223), root:(408,275),
    state 0x0, keycode 102 (keysym 0xff22, Muhenkan), same_screen YES,
    XLookupString gives 0 bytes:
    XFilterEvent returns: False

```

これで無変換キーは keycode 102 で Muhenkan という keysym であることが分かります．
今回のように keycode と keysym だけ知りたいのであれば

```bash
$ xev | grep keycode
```
などとすると見やすくなるのでオススメです．

また keysym の一覧は `/usr/include/X11/keysymdef.h` に記述されています．XK_ というプレフィクスを取り除いたものが keysym です．

## 実際の設定

### キーコード
上記のようにしてkeycode と keysym を調べたら表にしてまとめてみます．

|物理的なキー      | キーコード | 新しいkeysym |
|:----------------|:-----------|:-------------|
| Caps Lock       | 66         | Control_L    |
| 無変換          | 102        | Escape       |
| 変換            | 100        | Escape       |
| ひらがなカタカナ | 101        | Alt_R        |

これをそのまま書き出します．

```bash
# ~/.Xmodmap

keycode 66 = Control_L
keycode 102 = Escape
keycode 100 = Escape
keycode 101 = Alt_R

```

### モディファイアキー
これだけで済めば割と楽なのですが Caps Lock と Control キーと Alt_R は[モディファイアキー](http://e-words.jp/w/%E4%BF%AE%E9%A3%BE%E3%82%AD%E3%83%BC.html)であるため，別の設定をしなければなりません．
$xmodmap を実行しモディファイアキー一覧とそれに対応する keysym を表示します．


```bash
$ xmodmap
xmodmap:  up to 4 keys per modifier, (keycodes in parentheses):

shift       Shift_L (0x32),  Shift_R (0x3e)
lock        Caps_Lock (0x42)
control     Control_L (0x25),  Control_R (0x69)
mod1        Alt_L (0x40),  Alt_R (0x6c),  Alt_L (0xcc),  Meta_L (0xcd)
mod2        Num_Lock (0x4d)
mod3
mod4        Super_L (0x85),  Super_R (0x86),  Super_L (0xce),  Hyper_L (0xcf)
mod5        ISO_Level3_Shift (0x5c),  Mode_switch (0xcb)

```

lock から Caps_Lock を削除します．

```bash
remove lock = Caps_Lock
```

新しく割り当てられた Control_L の keysym を control モディファイアに Alt_R の keysym を mod1 モディファイアに追加します．

```bash
add control = Control_L
add mod1 = Alt_R
```

removeadd，keycode の書く順番は remove → keycode → add とするのが良いとされています．すなわち，

1. remove で元のモディファイア設定を消す．
2. keycode で keysym を割り当てる．
3. add で keysym をモディファイアに追加する．

という順序です．

### もう一度結果
以上を踏まえると `~/.Xmodmap` は下記のようになります．

```bash
# ~/.Xmodmap
remove lock = Caps_Lock

keycode 66 = Control_L
keycode 102 = Escape
keycode 100 = Escape
keycode 101 = Alt_R

add control = Control_L
add mod1 = Alt_R
```

## 設定を反映させる

### デフォルトの設定を作る
設定を反映させる前にデフォルトのキーバインド設定ファイルをつくっておきます．後で簡単に戻すためです． 現在の全てのkeycodeの割り当てを表示する $ xmodmap -pke を使います．

```bash
$ xmodmap -pke > ~/.Xmodmap_default
```

~/.Xmodmap_default が作られます．このファイルの先頭に以下を追加します．clear shift は shift に割り当てられている keysym を全て remove することを意味しています．

```bash
clear shift
clear lock
clear control
clear mod1
clear mod2
clear mod3
clear mod4
clear mod5
```

次に $ xmodmap の出力結果を参考にしてファイルの末尾に下記のように追加します．

```bash
add shift = Shift_L Shift_R
add lock = Caps_Lock
add control = Control_L Control_R
add mod1 = Alt_L Alt_R Meta_L
add mod2 = Num_Lock
add mod4 = Super_L Super_R Super_L Hyper_L
add mod5 = ISO_Level3_Shift Mode_switch
```

結果このようなファイルができあがります．

```bash
# ~/Xmodmap_default
clear shift
clear lock
clear control
clear mod1
clear mod2
clear mod3
clear mod4
clear mod5

keycode   8 =
keycode   9 = Escape NoSymbol Escape
keycode  10 = 1 exclam 1 exclam

(中略)

keycode 254 =
keycode 255 =

add shift = Shift_L Shift_R
add lock = Caps_Lock
add control = Control_L Control_R
add mod1 = Alt_L Alt_R Meta_L
add mod2 = Num_Lock
add mod4 = Super_L Super_R Super_L Hyper_L
add mod5 = ISO_Level3_Shift Mode_switch

```

### 設定を反映させる
下記を実行します．

```bash
$ xmodmap ~/.Xmodmap
```

これで設定したキーバインドが有効になっているはずです．PC を再起動しても設定が反映されます．
元に戻すには下記を実行します．

```bash
$ xmodmap ~/.Xmodmap_default
```

(デフォルトの設定に戻すもっと簡単な方法があったら教えてください...．)

## まとめ
他にも好みに合わせて様々な設定が可能．詳しくは $ man xmodmap を参照されたし．
