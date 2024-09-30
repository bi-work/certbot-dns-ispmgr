# certbot-dns-ispmgr
ISPmanager API for certbot --manual-auth-hook --manual-cleanup-hook

Install and renew Let's encrypt wildcard ssl certificate for domain *.site.com using ISPmanager API:

#### 1) Clone this repo and set the API key
```bash
git clone https://github.com/bsidev/certbot-dns-ispmgr && cd ./certbot-dns-ispmgr && chmod +x *.sh
```

#### 2) Set API KEY

Rename config.sh.dist to config.sh
```bash
cp ./config.sh.dist ./config.sh
```


Set your user name, password and host from ISPmanager:

```bash
nano ./config.sh
```

#### 3) Install CertBot from git
```bash
cd ../ && git clone https://github.com/certbot/certbot && cd certbot
```

#### 4) Generate wildcard
```bash
./letsencrypt-auto certonly --manual-public-ip-logging-ok --agree-tos --email info@site.com --renew-by-default -d 'site.com' -d '*.site.com' --manual --manual-auth-hook ../certbot-dns-ispmgr/authenticator.sh --manual-cleanup-hook ../certbot-dns-ispmgr/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```

#### 5) Force Renew
```bash
./letsencrypt-auto renew --force-renew --manual --manual-auth-hook ../certbot-dns-ispmgr/authenticator.sh --manual-cleanup-hook ../certbot-dns-ispmgr/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```
