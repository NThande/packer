#!/bin/bash
set -e
export PATH="$HOME"/.pyenv/bin:"$PATH"

#Install dependencies
sudo yum install -y openssl-devel sqlite-devel bzip2-devel xz-libs tk-devel gdbm-devel ncurses-devel readline-devel xz git patch

    #Grant curl permissions
    #sudo chown root /  && chown root /etc/ && chown root /etc/ssl/ && chown root /etc/ssl/certs/ && chown root /etc/ssl/certs/ca-certificates.crt
    #sudo chmod 755 /
    #sudo chmod 755 /etc/
    #sudo chmod 755 /etc/ssl/
    #sudo chmod 755 /etc/ssl/certs
    #sudo chmod 644 /etc/ssl/certs/ca-certificates.crt

    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer -o /tmp/pyenv-installer

#Install pyenv
bash /tmp/pyenv-installer
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#Install python 2 and 3

if [ ! -z ${PY_VERSIONS+x} ]; then
  for version in $PY_VERSIONS; do
    pyenv install $version
  done
else
  echo "PY_VERSIONS not set"
fi


#Set up shell
cat << 'EOF' > "$HOME"/.pyenvrc
export PATH="$HOME"/.pyenv/bin:"$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

cat << EOF >> "$HOME"/.bash_profile
if [ -f ~/.pyenvrc ]; then
        . ~/.pyenvrc
fi
EOF
