require "test/unit"
require File.dirname(__FILE__) + "/../lib/ventouse/module_declarations"

module SmokeExt
  declarations do
    self.class_var= "ok"
  end
end

module SecondExt
  declarations do
    self.class_var= "ok2"
  end
end

module MultipleDeclarationsModule
  declarations do
    self.class_var= "x"
  end

  declarations do
    self.class_var+= "x"
  end
end

module IncludedModule
  declarations do
    self.class_var+= "y"
  end
end

module IncludingModule
  declarations do
    self.class_var= "x"
  end

  include IncludedModule

  declarations do
    self.class_var+= "z"
  end
end

class SmokeExpandable
  def self.class_var= var
    @@class_var = var
  end
  
  def self.class_var
    @@class_var if defined? @@class_var
  end
end

class DeclarationsTest < Test::Unit::TestCase
  def test_smoke
    SmokeExpandable.send :include, SmokeExt
    assert_equal "ok", SmokeExpandable.class_var
  end

  def test_second_module
    SmokeExpandable.send :include, SmokeExt
    assert_equal "ok", SmokeExpandable.class_var

    SmokeExpandable.send :include, SecondExt
    assert_equal "ok2", SmokeExpandable.class_var
  end

  def test_multiple_declarations
    SmokeExpandable.send :include, MultipleDeclarationsModule
    assert_equal "xx", SmokeExpandable.class_var
  end

  def test_module_including
    SmokeExpandable.send :include, IncludingModule
    assert_equal "xyz", SmokeExpandable.class_var
  end
end