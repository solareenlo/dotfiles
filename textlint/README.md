# .textlint
- [textlint](https://github.com/textlint/textlint)で使用するための構成ファイル．

## Usage
- 以下の使い方は，textlint + textlint-vim + prh での使用を想定している．
- vim 内で textlint と prh を使用するということ．

```bash
mkdir test
cd test
npm init -y
npm i -D textlint
npm i -D textlint-rule-prh
curl -O
curl -O
```

後は，vim を開いて，以下を実行する．
```bash
:Textlint
:cwindow
```
