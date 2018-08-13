module Photopon
  class Welcome < Sinatra::Base
    get '/' do
      'Welcome to Photopon API'
    end
  end
end