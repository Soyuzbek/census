# census
# install 
#  python >= 3.8
#  postgresql
#  python-pipenv
#
### Open cmd or terminal

### psql -U postgres
### create database <db-name>;
### create user <db-role> with password '<strong-pwd>';
### alter role <db-role> set client_encoding to 'utf8';
### alter role <db-role> set default_transaction_isolation to 'read committed';
### alter role <db-role> set timezone to 'Asia/Bishkek';
### grant all privileges on database <db-name> to <db-role>;
### \q

### git clone https://github.com/soyuzbek/census.git
### pipenv install
### pipenv shell
### python manage.py migrate
### python manage.py runserver
