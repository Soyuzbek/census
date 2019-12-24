# census
# install 
#  python > 3.5
#  postgresql == 10.xx
#  pgadmin 4
#  git
#
### Open cmd or terminal

### psql -U postgres
### create database censusdb;
### create user soyuzbek with password 'census';
### alter role soyuzbek set client_encoding to 'utf8';
### alter role soyuzbek set default_transaction_encoding to 'read committed';
### alter role soyuzbek set timezone to 'utc';
### grant all privileges on database censusdb to soyuzbek;
### \q

### git clone https://github.com/soyuzbek/census.git
### mkvirtualenv env
### env\Scripts\activate
### pip install -r req.txt
### python manage.py migrate
### python manage.py runserver
