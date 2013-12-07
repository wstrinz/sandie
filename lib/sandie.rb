require 'httparty'
require 'sandie/client'

# Main Sandie class which contains methods which communicate with the eval.so API directly
class Sandie
  attr_reader :language

  # Initializes Sandie, and sets the language being evaluated
  #
  # @param args [Hash]
  #   * :language - required, the language being evaluated
  def initialize(**args)
    @language = args[:language] || throw(ArgumentError)
  end

  # Evaluates code, and returns the response Hash
  #
  # @param args [Hash]
  #   * :code - required, the code to evaluate
  #   * :input_files - optional, the files that are placed in the evaluation root. The filename is the key and the contents of the file is a base64 encoded value
  #   * :compilation_only - optional, if true, only compilation will happen and not execution of the result. Defaults to false
  # @return [Hash] the response from eval.so API based on the passed args
  def evaluate(**args)
    throw ArgumentError unless args[:code]
    (throw TypeError unless args[:input_files].kind_of? Hash) if args[:input_files]

    Client.post('/evaluate', {
      headers: { 'Content-Type' => 'application/json' },
      body: {
        'language' => @language,
        'code' => args[:code],
        'inputFiles' => args[:input_files],
        'compilationOnly' => args[:compilation_only]
      }.to_json
    }).parsed_response
  end

  # Returns a Hash of all supported languages
  #
  # @return [Hash] the Hash of languages supported by the eval.so API, with their corresponding "display names"
  def self.languages
    Client.get('/languages').parsed_response
  end
end
