require 'spec_helper'

describe Photopon::Welcome do
  
  def app
    @app ||= Photopon::Welcome
  end
  
  describe "GET '/'" do
    it "should be successful" do
      get '/'
      last_response.should be_ok
    end
  end
end
