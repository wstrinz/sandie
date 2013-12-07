require 'spec_helper'
require 'base64'

describe Sandie do
  describe '#evaluate' do
    let(:sandie_instance) { Sandie.new(language: 'ruby') }

    it 'should exist' do
      sandie_instance.methods.should include :evaluate
    end

    it 'should not raise error if :language is or is not passed' do
      expect { sandie_instance.evaluate(code: '') }.to_not raise_error
      expect { sandie_instance.evaluate(language: '', code: '') }.to_not raise_error
    end

    it 'should raise ArgumentError if :code is not passed' do
      expect { sandie_instance.evaluate }.to raise_error ArgumentError
    end

    context 'when "puts \'hello world\'" is passed as :code' do
      let(:response) { sandie_instance.evaluate(code: "puts 'hello world'") }

      it 'should respond with a Hash' do
        response.should be_a Hash
      end

      it 'should and should not include various keys' do
        %w{ stdout stderr wallTime exitCode }.each { |i| response.should include i }
        response.should_not include 'outputFiles'
        response.should_not include 'compilationResult'
      end

      it 'should evaluate to "hello world\n"' do
        expect(response['stdout']).to eq "hello world\n"
      end

      it 'should not have any errors' do
        expect(response['stderr']).to be_empty
      end
    end

    context 'when manually specifying language' do
      let(:csharp_instance) { Sandie.new(language: 'csharp')}

      it 'allows manually specifying language on evaluate' do
        csharp_instance.evaluate(
          code: 'require "./input_file"',
          language: 'ruby',
          input_files: {
            'input_file.rb' => Base64.encode64('puts "hello world"')
          }
        )['stdout'].should == "hello world\n"
      end
    end

    context 'when code and input files are passed' do
      let(:response) do
        sandie_instance.evaluate(
          code: 'require "./input_file"',
          input_files: {
            'input_file.rb' => Base64.encode64('puts "hello world"')
          }
        )
      end

      it 'should evaluate to "hello world\n" and not have any errors' do
        expect(response['stdout']).to eq "hello world\n"
        expect(response['stderr']).to be_empty
      end
    end
  end
end
