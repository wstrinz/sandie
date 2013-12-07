require 'spec_helper'

describe Sandie do
  describe '#new' do
    let(:sandie_instance) { Sandie.new(language: 'ruby') }

    it 'should be initialized' do
      sandie_instance.should be_an_instance_of Sandie
    end

    it 'should raise ArgumentError if :language is not passed' do
      expect { Sandie.new }.to raise_error ArgumentError
    end

    it 'should have one non-empty not-nil instance variable named "language"' do
      sandie_instance.language.should_not be_nil
      sandie_instance.language.should_not be_empty
    end

    it 'should have an instance variable named "language" with type String' do
      sandie_instance.language.should be_a String
    end
  end

  describe '#languages' do
    let(:response) { Sandie.languages }

    it 'should exist' do
      Sandie.methods.should include :languages
    end

    it 'should return a Hash' do
      response.should be_a Hash
    end

    it 'should include certain keys' do
      ['ruby', 'jruby18', 'java', 'c'].each { |i| response.should include i }
    end
  end
end
