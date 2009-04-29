require 'ventouse/ar_touch'
require 'ventouse/filter_prefix'
require 'ventouse/module_declarations'
require 'ventouse/rename_type_column'
require 'ventouse/rescue_ext'
require 'ventouse/resource_as_root'

unless Gem.available? 'mysql' or Gem.available? 'mysqlplus'
  require 'ventouse/mysql_compat'
  puts "Pure ruby mysql.rb driver used!"
end

class Ventouse
  def self.disable_rails_transactions
    require 'ventouse/disable_transactions'
  end
end
