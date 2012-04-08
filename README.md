# EZModel
Generate models and schema.rb from existing database just in one command line. If you prefer design ER diagram and export scripts to generate database schema, or if you have to work with a legacy database, this can save you insane amount of time. All you need to do is to have a database.yml configuraiton file in ~/config/. Besides creating all models it sets proper table name and primary key if tables and columns naming doesn’t follow Rails convention. It also tries to read all foreign keys data from a database.     

It uses [Rmre](https://github.com/bosko/rmre "Rmre") as underlying reverse engine to generate models. I made some modifications to Rmre to support mysql2 adapter, and had those auto-generated model files placed in a subfolder inside ~/app/models/ez_models/ instead of the default ~/app/models/, so that regenerating models will not overwrite the existing ones. Over the times, db schema can ge changed, all it needs is to run the command again to regenerate models, developers can feel free to add methods to the models classes in ~/app/models/ without worrying about being overwritten.


## How it works
First let's take a look at what it does.

In ~/app/models/ez_models/, it will generate model files inherit ActiveRecord::Base    

~/app/models/ez_models/billing_info.rb

	# This file is auto-generated from the current state of the database registered
	# in ~config/database.yml. Instead of editing this file, please go to ~/app/models/
	# and find the file with same name and class that inherits this class
	module EZModel
	    module ActiveRecord
		class BillingInfo < ActiveRecord::Base
		    belongs_to :users, :class_name => 'User', :foreign_key => :user_id
		    belongs_to :invoices, :class_name => 'Invoice', :foreign_key => :invoice_id
		    has_many :chargebacks, :class_name => 'Chargeback'
		end
	    end
	end

Isn't model files supposed to be in ~/app/models/? Take a look at the following first   
In ~/app/models/, it will generate same model files and inherit the above classes   

~/app/models/billing_info.rb

	require File.expand_path('../ez_models/billing_info', __FILE__)
	# Please add your own methods to this class.
	# It's strongly recommended to check this file into your version control system.
	class BillingInfo < EZModel::ActiveRecord::BillingInfo

	end


## How to use it
###Prerequisite
####1. Setup database schema, if you already have a database set up, skip this step;
there are many tools can be use for database design, you can then export scripts to generate db schema;   
checkout mysql-workbench and its forward-engineering feature for more details about designing ER diagram and generate schema;    

####2. Prepare ~/config/database.yml, here is a sample:   

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

generate model files and overwrite existing ones in ~/app/models/   
use this command only if the model files in ~/app/models/ don't inherit EZModel::ActiveRecord    
backup your models files is strongly suggested if you are not sure what it is doing   
use it at your own risk   

	ezmodel -g -o

see help   

	ezmodel -h

see version   

	ezmodel -v

## Installation
    gem instal ez_model   

See here for more details: [http://rubygems.org/gems/ez_model](http://rubygems.org/gems/ez_model "EZModel RubyGem Page")   

## Authors
Tianyu Huang   
The reverse engine for generating models was created by Bosko Ivanisevic, check out https://github.com/bosko/rmre for details


