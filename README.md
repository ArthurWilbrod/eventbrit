# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

################## Creation du dossier avec DB en postgresql
rails _5.2.3_ new -d postgresql Eventbrite
##################


################## Installer les Gem
ajout de gem :
gem 'database_cleaner'
gem 'table_print' : rails c exemple :  > tp User.all
gem 'faker'
bundle install
##################


################## creer la db
rails db:create
##################

################## créer un modèle et sa migration permettant de creer sa table
rails g model User
rails g model Event
rails g model Participation
##################


####### ex : event --> ajout des element de la table

t.datetime :start_date
t.integer :duration
t.string :title
t.text :description
t.integer :price
t.string :location
t.belongs_to :user, index: true

###### participation model

has_many :participations
has_many :users, through: :participations
belongs_to :user

######

#######

rails db:migrate

rails db:migrate:status

rails c ou rails db:seed

######
#####Git
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/ArthurWilbrod/Evenbrite_thp.git
git push -u origin master

####

#####Heroku

heroku --version
heroku login
// heroku keys:add
heroku create
heroku apps:rename newname

git remote --v
git push heroku master
heroku run rails db:migrate #optionnel si tu as une migration à migrer


heroku apps:destroy

####



###### Push

push on giit or commit on git then push on heroku


######

###### Mailleur !!!!
rails g mailer UserMailer

ajout du mail app/views/user_mailer/welcome_email.html.erb

depuis un model : UserMailer.welcome_email(user).deliver_now

En développement, gem "letter_opener" pour visualiser dans son navigateur le rendu visuel des e-mails envoyés

En production, il faudra paramétrer un serveur SMTP dans /config/environment.rb

######





#### controller
rails g controller events
creer Crud et views
rails routes
rails server

#####

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
