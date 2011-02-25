require 'spec_helper'

describe Aef::NamespaceHelper do
  before(:all) do
    samples = [
      Class.new, Module.new,
      Aef::NamespaceHelper::SomeClass = Class.new,
      Aef::NamespaceHelper::SomeClass::SomeModule = Module.new,
      Aef::NamespaceHelper::OtherModule = Module.new,
      Aef::NamespaceHelper::OtherModule::OtherClass = Class.new
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
      @anonymous_class.
        unprefixed_namespace_component_names.should == []
    end

    it "should be an emtpy array for an anonymous module" do
      @anonymous_module.
        unprefixed_namespace_component_names.should == []
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
      @anonymous_class.
        namespace_component_names.should == []
    end

    it "should be an emtpy array for an anonymous module" do
      @anonymous_module.
        namespace_component_names.should == []
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
end
