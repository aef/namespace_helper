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

Gem::Specification.new do |spec|
  spec.author = 'Alexander E. Fischer'
  spec.add_development_dependency('rspec', '~> 2.4.0')
  spec.add_development_dependency('yard', '~> 0.6.4')
  spec.description = <<-EOS
    NamespaceHelper provides a module with methods to ease namespace handling.
    For example getting the unprefixed name, the namespace parent or a list of
    namespace components of a class or module.
  EOS
  spec.rubyforge_project = 'aef'
  spec.email = 'aef@raxys.net'
  spec.extra_rdoc_files = 'README.rdoc'
  spec.has_rdoc = true
  spec.homepage = 'https://rubyforge.org/projects/aef/'
  spec.license = 'GPL-3'
  spec.name = 'namespace_helper'
  spec.rdoc_options = ['--title', 'NamespaceHelper',
                       '--main', 'README.rdoc',
                       '--inline-source',
                       '--line-numbers']
  spec.required_ruby_version = '>= 1.8.7'
  spec.summary = 'Helper methods for class/module namespace handling'
  spec.version = '0.1.0'
end
