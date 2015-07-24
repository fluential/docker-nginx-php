#!/usr/bin/env bash
#!/usr/bin/env bash
set -e
cd /tmp
curl -sL http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz > /tmp/ioncube_loaders_lin_x86-64.tar.gz
tar xzf ioncube_loaders_lin_x86-64.tar.gz
EXT_DIR=$(php -i | awk -F ' => ' '/^extension_dir/ {print $2}')
PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")
sudo cp "ioncube/ioncube_loader_lin_${PHP_VERSION}.so" "${EXT_DIR}"
echo "zend_extension=ioncube_loader_lin_${PHP_VERSION}.so" > /etc/php5/mods-available/ioncube.ini
cd /etc/php5/fpm/conf.d/
ln -s ../../mods-available/ioncube.ini 01-ioncube.ini
ln -s ../../mods-available/ioncube.ini /etc/php5/cli/conf.d/01-ioncube.ini
