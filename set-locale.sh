#!/bin/bash

echo "do you need to set a global locale(language only) for *single user* [y/n] ???
read -p prompt value
if [$value=='y']
then
  locale -a
  echo "what is your locale"
  read -p prompt zone
  cd /.
  cd root
  echo "LANG=$zone
  export LANG">>.bash_profile | .bashrc
else
  locale
  echo "This is your timezone..."
  locale status

  echo "do you want to set system locale(language)?"
  read -p "enter [y/n]" option
  if [$option=='y']
  then
    locale -a
    echo "Type the locale from the list above(with utf coding)."
    read -p prompt $zone1
    sudo cd /.
    sudo cd etc/default/
    sudo rm -rf locale
    echo "LANG=$zone1
    LC_TIME=$zone1>locale
    sudo update-locale LANG=$zone LANGUAGE
    export LANG
    export LC_TIME
    locale -k LC_TIME
fi
