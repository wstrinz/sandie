require 'spec_helper'

describe Sandie do
  describe '#new' do
    before(:each) do
      @sandie = Sandie.new(language: 'ruby')
    end

    it 'should be initialized' do
      @sandie.should be_an_instance_of Sandie
    end

    it 'should raise ArgumentError if :language is not passed' do
      expect { Sandie.new }.to raise_error ArgumentError
    end

    it 'should have one non-empty not-nil instance variable named "language"' do
      @sandie.language.should_not be_nil
      @sandie.language.should_not be_empty
    end

    it 'should have an instance variable named "language" with type String' do
      @sandie.language.should be_a String
    end
  end

  describe '#languages' do
    before(:each) do
      @sandie = Sandie.new(language: 'ruby')
    end
    let(:response) { @sandie.languages }

    it 'should exist' do
      @sandie.methods.should include :languages
    end

    it 'should return a Hash' do
      response.should be_a Hash
    end

    it 'should include certain keys' do
      response.should include 'ruby'
      response.should include 'jruby18'
      response.should include 'java'
      response.should include 'c'
    end
  end
end
