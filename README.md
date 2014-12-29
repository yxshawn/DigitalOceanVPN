DigitalOceanVPN
===============

Turn the droplet on Digital Ocean into a VPN server

##How to use:

1. Create a droplet on [DigitalOcean](https://www.digitalocean.com/?refcode=8cb201825379)
2. Select "Ubuntu 10.04 x64" in distributions
3. [optional] Add SSH Keys when creating the droplet
4. Login to the droplet and run **installvpn.sh**

Please change the user name and password in the script before using it.

```
echo "username1	pptpd	password1	*" >> /etc/ppp/chap-secrets
```

Enjoy your VPN :)


===================

# For users in mainland China

此脚本用于在DigitalOcean的服务器上自动创建VPN服务以实现自动翻墙。同时也可以提高到在公共网络（例如咖啡厅）下上网的安全性。
DigitalOcean的最低服务器费用为$5/mo ，比在淘宝上买一个不安全的VPN要划算很多。

##使用方法：

1. 在[DigitalOcean](https://www.digitalocean.com/?refcode=8cb201825379)上注册（自动获得$10）并且创建一个Droplet(服务器) 
2. 选择镜像系统为"Ubuntu 10.04 x64"
3. [推荐，但不必须] 在创建Droplet时添加SSH Keys
4. 登录系统，并且执行 **installvpn.sh** 脚本

注意， 在使用脚本前请修改脚本中的用户名和密码。 这将会是你拨叫VPN时使用的用户名和密码

```
echo "用户名	pptpd	密码	*" >> /etc/ppp/chap-secrets
```


