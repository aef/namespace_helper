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

require 'aef/namespace_helper'

module Aef::NamespaceHelper::SpecHelper
end

RSpec.configure do |config|
  config.include Aef::NamespaceHelper::SpecHelper
end

puts $LOAD_PATH