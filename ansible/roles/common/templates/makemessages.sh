source /opt/$1/env/bin/activate
cd /opt/$1/project/src
./manage.py makemessages
./manage.py makemessages -d djangojs
