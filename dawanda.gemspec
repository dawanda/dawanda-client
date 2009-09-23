# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dawanda_client}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christoph Bünte"]
  s.date = %q{2009-09-17}
  s.email = %q{info@christophbuente.de}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/dawanda", "lib/dawanda/product.rb", "lib/dawanda/model.rb", "lib/dawanda/request.rb", "lib/dawanda/response.rb", "lib/dawanda/shop.rb", "lib/dawanda/user.rb", "lib/dawanda/category.rb", "lib/dawanda.rb", "test/fixtures", "test/fixtures/getShopDetails.json", "test/test_helper.rb", "test/unit", "test/unit/dawanda", "test/unit/dawanda/shop_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://dawanda.com}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Provides a friendly ruby-like interface to the DaWanda API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, ["~> 1.1.0"])
    else
      s.add_dependency(%q<json>, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<json>, ["~> 1.1.0"])
  end
end
