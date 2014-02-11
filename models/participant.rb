require 'sinatra/activerecord'
require 'active_record'

configure :development do
  # connect to the database
  dbconfig = YAML.load(File.read('config/database.yml'))
  ActiveRecord::Base.establish_connection dbconfig['development']

  begin
    ActiveRecord::Schema.define do
      create_table :participants do |t|
        t.string :name, :null => false, :limit => 100
        t.string :email, :null => false, :limit => 50
      end
    end
  rescue ActiveRecord::StatementInvalid
    # do nothing - gobble up the error
  end
end

configure :production do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  begin
    ActiveRecord::Schema.define do
      create_table :participants do |t|
        t.string :name, :null => false, :limit => 100
        t.string :email, :null => false, :limit => 50
      end
    end
  rescue ActiveRecord::StatementInvalid
    # do nothing - gobble up the error
  end
end

# define a simple model
class Participant < ActiveRecord::Base
end
