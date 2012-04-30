NamespaceHelper
===============

[![Build Status](https://secure.travis-ci.org/aef/namespace_helper.png)](
https://secure.travis-ci.org/aef/namespace_helper)

* [Documentation][docs]
* [Project][project]

   [docs]:    http://rdoc.info/projects/aef/namespace_helper/
   [project]: https://github.com/aef/namespace_helper/

Description
-----------

NamespaceHelper provides a module with methods to ease namespace handling.
For example getting the unprefixed name, the namespace parent or a list of
namespace components of a class or module.

Features / Problems
-------------------

This project tries to conform to:

* [Semantic Versioning (2.0.0-rc.1)][semver]
* [Ruby Packaging Standard (0.5-draft)][rps]
* [Ruby Style Guide][style]
* [Gem Packaging: Best Practices][gem]

   [semver]: http://semver.org/
   [rps]:    http://chneukirchen.github.com/rps/
   [style]:  https://github.com/bbatsov/ruby-style-guide
   [gem]:    http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices

Additional facts:

* Written purely in Ruby.
* Documented with YARD.
* Intended to be used with Ruby 1.8.7 or higher.
* Extends core classes. This can be disabled through bare mode.
* Cryptographically signed gem and git tags.

Synopsis
--------

This documentation defines the public interface of the software. Don't rely
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

By default, NamespaceHelper extends the Class and Module classes to allow make
all classes and modules support the namespace helper methods. Should you really don't want this, use the following:

~~~~~ ruby
require 'namespace_helper/bare'
~~~~~

Or for bundler Gemfiles:

~~~~~ ruby
gem 'namespace_helper', require: 'namespace_helper/bare'
~~~~~

### Usage

In normal mode, you can now ask every class or module namespace related
stuff:

~~~~~ ruby
Process::Status.namespace_components
# => [Process, Process::Status]

Process::Status.namespace_component_names
# => ["Process", "Process::Status"]

Process::Status.unprefixed_namespace_component_names
# => ["Process", "Status"]
~~~~~

See {Aef::NamespaceHelper::ClassMethods} for a list of available methods.

If you're using the bare mode, you have to manually extend a class or module
for which you require namespace information:

~~~~~ ruby
File::Constants.extend(Aef::NamespaceHelper::ClassMethods)

File::Constants.unprefixed_name
# => "Constants"

File::Constants.namespace_parent
# => File

File::Constants.namespace_parent_name
# => "File"
~~~~~

Requirements
------------

* Ruby 1.8.7 or higher

Installation
------------

On *nix systems you may need to prefix the command with sudo to get root
privileges.

### High security (recommended)

There is a high security installation option available through rubygems. It is
highly recommended over the normal installation, although it may be a bit less
comfortable. To use the installation method, you will need my [gem signing
public key][gemkey], which I use for cryptographic signatures on all my gems.

Add the key to your rubygems' trusted certificates by the following command:

    gem cert --add aef-gem.pem

Now you can install the gem while automatically verifying it's signature by the
following command:

    gem install namespace_helper -P HighSecurity

Please notice that you may need other keys for dependent libraries, so you may
have to install dependencies manually.

   [gemkey]: https://aef.name/crypto/aef-gem.pem

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

### Bugs Reports and Feature Requests

Please use the [issue tracker][issues] on github.com to let me know about errors
or ideas for improvement of this software.

   [issues]: https://github.com/aef/namespace_helper/issues/

### Source code

This software is developed in the source code management system git hosted
at github.com. You can download the most recent sourcecode through the
following command:

    git clone https://github.com/aef/namespace_helper.git

The final commit before each released gem version will be marked by a tag
named like the version with a prefixed lower-case "v", as required by Semantic
Versioning. Every tag will be signed by my [OpenPGP public key][openpgp] which
enables you to verify your copy of the code cryptographically.

   [openpgp]: https://aef.name/crypto/aef-openpgp.asc

Add the key to your GnuPG keyring by the following command:

    gpg --import aef-openpgp.asc

This command will tell you if your code is of integrity and authentic:

    git tag -v [TAG NAME]

### Contribution

Help on making this software better is always very appreciated. If you want
your changes to be included in the official release, please clone my project
on github.com, create a named branch to commit and push your changes into and
send me a pull request afterwards.

Please make sure to write tests for your changes so that I won't break them
when changing other things on the library. Also notice that I can't promise
to include your changes before reviewing them.

License
-------

Copyright Alexander E. Fischer <aef@raxys.net>, 2012

This file is part of NamespaceHelper.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
