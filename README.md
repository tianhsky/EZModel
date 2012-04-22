# EZModel

Automatically generate model files from database.

## How to use it

###1. Setup database

###2. Prepare ~/config/database.yml, here is a sample:   

	development:
		adapter: mysql2
		reconnect: false
		database: MySchema_development
		pool: 5
		username: root
		password: "123456"
		socket: /var/run/mysqld/mysqld.sock
	test:
		adapter: mysql2
		reconnect: false
		database: MySchema_test
		pool: 5
		username: root
		password: "123456"
		socket: /var/run/mysqld/mysqld.sock
	production:
		adapter: mysql2
		reconnect: false
		database: MySchema_production
		pool: 5
		username: root
		password: "123456"
		socket: /var/run/mysqld/mysqld.sock

###Generate models

cd to rails root directory   

	cd /path_to_rails_root

generate model files   
it will take development as default db environment when environment is not specified  
   
	ezmodel -g
or   

	ezmodel -g -e development

see help   

	ezmodel -h

see version   

	ezmodel -v

## Installation

    gem install ez_model   

See here for more details: [http://rubygems.org/gems/ez_model](http://rubygems.org/gems/ez_model "EZModel RubyGem Page")   

## Authors

Tianyu Huang   
The reverse engine for generating models was created by Bosko Ivanisevic, check out https://github.com/bosko/rmre for details


