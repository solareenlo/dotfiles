# atcoder-tools
- [kyuridenamida/atcoder-tools](https://github.com/kyuridenamida/atcoder-tools) の設定ファイルと雛形ファイル．


## Usage
```bash
cd
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/atcoder-tools/.atcodertools.toml
mkdir .atcoder-tools
cd .atcoder-tools
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/atcoder-tools/.atcoder-tools/my_template_ab.cpp
curl -O https://raw.githubusercontent.com/solareenlo/dotfiles/master/atcoder-tools/.atcoder-tools/my_template_cd.cpp

pip3 install atcoder-tools

cd ~/github/cpp/05_AtCoder-Beginner-Contest/
atcoder-tools help
atcoder-tools gen abc168
cd abc168/A/
vim main.cpp
atcoder-tools test
atcoder-tools submit
atcoder-tools submit -u
```

## Reference
- [kyuridenamida/atcoder-tools](https://github.com/kyuridenamida/atcoder-tools)
