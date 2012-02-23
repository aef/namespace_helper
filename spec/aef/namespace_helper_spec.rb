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

require 'spec_helper'
require 'namespace_helper/bare'

describe Aef::NamespaceHelper do
  before(:all) do
    samples = [
      Class.new, Module.new,
      Aef::NamespaceHelper::SomeClass = Class.new,
      Aef::NamespaceHelper::SomeClass::SomeModule = Module.new,
      Aef::NamespaceHelper::OtherModule = Module.new,
      Aef::NamespaceHelper::OtherModule::OtherClass = Class.new,
      AefNamespaceHelperParentlessClass = Class.new,
      AefNamespaceHelperParentlessModule = Module.new
    ]

    samples.each do |sample|
      sample.extend(Aef::NamespaceHelper::ClassMethods)
    end

    @anonymous_class  = samples[0]
    @anonymous_module = samples[1]
  end

  describe "unprefixed name" do
    it "should be nil for an anonymous class" do
      @anonymous_class.unprefixed_name.should be_nil
    end

    it "should be nil for an anonymous module" do
      @anonymous_module.unprefixed_name.should be_nil
    end

    it "should be SomeClass for Aef::NamespaceHelper::SomeClass" do
      Aef::NamespaceHelper::SomeClass.
        unprefixed_name.should == 'SomeClass'
    end

    it "should be SomeModule for Aef::NamespaceHelper::SomeClass::SomeModule" do
      Aef::NamespaceHelper::SomeClass::SomeModule.
        unprefixed_name.should == 'SomeModule'
    end

    it "should be OtherModule for Aef::NamespaceHelper::OtherModule" do
      Aef::NamespaceHelper::OtherModule.
        unprefixed_name.should == 'OtherModule'
    end

    it "should be OtherClass for Aef::NamespaceHelper::OtherModule::OtherClass" do
      Aef::NamespaceHelper::OtherModule::OtherClass.
        unprefixed_name.should == 'OtherClass'
    end
  end

  describe "unprefixed_namespace_component_names" do
    it "should be an empty array for an anonymous class" do
      @anonymous_class.unprefixed_namespace_component_names.should == []
    end

    it "should be an emtpy array for an anonymous module" do
      @anonymous_module.unprefixed_namespace_component_names.should == []
    end

    it "should list all unprefixed namespace component names for Aef::NamespaceHelper::SomeClass" do
      Aef::NamespaceHelper::SomeClass.unprefixed_namespace_component_names.should ==
        ['Aef', 'NamespaceHelper', 'SomeClass']
    end

    it "should list all unprefixed namespace component names for Aef::NamespaceHelper::SomeClass::SomeModule" do
      Aef::NamespaceHelper::SomeClass::SomeModule.unprefixed_namespace_component_names.should ==
        ['Aef', 'NamespaceHelper', 'SomeClass', 'SomeModule']
    end

    it "should list all unprefixed namespace component names for Aef::NamespaceHelper::OtherModule" do
      Aef::NamespaceHelper::OtherModule.unprefixed_namespace_component_names.should ==
        ['Aef', 'NamespaceHelper', 'OtherModule']
    end

    it "should list all unprefixed namespace component names for Aef::NamespaceHelper::OtherModule::OtherClass" do
      Aef::NamespaceHelper::OtherModule::OtherClass.unprefixed_namespace_component_names.should ==
        ['Aef', 'NamespaceHelper', 'OtherModule', 'OtherClass']
    end
  end
  
  describe "namespace_component_names" do
    it "should be an empty array for an anonymous class" do
      @anonymous_class.namespace_component_names.should == []
    end

    it "should be an emtpy array for an anonymous module" do
      @anonymous_module.namespace_component_names.should == []
    end

    it "should list all namespace component names for Aef::NamespaceHelper::SomeClass" do
      Aef::NamespaceHelper::SomeClass.namespace_component_names.should == [
        'Aef',
        'Aef::NamespaceHelper',
        'Aef::NamespaceHelper::SomeClass'
      ]
    end

    it "should list all namespace component names for Aef::NamespaceHelper::SomeClass::SomeModule" do
      Aef::NamespaceHelper::SomeClass::SomeModule.namespace_component_names.should == [
        'Aef',
        'Aef::NamespaceHelper',
        'Aef::NamespaceHelper::SomeClass',
        'Aef::NamespaceHelper::SomeClass::SomeModule'
      ]
    end

    it "should list all namespace component names for Aef::NamespaceHelper::OtherModule" do
      Aef::NamespaceHelper::OtherModule.namespace_component_names.should == [
        'Aef',
        'Aef::NamespaceHelper',
        'Aef::NamespaceHelper::OtherModule'
      ]
    end

    it "should list all namespace component names for Aef::NamespaceHelper::OtherModule::OtherClass" do
      Aef::NamespaceHelper::OtherModule::OtherClass.namespace_component_names.should == [
        'Aef',
        'Aef::NamespaceHelper',
        'Aef::NamespaceHelper::OtherModule',
        'Aef::NamespaceHelper::OtherModule::OtherClass',        
      ]
    end
  end
  
  describe "namespace_components" do
    it "should be an empty array for an anonymous class" do
      @anonymous_class.namespace_components.should == []
    end

    it "should be an emtpy array for an anonymous module" do
      @anonymous_module.namespace_components.should == []
    end

    it "should list all namespace component names for Aef::NamespaceHelper::SomeClass" do
      Aef::NamespaceHelper::SomeClass.namespace_components.should == [
        Aef,
        Aef::NamespaceHelper,
        Aef::NamespaceHelper::SomeClass
      ]
    end

    it "should list all namespace component names for Aef::NamespaceHelper::SomeClass::SomeModule" do
      Aef::NamespaceHelper::SomeClass::SomeModule.namespace_components.should == [
        Aef,
        Aef::NamespaceHelper,
        Aef::NamespaceHelper::SomeClass,
        Aef::NamespaceHelper::SomeClass::SomeModule
      ]
    end

    it "should list all namespace component names for Aef::NamespaceHelper::OtherModule" do
      Aef::NamespaceHelper::OtherModule.namespace_components.should == [
        Aef,
        Aef::NamespaceHelper,
        Aef::NamespaceHelper::OtherModule
      ]
    end

    it "should list all namespace component names for Aef::NamespaceHelper::OtherModule::OtherClass" do
      Aef::NamespaceHelper::OtherModule::OtherClass.namespace_components.should == [
        Aef,
        Aef::NamespaceHelper,
        Aef::NamespaceHelper::OtherModule,
        Aef::NamespaceHelper::OtherModule::OtherClass
      ]
    end
  end
  
  describe "namespace_parent_name" do
    it "should be nil for an anonymous class" do
      @anonymous_class.namespace_parent_name.should == nil
    end

    it "should be nil for an anonymous module" do
      @anonymous_module.namespace_parent_name.should == nil
    end

    it "should be nil if a class has no namespace parent" do
      AefNamespaceHelperParentlessClass.namespace_parent.should == nil
    end
    
    it "should be nil if a module has no namespace parent" do
      AefNamespaceHelperParentlessModule.namespace_parent.should == nil
    end

    it "should be Aef::NamespaceHelper for Aef::NamespaceHelper::SomeClass" do
      Aef::NamespaceHelper::SomeClass.
        namespace_parent_name.should == 'Aef::NamespaceHelper'
    end

    it "should be Aef::NamespaceHelper::SomeClass for Aef::NamespaceHelper::SomeClass::SomeModule" do
      Aef::NamespaceHelper::SomeClass::SomeModule.
        namespace_parent_name.should == 'Aef::NamespaceHelper::SomeClass'
    end

    it "should be Aef::NamespaceHelper for Aef::NamespaceHelper::OtherModule" do
      Aef::NamespaceHelper::OtherModule.
        namespace_parent_name.should == 'Aef::NamespaceHelper'
    end

    it "should be Aef::NamespaceHelper::OtherModule for Aef::NamespaceHelper::OtherModule::OtherClass" do
      Aef::NamespaceHelper::OtherModule::OtherClass.
        namespace_parent_name.should == 'Aef::NamespaceHelper::OtherModule'
    end
  end
  
  describe "namespace_parent" do
    it "should be nil for an anonymous class" do
      @anonymous_class.namespace_parent.should == nil
    end

    it "should be nil for an anonymous module" do
      @anonymous_module.namespace_parent.should == nil
    end
    
    it "should be nil if a class has no namespace parent" do
      AefNamespaceHelperParentlessClass.namespace_parent.should == nil
    end
    
    it "should be nil if a module has no namespace parent" do
      AefNamespaceHelperParentlessModule.namespace_parent.should == nil
    end

    it "should be Aef::NamespaceHelper for Aef::NamespaceHelper::SomeClass" do
      Aef::NamespaceHelper::SomeClass.
        namespace_parent.should == Aef::NamespaceHelper
    end

    it "should be Aef::NamespaceHelper::SomeClass for Aef::NamespaceHelper::SomeClass::SomeModule" do
      Aef::NamespaceHelper::SomeClass::SomeModule.
        namespace_parent.should == Aef::NamespaceHelper::SomeClass
    end

    it "should be Aef::NamespaceHelper for Aef::NamespaceHelper::OtherModule" do
      Aef::NamespaceHelper::OtherModule.
        namespace_parent.should == Aef::NamespaceHelper
    end

    it "should be Aef::NamespaceHelper::OtherModule for Aef::NamespaceHelper::OtherModule::OtherClass" do
      Aef::NamespaceHelper::OtherModule::OtherClass.
        namespace_parent.should == Aef::NamespaceHelper::OtherModule
    end
  end
  
  describe "core extension" do
    it "should add the helper methods to all classes and modules" do
      lambda {
        require 'namespace_helper'
      }.should change{
        [ Integer.respond_to?(:unprefixed_namespace_component_names),
          Float.respond_to?(:unprefixed_name),
          Object.respond_to?(:namespace_component_names),
          Regexp.respond_to?(:namespace_components),
          File.respond_to?(:namespace_parent_name),
          String.respond_to?(:namespace_parent) ].all?
      }.from(false).to(true)
    end
  end
end
