#!/bin/bash

if [ "$1" -eq "kur" ]; then
    NODE_MAJOR=18

    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt update

    sudo apt install software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update

    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget -O- https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor > pgsql.gpg
    sudo mv pgsql.gpg /etc/apt/trusted.gpg.d/pgsql.gpg
    sudo apt update

    wget https://github.com/limanmys/core/releases/download/release.feature-new-ui.863/liman-2.0-RC2-863.deb
    sudo apt install ./liman-2.0-RC2-863.deb


elif ["$1" -eq "kaldır"]; then
apt remove liman-2.0-RC2-863.deb


elif ["$1" -eq "adminstrator"]; then
sudo limanctl administrator

elif["$1" -eq "reset <mail>"]; then
sudo limanctl reset administrator@liman.dev 

elif ["$1" -eq "help"]; then 
HAVELSAN Liman Merkezi Yönetim Sistemi(MYS) 2.0 sürümü ile görsel ve özellik olarak zenginleşen ürünü kurmak için aşağıdaki adımları takip edebilirsiniz.
echo "  kur: Liman ve bağımlılıklarını kurar."
echo "  kaldır: Liman ve bağımlılıklarını kaldırır."
echo "  administator: Sudo yetkisine sahip kullanıcıları listeler."
echo "  reset <mail> : Daha önce oluşturduysanız, eski bir sürümden güncellediyseniz veya parolanızı kaybettiyseniz ise aşağıdaki komutu kullanarak admin kullanıcısı için yeni parola oluşturabilirsiniz."
echo "  help: Bu yardım mesajını görüntüler."

fi
