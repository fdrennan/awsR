#!/bin/bash
echo $'deb https://cloud.r-project.org/bin/linux/ubuntu disco-cran35/' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install r-base -y
sudo apt-get install libcurl4-openssl-dev -y
sudo apt-get install libgit2-dev -y
sudo apt-get install libssl-dev -y
sudo apt-get install libssh2-1-dev -y
sudo apt-get install gdebi-core
sudo apt-get install python3-pip -y
sudo apt-get install libpq-dev -y
sudo apt-get install libxml2-dev -y
sudo /usr/bin/pip3 install virtualenv
sudo apt-get install python3-venv
wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.1335-amd64.deb
yes | sudo gdebi rstudio-server-1.2.1335-amd64.deb
sudo apt install postgresql postgresql-contrib -y
CONF_FILE=$(find / -name "postgresql.conf" | grep main)
PG_FILE=$(find / -name "pg_hba.conf" | grep main)
echo "listen_addresses = '*'" >> $CONF_FILE
echo "host    all             all             0.0.0.0/0               md5" >> $PG_FILE
echo "host    all             all             ::/0                    md5" >> $PG_FILE
echo "#!/bin/bash" >> /tmp/update_pass
echo  "sudo -u postgres -H -- psql -c \"ALTER USER postgres PASSWORD 'password'\"" >> /tmp/update_pass
sh /tmp/update_pass
service postgresql stop
service postgresql start
/usr/bin/curl -X POST https://textbelt.com/text \
                              --data-urlencode phone='5555555555' \
                              --data-urlencode message='Find Your Phone!' \
                              -d key=textbelt
