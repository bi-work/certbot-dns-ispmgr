# certbot-dns-dnsmgr
DNSmanager API for certbot --manual-auth-hook --manual-cleanup-hook

Install and renew Let's encrypt wildcard ssl certificate for domain *.site.com using DNSmanager API:

#### 1) Clone this repo and set the API key
```bash
git clone https://github.com/ZAZmaster/certbot-dns-dnsmgr/ && cd ./certbot-dns-dnsmgr
```

#### 2) Set API KEY

Set your user name, password and host from DNSmanager )

```bash
nano ./config.sh
```

#### 3) Install CertBot from git
```bash
cd ../ && git clone https://github.com/certbot/certbot && cd certbot
```

#### 4) Generate wildcard
```bash
./letsencrypt-auto certonly --manual-public-ip-logging-ok --agree-tos --email info@site.com --renew-by-default -d site.com -d *.site.com --manual --manual-auth-hook ../certbot-dns-dnsmgr/authenticator.sh --manual-cleanup-hook ../certbot-dns-dnsmgr/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```

#### 5) Force Renew
```bash
./letsencrypt-auto renew --force-renew --manual --manual-auth-hook ../certbot-dns-dnsmgr/authenticator.sh --manual-cleanup-hook ../certbot-dns-dnsmgr/cleanup.sh --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory
```
