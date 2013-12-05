require 'spec_helper'

describe Sandie do
  describe '#evaluate' do
    before(:each) do
      @sandie = Sandie.new(language: 'ruby')
    end

    it 'should exist' do
      @sandie.methods.should include :evaluate
    end

    it 'should not raise error if :language is or is not passed' do
      expect { @sandie.evaluate(code: '') }.to_not raise_error
      expect { @sandie.evaluate(language: '', code: '') }.to_not raise_error
    end

    it 'should raise ArgumentError if :code is not passed' do
      expect { @sandie.evaluate }.to raise_error ArgumentError
    end

    context 'when "puts \'hello world\'" is passed as :code' do
      let(:response) { @sandie.evaluate(code: "puts 'hello world'") }

      it 'should respond with a Hash' do
        response.should be_a Hash
      end

      it 'should and should not include various keys' do
        response.should include 'stdout'
        response.should include 'stderr'
        response.should include 'wallTime'
        response.should include 'exitCode'
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

    context 'when code and input files are passed' do
      let(:response) do
        @sandie.evaluate(
          code: 'require "./input_file"',
          input_files: {
            'input_file.rb' => 'cHV0cyAiaGVsbG8gd29ybGQi' # puts "hello world"
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
