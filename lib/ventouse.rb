require 'ventouse/filter_prefix'
require 'ventouse/module_declarations'
require 'ventouse/rescue_ext'

if defined? ActiveRecord
  require 'ventouse/ar_touch'
  require 'ventouse/fix_partial_updates'
  require 'ventouse/rename_type_column'
end

if defined? ActionController
  require 'ventouse/resource_as_root'
  require 'ventouse/suppress_logging_for'
end

#unless Gem.available? 'mysql' or Gem.available? 'mysqlplus' or Gem.available? 'activerecord-jdbc-adapter'
#  require 'ventouse/mysql_compat'
#  puts "Pure ruby mysql.rb driver used!"
#end

class Ventouse
  def self.disable_rails_transactions
    require 'ventouse/disable_transactions'
  end

  #http://snippets.dzone.com/posts/show/2137
  def self.random_pronouncable_password(size = 6)
    c = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)
    v = %w(a e i o u y)
    f, r = true, ''
    (size * 2).times do
      r << (f ? c[rand * c.size] : v[rand * v.size])
      f = !f
    end
    r
  end

  def self.ensure_dir_exists dir
    dir.tap { FileUtils.mkdir_p(dir) unless File.exist? dir and File.directory? dir }
  end
end
