unless Gem.available? 'mysql' or Gem.available? 'mysqlplus'
  require 'mysql_compat'
  puts "Pure ruby mysql.rb driver used!"
end
