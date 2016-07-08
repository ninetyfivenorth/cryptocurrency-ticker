#!/usr/bin/env bash

USER_HOME=$(eval echo ~${SUDO_USER})

cp -r ${USER_HOME}/cryptocurrency-ticker-master/.conkyrc ${USER_HOME}

chmod +x ${USER_HOME}/cryptocurrency-ticker-master/cryptocurrency-ticker.py

touch ${USER_HOME}/cryptocurrency-ticker-master/prices.txt

crontab -l > mycron
echo "*/5 * * * * ${USER_HOME}/cryptocurrency-ticker-master/cryptocurrency-ticker.py" >> mycron
crontab mycron
rm mycron       

conky </dev/null &>/dev/null &

echo done
