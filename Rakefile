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

require 'rake'
require 'pathname'
require 'yard'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

YARD::Rake::YardocTask.new

task :clean do
  doc = Pathname('doc')
  doc.rmtree if doc.exist?
  Pathname.glob('*.gem').each &:delete
end

task :default => :spec
