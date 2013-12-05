# HTTParty and API configuration class
class Client
  include HTTParty

  base_uri 'http://eval.so/api/1'
end
