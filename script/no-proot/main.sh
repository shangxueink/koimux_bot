# chromium ref. https://blog.utermux.dev/ut/chromium.html
pkg rei tur-repo -y
# pkg i chromium -y
# pkg i ffmpeg -y
# ref. https://www.reddit.com/r/termux/comments/16dzkhg/libexpatso1_not_found_termux/?rdt=58766
# pkg rei libexpat -y

# 安装nodejs, yarn
pkg i nodejs-lts -y
npm config set registry https://registry.npmmirror.com
npm i -g yarn

# 安装 koishi
if [ ! -f "~/koishi/koishi.yml" ]; then
    mkdir -p ~/koishi
    version=$(curl -Ls "https://api.github.com/repos/koishijs/boilerplate/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    curl -L -o ~/boilerplate.zip https://mirror.ghproxy.com/https://github.com/koishijs/boilerplate/releases/download/${version}/boilerplate-${version}-linux-arm64-node20.zip
    unzip ~/boilerplate.zip -d ~/koishi
    rm ~/boilerplate.zip
fi

echo '#!/bin/bash' > $PREFIX/bin/koishi
echo 'echo "正在启动 Koishi"' >> $PREFIX/bin/koishi
echo 'cd ~/koishi && yarn start &' >> $PREFIX/bin/koishi
chmod +x $PREFIX/bin/koishi
echo "Koishi 已安装，在 ~/koishi 目录"
echo "现在你可以输入命令 \e[32mkoishi\e[0m 来启动 Koishi"