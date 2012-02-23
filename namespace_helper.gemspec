# encoding: UTF-8
#
# Copyright Alexander E. Fischer <aef@raxys.net>, 2010-2011
#
# This file is part of NamespaceHelper.
#
# NamespaceHelper is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

$LOAD_PATH << 'lib'

require 'namespace_helper/bare'

Gem::Specification.new do |s|
  s.name        = 'namespace_helper'
  s.version     = Aef::NamespaceHelper::VERSION.dup
  s.authors     = ['Alexander E. Fischer']
  s.email       = ['aef@raxys.net']
  s.homepage    = 'http://github.com/aef/namespace_helper'
  s.license     = 'ISC'
  s.summary     = 'Helper methods for class/module namespace handling'
  s.description = <<-DESCRIPTION
NamespaceHelper provides a module with methods to ease namespace handling.
For example getting the unprefixed name, the namespace parent or a list of
namespace components of a class or module.
  DESCRIPTION

  s.rubyforge_project = nil
  s.has_rdoc          = 'yard'
  s.extra_rdoc_files  = ['HISTORY.md', 'LICENSE.md']

  s.files         = `git ls-files`.lines.map(&:chomp)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.lines.map(&:chomp)
  s.executables   = `git ls-files -- bin/*`.lines.map{|f| File.basename(f.chomp) }
  s.require_paths = ["lib"]

  s.add_development_dependency('bundler', '~> 1.0.21')
  s.add_development_dependency('rake', '~> 0.9.2')
  s.add_development_dependency('rspec', '~> 2.6.0')
  s.add_development_dependency('simplecov', '~> 0.5.4')
  s.add_development_dependency('pry', '~> 0.9.8')
  s.add_development_dependency('yard', '~> 0.7.5')
  s.add_development_dependency('maruku', '~> 0.6.0')

  s.cert_chain = "#{ENV['GEM_CERT_CHAIN']}".split(':')
  s.signing_key = ENV['GEM_SIGNING_KEY']
end
