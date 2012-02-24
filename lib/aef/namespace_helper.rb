# encoding: UTF-8
=begin
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
=end

# Namespace for projects of Alexander E. Fischer <aef@raxys.net>.
# 
# If you want to be able to simply type Example instead of Aef::Example to
# address classes in this namespace simply write the following before using the
# classes.
#
# @example Including the namespace
#   include Aef
# @author Alexander E. Fischer
module Aef

  # This module is intended to be included into the Class and/or Module class
  # to make namespace helper methods available in all classes/modules.
  # 
  # @see Aef::NamespaceHelper::ClassMethods
  module NamespaceHelper
  
    # The currently loaded library version
    #
    # Using Semantic Versioning (2.0.0-rc.1) rules
    # @see http://semver.org/
    VERSION = '1.0.1'.freeze

    protected

    # This magic method is automatically called when NamespaceHelper is
    # included into a class/module to extend Aef::NamespaceHelper::ClassMethods
    # into the same class/module.
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    # This mixin module is intended to extend a single class/module object to
    # make the helper methods only available on that specific class/module.
    # 
    # @example
    #   First::Second.extend(Aef::NamespaceHelper::ClassMethods)
    #   First::Second.respond_to?(:unprefixed_name) # => true
    # @see Aef::NamespaceHelper
    module ClassMethods

      # The name of the class/module itself, without any namespacing.
      #
      # @return [String] The unprefixed name of the class/module itself
      # @since 1.0.0
      # @example
      #   First::Second::Third.unprefixed_name # => "Third"
      def unprefixed_name
        unprefixed_namespace_component_names.last
      end

      # Lists all namespace components' unprefixed names.
      #
      # @return [Array<String>] All namespace components' unprefixed names.
      #   Ordered, so the class/module itself will be the last element
      # @since 1.0.0
      # @note This will not reference the class/module objects and thus won't
      #   trigger autoloading
      # @example
      #   First::Second::Third.unprefixed_namespace_component_names
      #   # => ["First", "Second", "Third"]
      def unprefixed_namespace_component_names
        if self.name.nil? || self.name == ''
          []
        else
          self.name.split('::')
        end
      end
      
      # Lists all namespace components' names.
      #
      # @return [Array<String>] All namespace components' names. Ordered, so
      #   the class/module itself will be the last element
      # @since 1.0.0
      # @note This will not reference the class/module objects and thus won't
      #   trigger autoloading
      # @example
      #   First::Second::Third.namespace_component_names
      #   # => ["First", "First::Second", "First::Second::Third"]
      def namespace_component_names
        if self.name.nil? || self.name == ''
          []
        else
          unprefixed_names = unprefixed_namespace_component_names
        
          names = []

          while current_name = unprefixed_names.pop
            current_full_name = (unprefixed_names + [current_name]).join('::')
            names.unshift(current_full_name)
          end
          
          names
        end
      end
      
      # Lists all namespace components.
      #
      # @return [Array<Class, Module>] All namespace components. Ordered, so
      #   the class/module itself will be the last element.
      # @since 1.0.0
      # @example
      #   First::Second::Third.namespace_component_names
      #   # => [First, First::Second, First::Second::Third]
      def namespace_components
        components = []
        
        unprefixed_names = unprefixed_namespace_component_names
        current_component = Object
          
        while current_name = unprefixed_names.shift
          current_component = current_component.const_get(current_name)
          components << current_component
        end
        
        components
      end

      # The name of component in the namespace which encapsulates this class/module.
      #
      # @return [String] The name of the parent namespace component
      # @since 1.0.0
      # @note This will not reference the class/module objects and thus won't trigger autoloading
      # @example
      #   First::Second::Third.namespace_parent
      #   # => First::Second
      def namespace_parent_name
        namespace_component_names[-2]
      end

      # The component in the namespace which encapsulates this class/module.
      #
      # @return [Class, Module] The parent namespace component
      # @since 1.0.0
      # @example
      #   First::Second::Third.namespace_parent
      #   # => First::Second
      def namespace_parent
        namespace_components[-2]
      end
    end
  end
end
