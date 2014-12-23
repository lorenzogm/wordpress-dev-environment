# VVV Auto Bootstrap

Auto-sitesetup designed to be used with [Varying Vagrants Vagrant](https://github.com/10up/varying-vagrant-vagrants/).

To get started:

1. If you don't already have it, clone the [Vagrant repo](https://github.com/Varying-Vagrant-Vagrants/VVV/), perhaps at `~/wordpress-homestead/`.
2. Install the Vagrant hosts updater: `vagrant plugin install vagrant-hostsupdater`
3. Clone this branch of this repo into the `www` directory of your Vagrant as `www/elegantdev`
4. If your Vagrant is running, from the Vagrant directory run `vagrant halt`
5. Followed by `vagrant up --provision`.  Perhaps a cup of tea now? The provisioning may take a while.
6. Remove the MySQL settings at `www/elegantdev/htdocs/wp-config.php` and include the content of `www/elegantdev/htdocs/wp-config-sample.php` at the top to setup the environments configuration.

## Using [Wordmove](https://github.com/welaika/wordmove) to keep all environments synced

If you don't have SSH access, you have to setup `lftp`

* Connect to the virtual machine: `vagrant ssh`

* Install lftp:
```
sudo apt-get install bison debhelper gawk gettext libgnutls28-dev ncurses-dev libreadline-dev pkg-config

wget https://launchpad.net/ubuntu/+archive/primary/+files/lftp_4.5.4.orig.tar.gz
tar -xvf lftp_4.5.4.orig.tar.gz
cd lftp-4.5.4/
./configure
make
sudo make install
```

* Edit `~/.lftprc`

```
set ssl:verify-certificate no
set ssl:check-hostname no
set ftp:ssl-allow false
```

* Edit `/vagrant/www/elegantdev/htdocs/Movefile` to setup your environments.

* Go to `/vagrant/www/elegantdev/htdocs` and and run wordmove to sync your environments

Pushing an entire WordPress to production: `wordmove push -e production --all`

Pulling the production environment to local: `wordmove pull -e production --all`

Then you can visit [http://elegantdev.local](http://elegantdev.local)

Admin credentials:
```
user: admin
pass: admin
```

This code is an adaptation of [https://github.com/simonwheatley/vvv-demo-2](vvv-demo-2)

Thanks to [http://codeforthepeople.com](Simon Wheatley)
