class BubbleStore
  def initialize

  end
end

#require "rubygems"
#gem "activerecord"
#
#ActiveRecord::Base.logger = Logger.new(STDERR)
#ActiveRecord::Base.colorize_logging = true
#ActiveRecord::Base.establish_connection(
#    :adapter => "sqlite3",
#    :dbfile  => ":memory:"
#)
#
#ActiveRecord::Schema.define do
#    create_table :makes do |table|
#      table.column :make_id, :integer
#      table.column :title, :string
#        #table.column :model, :string
#        #table.column :thumb, :string
#    end
#
#    create_table :models do |table|
#      table.column :make_id, :integer
#      table.column :model_id, :integer
#      table.column :title, :string
#    end
#
#    create_table :thumbs do |table|
#      table.column :model_id, :integer
#      table.column :url, :string
#    end
#end
#
#
#class Make < ActiveRecord::Base
#  has_many :models
#end
#
#class Model < ActiveRecord::Base
#  belongs_to :makes
#  has_many :thumbs
#end
#
#class Thumb < ActiveRecord::Base
#  belongs_to :models
#end

