# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ventouse}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ilia Ablamonov", "Artem Orlov"]
  s.date = %q{2009-08-04}
  s.description = %q{Various usefull ruby/rails shit}
  s.email = %q{pro@grammable.com}
  s.files = [
      "README",
      "lib/ventouse",
      "lib/ventouse/ar_touch.rb",
      "lib/ventouse/disable_transactions.rb",
      "lib/ventouse/filter_prefix.rb",
      "lib/ventouse/fix_partial_updates.rb",
      "lib/ventouse/module_declarations.rb",
      "lib/ventouse/mysql_compat.rb",
      "lib/ventouse/rename_type_column.rb",
      "lib/ventouse/rescue_ext.rb",
      "lib/ventouse/resource_as_root.rb",
      "lib/ventouse/suppress_logging_for.rb",
      "lib/ventouse.rb",
      "test/declarations_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/programmable/ventouse}
  s.rdoc_options = ["--quiet", "--main=README", "--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{Various usefull ruby/rails shit.}
  s.test_files = [
    "test/declarations_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 2.3.2"])
    else
      s.add_dependency(%q<rails>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<rails>, [">= 2.3.2"])
  end
end