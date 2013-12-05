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
end
