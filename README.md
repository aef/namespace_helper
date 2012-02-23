NamespaceHelper
===============

[![Build Status](https://secure.travis-ci.org/aef/namespace_helper.png)](
https://secure.travis-ci.org/aef/namespace_helper)

* [Documentation][1]
* [Project][2]

   [1]: http://rdoc.info/projects/aef/namespace_helper/
   [2]: http://github.com/aef/namespace_helper/

Description
-----------

NamespaceHelper provides a module with methods to ease namespace handling.
For example getting the unprefixed name, the namespace parent or a list of
namespace components of a class or module.

Features / Problems
-------------------

This projects tries to conform to:

* [Semantic Versioning (2.0.0-rc.1)][5]
* [Ruby Packaging Standard (0.5-draft)][6]
* [Ruby Style Guide][7]
* [Gem Packaging: Best Practices][8]

   [5]: http://semver.org/
   [6]: http://chneukirchen.github.com/rps/
   [7]: https://github.com/bbatsov/ruby-style-guide
   [8]: http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices

Additional facts:

* Written purely in Ruby.
* Intended to be used with Ruby 1.9.2 or compatible.
* Extends core classes. This can be disabled through bare mode.

Synopsis
--------

This documentation defines the public interface of the library. Don't rely
on elements marked as private. Those should be hidden in the documentation
by default.

### Loading

In most cases you want to load the library by the following command:

~~~~~ ruby
require 'namespace_helper'
~~~~~

In a bundler Gemfile you should use the following:

~~~~~ ruby
gem 'namespace_helper'
~~~~~

By default, NamespaceHelper extends the Class and Module classes to allow their
objects to be castable to Week and Week::Day. Additionally the Aef namespace is
included into Object, so that you don't have to type the fully-qualified names
of the classes. Should you really don't want this, use the following:

~~~~~ ruby
require 'namespace_helper/bare'
~~~~~

Or for bundler Gemfiles:

~~~~~ ruby
gem 'namespace_helper', require: 'namespace_helper/bare'
~~~~~

The first way to load the library won't touch any existing classes but you need
to extend every class or module which should support the helper methods
manually:

~~~~~ ruby
require 'aef/namespace_helper'

module First
  class Second
  end
end

File::Constants.extend(Aef::NamespaceHelper::ClassMethods)

File::Constants.unprefixed_name # => "Constants"
File::Constants.namespace_parent # => File
File::Constants.namespace_parent_name # => "File"
~~~~~

The other way to load the library will enable the helper methods in every
module and class:

~~~~~ ruby
require 'aef/namespace_helper/core_extension'

Process::Status.namespace_components # => [Process, Process::Status]
Process::Status.namespace_component_names # => ["Process", "Process::Status"]
Process::Status.unprefixed_namespace_component_names # => ["Process", "Status"]
~~~~~

Requirements
------------

None

Installation
------------

On *nix systems you may need to prefix the command with sudo to get root
privileges.

### High security (recommended)

There is a high security installation option available through rubygems. It is
highly recommended over the normal installation, although it may be a bit less
comfortable. To use the installation method, you will need my public key, which
I use for cryptographic signatures on all my gems. You can find the public key
here: http://aef.name/crypto/aef-gem.pem

Add the key to your rubygems' trusted certificates by the following command:

    gem cert --add aef-gem.pem

Now you can install the gem while automatically verifying it's signature by the
following command:

    gem install namespace_helper -P HighSecurity

Please notice that you may need other keys for dependent libraries, so you may
have to install dependencies manually.

### Normal

    gem install namespace_helper

### Automated testing

Go into the root directory of the installed gem and run the following command
to fetch all development dependencies:

    bundle

Afterwards start the test runner:

    rake spec

If something goes wrong you should be noticed through failing examples.

Development
-----------

This software is developed in the source code management system git hosted
at github.com. You can download the most recent sourcecode through the
following command:

    git clone https://github.com/aef/namespace_helper.git

Help on making this software better is always very appreciated. If you want
your changes to be included in the official release, please clone my project
on github.com, create a named branch to commit and push your changes in and
send me a pull request afterwards.

Please make sure to write tests for your changes so that I won't break them
when changing other things on the library. Also notice that I can't promise
to include your changes before reviewing them.

License
-------

Copyright 2009 Alexander E. Fischer <aef@raxys.net>

This file is part of NamespaceHelper.

NamespaceHelper is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
