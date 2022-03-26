cd /tmp
wget https://go.dev/dl/go1.18.linux-amd64.tar.gz
mkdir /gui
tar -xzvf go1.18.linux-amd64.tar.gz -C /gui
cd /gui/go/bin
./go version
ln -s /gui/go/bin/go /usr/local/bin/go
cd
echo 如果是-bash: go: command not found 提交issue if there has -bash: go: command not found please make a issue
go version
apt install make  curl wireguard-tools git -y
cd /tmp
wget https://git.zx2c4.com/wireguard-go/snapshot/wireguard-go-0.0.20220316.zip
unzip wireguard-go-0.0.20220316.zip
cd wireguard-go-0.0.20220316
make
cp wireguard-go /usr/local/bin
cd /tmp
rm -rf wireguard-go-0.0.20220316
rm wireguard-go-0.0.20220316.zip
wg genkey | tee private key | wg pubkey > publickey
ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf
ln -sf /lib/systemd/system/systemd-resolved.service /etc/systemd/system/dbus-org.freedesktop.resolve1.service
echo 部分安装完成 请手动配置/lib/systemd/system/wg-quick@.service	“Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity ”这行的下方，插入一行:		Environment=WG_I_PREFER_BUGGY_USERSPACE_TO_POLISHED_KMOD=1

wget 